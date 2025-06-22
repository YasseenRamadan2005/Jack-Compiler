package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;

public class PushPopPair implements VMinstruction {
    private final PushGroup push;
    private final PushPopPair PPP;
    private final PopInstruction pop;

    public PushPopPair(PushGroup push, PopInstruction pop) {
        this.push = push;
        this.pop = pop;
        this.PPP = null;
    }

    public PushPopPair(PushPopPair PPP, PushGroup push, PopInstruction pop) {
        this.push = push;
        this.pop = pop;
        this.PPP = PPP;
    }

    @Override
    public List<String> decode() throws Exception {
        List<String> asm = new ArrayList<>();
        Address dest = pop.getAddress();

        // Add nested PPP first
        if (PPP != null) asm.addAll(PPP.decode());

        // Peephole optimizations
        if (optimizeConstantAssign(asm, dest)) return asm;
        if (optimizeUnaryInPlace(asm, dest)) return asm;
        if (optimizeSmallBinaryInPlace(asm, dest)) return asm;

        // General write strategies
        if (dest.isTrivial()) {
            asm.addAll(push.setD());
            asm.addAll(dest.resolveAddressTo("A"));
            asm.add("M=D");
        } else if (push instanceof PushInstruction pi && pi.getAddress().isReachable(dest)) {
            Address src = pi.getAddress();
            if (!src.equals(dest)) {
                asm.addAll(push.setD());
                int delta = src.getIndex() - dest.getIndex();
                asm.addAll(List.of("@SP", "A=M")); // assume A is aligned by setD
                for (int i = 0; i < Math.abs(delta); i++)
                    asm.add(delta > 0 ? "A=A+1" : "A=A-1");
                asm.add("M=D");
            }
        } else if (push.isBasic()) {
            asm.addAll(dest.resolveAddressTo("A"));
            asm.addAll(List.of("D=A", "@13", "M=D"));
            asm.addAll(push.setD());
            asm.addAll(List.of("@13", "A=M", "M=D"));
        } else {
            asm.addAll(dest.resolveAddressTo("A"));
            asm.addAll(List.of("D=A", "@SP", "AM=M+1", "A=A-1", "M=D"));
            asm.addAll(push.setD());
            asm.addAll(List.of("@SP", "AM=M-1", "A=M", "M=D"));
        }

        return asm;
    }

    private boolean optimizeConstantAssign(List<String> asm, Address dest) {
        if (push.isConstant() && Math.abs(push.getConstant()) <= 1) {
            asm.addAll(dest.resolveAddressTo("A"));
            asm.add("M=" + push.getConstant());
            return true;
        }
        return false;
    }

    private boolean optimizeUnaryInPlace(List<String> asm, Address dest) throws Exception {
        if (push instanceof UnaryPushGroup u && u.getInner() instanceof PushInstruction && dest.equals(u.getInner().getAddress())) {
            asm.addAll(dest.resolveAddressTo("A"));
            asm.add("M=" + (u.getOp() == ArithmeticInstruction.Op.NEG ? "-" : "!") + "M");
            return true;
        }
        return false;
    }

    private boolean optimizeSmallBinaryInPlace(List<String> asm, Address dest) {
        if (!(push instanceof BinaryPushGroup b)) return false;

        PushInstruction c = null, v = null;
        if (b.getLeft() instanceof PushInstruction p1 && p1.isConstant() && Math.abs(p1.getConstant()) <= 1 && b.getRight() instanceof PushInstruction p2) {
            c = p1;
            v = p2;
        } else if (b.getRight() instanceof PushInstruction p1 && p1.isConstant() && Math.abs(p1.getConstant()) <= 1 && b.getLeft() instanceof PushInstruction p2) {
            c = p1;
            v = p2;
        }

        if (c != null && v.getAddress().equals(dest)) {
            asm.addAll(dest.resolveAddressTo("A"));
            int value = c.getConstant();

            switch (b.getOp()) {
                case ADD -> asm.add("M=M+" + value);
                case SUB -> {
                    if (b.getLeft() == c) {
                        asm.add("M=M-" + value);
                        asm.add("M=-M");
                    } else {
                        asm.add("M=M-" + value);
                    }
                }
                default -> {
                    return false;
                }
            }
            return true;
        }

        return false;
    }


    @Override
    public String toString() {
        return toStringHelper(0);
    }

    private String toStringHelper(int indent) {
        StringBuilder sb = new StringBuilder();
        String pad = "  ".repeat(indent);

        sb.append(pad).append("PushPopPair {\n");
        sb.append(pad).append("  push: ").append(push).append("\n");

        if (PPP != null) {
            sb.append(pad).append("  nested:\n");
            sb.append(PPP.toStringHelper(indent + 2));
        }

        sb.append(pad).append("  pop:  ").append(pop).append("\n");
        sb.append(pad).append("}\n");

        return sb.toString();
    }
}
