package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;

public class PushWriter implements VMinstruction {
    //Grammar:
    //  PushGroup | source
    //  PushGroup | dest
    //  pop pointer 1
    //  pop that 0

    private PushGroup source;
    private PushGroup dest; //Does RAM[dest] = source

    public PushWriter(PushGroup source, PushGroup dest) {
        this.source = source;
        this.dest = dest;
    }


    @Override
    public List<String> decode() throws Exception {
        List<String> asm = new ArrayList<>(dest.decode());
        asm.addAll(source.setD());
        asm.addAll(List.of("@SP", "AM=M-1", "A=M", "M=D"));
        return asm;
    }

    @Override
    public List<VMinstruction> unWrap() {

        // Evaluate dest, store in pointer 1
        List<VMinstruction> result = new ArrayList<>(dest.unWrap());
        result.add(new PopInstruction(new Address("pointer", (short) 1)));

        // Evaluate source, write to that 0
        result.addAll(source.unWrap());
        result.add(new PopInstruction(new Address("that", (short) 0)));

        return result;
    }

    @Override
    public String toString() {
        return "PushWriter{" + "source=" + source + ", dest=" + dest + '}';
    }
}
