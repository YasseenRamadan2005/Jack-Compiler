// vmcode/GotoInstruction.java
package vmcode;

import java.util.ArrayList;
import java.util.List;

public class GotoInstruction implements VMinstruction {
    private final String label;
    private final String currentFile;
    private final String currentFunction;

    public GotoInstruction(String label, String currentFile, String currentFunction) {
        this.label = label;
        this.currentFile = currentFile;
        this.currentFunction = currentFunction;
    }

    @Override
    public List<String> decode() {
        List<String> asm = new ArrayList<>();
        asm.add("// goto " + label);
        asm.add("@" + currentFile + "." + currentFunction + "$" + label);
        asm.add("0;JMP");
        return asm;
    }

    @Override
    public String toString() {
        return "GotoInstruction{" +
                "label='" + label + '\'' +
                ", currentFile='" + currentFile + '\'' +
                ", currentFunction='" + currentFunction + '\'' +
                '}';
    }
}
