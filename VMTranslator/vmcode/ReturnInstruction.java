// vmcode/ReturnInstruction.java
package VMTranslator.vmcode;

import java.util.List;

public class ReturnInstruction implements VMinstruction {

    public ReturnInstruction() {}

    @Override
    public List<String> decode() {
        return List.of("@RETURN", "0;JMP");
    }

    @Override
    public String toString() {
        return "ReturnInstruction{}";
    }
}
