package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;

public class PushWriter implements VMinstruction {
    private PushGroup source;
    private PushGroup dest; //Does RAM[dest] = source

    public PushWriter (PushGroup source, PushGroup dest){
        this.source = source; this.dest = dest;
    }


    @Override
    public List<String> decode() throws Exception {
        List<String> asm = new ArrayList<>(source.decode());
        asm.addAll(dest.setD());
        asm.addAll(List.of("@SP", "AM=M-1", "A=M", "M=D"));
        return asm;
    }

    @Override
    public String toString() {
        return "PushWriter{" +
                "source=" + source +
                ", dest=" + dest +
                '}';
    }
}
