package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class PushInstruction extends PushGroup {
    private final Address address;


    public PushInstruction(Address address) {
        this.address = address;
    }

    private static String indent(int n) {
        return " ".repeat(n);
    }

    @Override
    public List<String> decode() {
        if (isConstant()){
            if (Math.abs(getConstant()) <= 1) {
                return new ArrayList<>(List.of("@SP", "AM=M+1", "A=A-1", "M=" + getConstant()));
            }
        }
        List<String> asm = new ArrayList<>();
        asm.addAll(setD()); // Handles constant optimization internally
        asm.addAll(List.of("@SP", "AM=M+1", "A=A-1", "M=D"));
        return asm;
    }

    @Override
    List<String> setD() {
        if (isConstant()) {
            short c = getConstant();
            if (c == 0 || c == 1 || c == -1) {
                return List.of("D=" + c);
            }
            if (c < 0){
                return List.of("@" + (-c), "D=-A");
            }
            return List.of("@" + c, "D=A");
        }
        return address.setDreg();
    }


    @Override
    public short getConstant() {
        return address.getIndex();
    }

    public Address getAddress() {
        return address;
    }

    public boolean isTrivial() {
        return address.isTrivial();
    }

    public boolean isConstant() {
        return address.isConstant();
    }

    @Override
    public String toString() {
        return toString(0);
    }

    public String toString(int indent) {
        return indent(indent) + "PushInstruction(\"" + address.getSegment() + " " + address.getIndex() + "\")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof PushInstruction other)) return false;
        return Objects.equals(getAddress(), other.getAddress());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getAddress());
    }
}

