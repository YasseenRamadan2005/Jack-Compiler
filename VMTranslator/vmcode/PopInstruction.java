package VMTranslator.vmcode;

import VMTranslator.VMTranslator;

import java.util.ArrayList;
import java.util.List;

public class PopInstruction implements VMinstruction {
    private final Address address;

    public PopInstruction(Address address) {
        this.address = address;
    }

    @Override
    public List<String> decode() {
        List<String> asm = new ArrayList<>();
        if (VMTranslator.thread) {
            String label;
            if (address.getSegment().equals("static")) {
                label = VMParser.moduleName + "." + address.getIndex() + "_POP";
            } else {
                label = "POP_" + address.getSegment() + "_" + address.getIndex();
            }
            return List.of("@" + label, "0;JMP");
        }
        if (address.isTrivial()) {
            // Trivial address: D not overwritten by setAreg()
            asm.addAll(List.of("@SP", "AM=M-1", "D=M"));
            asm.addAll(address.resolveAddressTo("A"));
            asm.add("M=D");
        } else {
            // Non-trivial address: use R13 to preserve destination address
            asm.addAll(address.resolveAddressTo("A"));
            asm.addAll(List.of("D=A", "@R13", "M=D", "@SP", "AM=M-1", "D=M", "@R13", "A=M", "M=D"));
        }

        return asm;
    }

    @Override
    public List<VMinstruction> unWrap() {
        return List.of(this);
    }

    public Address getAddress() {
        return address;
    }

    @Override
    public String toString() {
        return "PopInstruction{" +
                "address=" + address.getSegment() + " " + address.getIndex() +
                '}';
    }
}


