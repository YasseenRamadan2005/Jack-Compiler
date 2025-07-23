// vmcode/ReturnInstruction.java
package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;

public class ReturnInstruction implements VMinstruction {

    public ReturnInstruction() {
    }
    @Override
    public List<String> decode() throws Exception {
        return new ArrayList<>(List.of("@RETURN", "0;JMP"));
    }

    @Override
    public List<VMinstruction> unWrap() {
        return List.of(this);
    }

    @Override
    public String toString() {
        return "//Return";
    }
}
