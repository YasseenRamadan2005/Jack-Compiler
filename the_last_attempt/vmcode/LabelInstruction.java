// vmcode/LabelInstruction.java
package vmcode;

import java.util.ArrayList;
import java.util.List;

public class LabelInstruction implements VMinstruction {
    private final String label;
    private final String currentFile;
    private final String currentFunction;

    public LabelInstruction(String label, String currentFile, String currentFunction) {
        this.label = label;
        this.currentFile = currentFile;
        this.currentFunction = currentFunction;
    }

    @Override
    public List<String> decode() {
        List<String> asm = new ArrayList<>();
        asm.add("// label " + label);
        asm.add("(" + currentFile + "." + currentFunction + "$" + label + ")");
        return asm;
    }

    @Override
    public String toString() {
        return "LabelInstruction{" +
                "label='" + label + '\'' +
                ", currentFile='" + currentFile + '\'' +
                ", currentFunction='" + currentFunction + '\'' +
                '}';
    }
}
