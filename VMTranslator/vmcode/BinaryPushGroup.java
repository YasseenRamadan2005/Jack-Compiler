package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.Objects;

public class BinaryPushGroup extends PushGroup {
    private PushGroup left, right;
    private ArithmeticInstruction.Op op;

    public BinaryPushGroup(PushGroup left, PushGroup right, ArithmeticInstruction.Op op) {
        this.left = left;
        this.right = right;
        this.op = op;
    }

    @Override
    public boolean isConstant() {
        return left.isConstant() && right.isConstant();
    }

    @Override
    public short getConstant() {
        return (short) switch (op) {
            case ADD -> left.getConstant() + right.getConstant();
            case SUB -> left.getConstant() - right.getConstant();
            case AND -> left.getConstant() & right.getConstant();
            case OR -> left.getConstant() | right.getConstant();
            case GT -> left.getConstant() > right.getConstant() ? -1 : 0;
            case EQ -> left.getConstant() == right.getConstant() ? -1 : 0;
            case LT -> left.getConstant() < right.getConstant() ? -1 : 0;
            default -> throw new IllegalStateException("Unsupported op " + op);
        };
    }

    @Override
    public List<String> decode() throws Exception {
        List<String> asm = new ArrayList<>();
        if (isConstant()) {
            short constant = getConstant();
            if (Math.abs(constant) <= 1) {
                asm.addAll(List.of("@SP", "AM=M+1", "A=A-1", "M=" + constant));
            } else {
                asm.addAll(setD());
                asm.addAll(List.of("@SP", "AM=M+1", "A=A-1", "M=D"));
            }
        }
        if (right.isConstant() || left.isConstant()) {
            int constant = right.isConstant() ? right.getConstant() : left.getConstant();
            PushGroup other = right.isConstant() ? left : right;
            //Handle M+1 or M-1 optimizations
            if ((constant == 1 || constant == 0) && other instanceof PushInstruction p && (op == ArithmeticInstruction.Op.ADD || (op == ArithmeticInstruction.Op.SUB && right.isConstant()))) {
                asm.addAll(p.decode());
                if (Math.abs(constant) == 1) {
                    asm.removeLast();
                    asm.add("M=" + opToDOperation("1", false));
                }
                return asm;
            }
        }
        asm.addAll(setD());
        asm.addAll(List.of("@SP", "AM=M+1", "A=A-1", "M=D"));

        return asm;
    }

    @Override
    List<String> setD() throws Exception {
        if (isConstant()) {
            PushInstruction p = new PushInstruction(new Address("constant", getConstant()));
            return p.setD();
        }

        List<String> asm = new ArrayList<>();

        if (left.equals(right)) {
            if (op.isCompare()) {
                if (op == ArithmeticInstruction.Op.EQ) {
                    asm.add("D=-1");
                } else {
                    asm.add("D=0");
                }
            } else {
                asm.addAll(left.setD());
                //if it's a Push Instruction, setting the D register automatically sets the M register too
                asm.addAll(left instanceof PushInstruction ? List.of("D=" + opToDOperation("M", false)) : List.of("@R13", "M=D", "D=" + opToDOperation("M", false)));
                return asm;
            }
        }

        if (right.isConstant() || left.isConstant()) {
            PushGroup constant = right.isConstant() ? right : left;
            PushGroup other = right.isConstant() ? left : right;
            boolean isPI = other instanceof PushInstruction;
            List<String> otherD = isPI ? ((PushInstruction) other).getAddress().resolveAddressTo("A") : other.setD();

            if (Math.abs(constant.getConstant()) <= 1) {
                if (op.isCompare()) return doCompare(op, left, right);

                if (op == ArithmeticInstruction.Op.AND) return switch (constant.getConstant()) {
                    case 1 -> combine(otherD, "D=M", "@1", "D=D&A");
                    case -1 -> isPI ? ((PushInstruction) other).setD() : otherD;
                    default -> List.of("D=0");
                };

                if (op == ArithmeticInstruction.Op.OR) return switch (constant.getConstant()) {
                    case 1 -> combine(otherD, "D=M", "@1", "D=D|A");
                    case -1 -> List.of("D=-1");
                    default -> isPI ? ((PushInstruction) other).setD() : otherD;
                };

                if ((op == ArithmeticInstruction.Op.ADD && constant.getConstant() == 1) || (op == ArithmeticInstruction.Op.SUB && constant.getConstant() == -1))
                    return combine(otherD, "D=M+1");

                if ((op == ArithmeticInstruction.Op.ADD && constant.getConstant() == -1) || (op == ArithmeticInstruction.Op.SUB && constant.getConstant() == 1)) {
                    //Handle the 1-D case here
                    if (left.isConstant()) {
                        List<String> a = new ArrayList<>(combine(otherD, "D=M-1"));
                        a.add("D=-D");
                        return a;
                    }
                    return combine(otherD, "D=M-1");
                }

                return isPI ? ((PushInstruction) other).setD() : otherD;
            } else if (op.isCompare()) {
                return doCompare(op, left, right);
            } else if (constant.getConstant() >= 0) {
                asm.addAll(other.setD());
                asm.addAll(List.of("@" + Math.abs(constant.getConstant()), "D=" + opToDOperation("A", left.isConstant())));
                return asm;
            }
        }

        if (left instanceof PushInstruction pLeft && right instanceof PushInstruction pRight) {
            Address a1 = pLeft.getAddress(), a2 = pRight.getAddress();
            String seg = a1.getSegment();
            Set<String> pointerSegments = Set.of("local", "argument", "this", "that");

            if (seg.equals(a2.getSegment()) && pointerSegments.contains(seg)) {
                int i1 = a1.getIndex(), i2 = a2.getIndex(), diff = i1 - i2;
                int absDiff = Math.abs(diff);

                if (absDiff < 4 && Set.of(ArithmeticInstruction.Op.OR, ArithmeticInstruction.Op.AND, ArithmeticInstruction.Op.ADD, ArithmeticInstruction.Op.SUB).contains(op)) {
                    boolean leftIsMax = i1 > i2;

                    PushInstruction high = leftIsMax ? pLeft : pRight;

                    asm.addAll(high.setD()); // sets D = M and A aligned to high
                    for (int i = 0; i < absDiff; i++)
                        asm.add("A=A-1");

                    String dOp = switch (op) {
                        case OR -> "D|M";
                        case AND -> "D&M";
                        case ADD -> "D+M";
                        case SUB -> leftIsMax ? "D-M" : "M-D"; // must respect operand order
                        default -> throw new IllegalStateException("Unexpected op " + op);
                    };

                    asm.add("D=" + dOp);
                    return asm;
                }
            }
        }


        if (op.isCompare()) return doCompare(op, left, right);
        asm.addAll(left.decode());
        asm.addAll(right.setD());
        asm.addAll(List.of("@SP", "AM=M-1"));
        asm.add("D=" + opToDOperation("M", true));
        return asm;
    }


    private List<String> combine(List<String> base, String... extra) {
        List<String> result = new ArrayList<>(base);
        result.addAll(List.of(extra));
        return result;
    }

    private List<String> doCompare(ArithmeticInstruction.Op op, PushGroup left, PushGroup right) throws Exception {
        //For compare instructions, when jumping to the proper label, I need the return address in register 13, and the difference in D
        String ret = VMParser.currentFunction + "." + op + "." + ArithmeticInstruction.counter++;
        if (ret.equals("Memory.get_best_fit.EQ.52")) {
            int x = 0;
        }
        //push the label on the stack
        List<String> asm = new ArrayList<>(List.of("@" + ret, "D=A", "@SP", "AM=M+1", "A=A-1", "M=D"));
        asm.addAll(new BinaryPushGroup(left, right, ArithmeticInstruction.Op.SUB).setD());
        asm.addAll(List.of("@14", "M=D", "@SP", "AM=M-1", "D=M", "@13", "M=D", "@14", "D=M"));
        asm.add(switch (op) {
            case LT -> "@DO_LT";
            case EQ -> "@DO_EQ";
            case GT -> "@DO_GT";
            default -> throw new IllegalStateException("Unexpected op " + op);
        });
        asm.addAll(List.of("0;JMP", "(" + ret + ")"));
        return asm;
    }


    // Helper method: returns true if this pushgroup's setD doesn't use R13
    private boolean canUseR13(PushGroup pg) {
        return (pg instanceof PushInstruction) || (pg instanceof UnaryPushGroup u && u.isBasic());
    }


    private String opToDOperation(String operand, boolean flip) {
        return switch (op) {
            case ADD -> "D+" + operand;
            case AND -> "D&" + operand;
            case OR -> "D|" + operand;
            case SUB -> flip ? operand + "-D" : "D-" + operand;
            default -> throw new IllegalStateException("Unsupported binary op " + op);
        };
    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof BinaryPushGroup other)) return false;
        return Objects.equals(left, other.left) && Objects.equals(right, other.right) && op == other.op;
    }

    @Override
    public int hashCode() {
        return Objects.hash(left, right, op);
    }


    @Override
    boolean isBasic() {
        return isConstant() || (left.isBasic() && right.isBasic() && !op.isCompare());
    }

    @Override
    public String toString() {
        return toString(0);
    }

    public String toString(int indent) {
        return " ".repeat(indent) + "BinaryPushGroup(\n" + " ".repeat(indent + 4) + "left:\n" + left.toString(indent + 8) + ",\n" + " ".repeat(indent + 4) + "right:\n" + right.toString(indent + 8) + ",\n" + " ".repeat(indent + 4) + "binaryOp: \"" + op + "\"\n" + " ".repeat(indent) + ")";
    }

    @Override
    Address getAddress() throws Exception {
        return null;
    }

    public PushGroup getLeft() {
        return left;
    }

    public PushGroup getRight() {
        return right;
    }

    public ArithmeticInstruction.Op getOp() {
        return op;
    }
}
