// vmcode/IfGotoInstruction.java
package vmcode;

import java.util.ArrayList;
import java.util.List;

public class IfGotoInstruction implements VMinstruction {
    private final String label;
    private final String currentFile;
    private final String currentFunction;

    public IfGotoInstruction(String label, String currentFile, String currentFunction) {
        this.label = label;
        this.currentFile = currentFile;
        this.currentFunction = currentFunction;
    }

    public String getLabel() {
        return label;
    }

    public String getCurrentFile() {
        return currentFile;
    }

    public String getCurrentFunction() {
        return currentFunction;
    }

    @Override
    public String toString() {
        return "IfGotoInstruction{" +
                "label='" + label + '\'' +
                ", currentFile='" + currentFile + '\'' +
                ", currentFunction='" + currentFunction + '\'' +
                '}';
    }


    @Override
    public List<String> decode() {
        List<String> asm = new ArrayList<>();
        asm.add("// if-goto " + label);

        // Decrement SP and load *SP into D
        asm.add("@SP");
        asm.add("AM=M-1");
        asm.add("D=M");

        // Jump if D != 0 to the label
        asm.add("@" + currentFile + "." + currentFunction + "$" + label);
        asm.add("D;JNE");

        return asm;
    }
}
