package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public final class UnaryPushGroup extends PushGroup {

    private PushGroup inner;
    private ArithmeticInstruction.Op op;

    public UnaryPushGroup(PushGroup inner, ArithmeticInstruction.Op op) {
        this.inner = inner;
        this.op = op;
    }

    @Override
    public List<String> decode() throws Exception {
        if (isConstant()) {
            short constant = getConstant();
            System.out.println(constant);
            if (Math.abs(constant) <= 1) {
                return new ArrayList<>(List.of("@SP", "AM=M+1", "A=A-1", "M=" + constant));
            }
        }
        List<String> code = new ArrayList<>(inner.decode());
        code.addAll(op.emit());
        return code;
    }

    @Override
    List<String> setD() throws Exception {
        // Constant folding
        if (isConstant()) {
            return List.of("D=" + op.apply(getConstant()));
        }

        // Optimize wrapped push
        if (isWrappedPush()) {
            if (inner instanceof PushInstruction pi) {
                List<String> asm = new ArrayList<>(pi.getAddress().resolveAddressTo("A"));
                asm.add("D=" + (op == ArithmeticInstruction.Op.NEG ? "-" : "!") + "M");
                return asm;
            }
        }

        // General case
        List<String> asm = new ArrayList<>(inner.setD());
        asm.add(op.onD());
        return asm;
    }

    /**
     * Detects whether this is a wrapped PushInstruction or nested UnaryPushGroup wrapping a PushInstruction
     */
    boolean isWrappedPush() {
        return inner instanceof PushInstruction || (inner instanceof UnaryPushGroup u && u.isWrappedPush());
    }

    @Override
    public boolean isConstant() {
        return inner.isConstant();
    }

    @Override
    public short getConstant() {
        return (short) switch (op) {
            case NOT -> ~inner.getConstant();
            case NEG -> -inner.getConstant();
            default -> throw new IllegalStateException();
        };
    }

    @Override
    Address getAddress() throws Exception {
        if (inner instanceof PushInstruction pi) return pi.getAddress();
        throw new Exception("Unary group is not addressable");
    }

    public PushGroup getInner() {
        return inner;
    }

    public ArithmeticInstruction.Op getOp() {
        return op;
    }

    @Override
    boolean isBasic() {
        return inner instanceof PushInstruction;
    }

    @Override
    public String toString() {
        return toString(0);
    }

    @Override
    public String toString(int ind) {
        return " ".repeat(ind) + "UnaryPushGroup(" + op + ",\n" + inner.toString(ind + 4) + ')';
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof UnaryPushGroup other)) return false;
        return Objects.equals(inner, other.inner) && op == other.op;
    }

    @Override
    public int hashCode() {
        return Objects.hash(inner, op);
    }

}
