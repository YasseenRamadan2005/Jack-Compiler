package VMTranslator.vmcode;

import java.util.List;

public interface VMinstruction {
    //Decode does the entire line
    List<String> decode() throws Exception;
    List<VMinstruction> unWrap();
}
