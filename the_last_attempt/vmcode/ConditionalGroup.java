package vmcode;

import java.util.ArrayList;
import java.util.List;

public class ConditionalGroup implements VMinstruction {
    private PushGroup push;
    private IfGotoInstruction ifGoto;

    public ConditionalGroup(PushGroup push, IfGotoInstruction ifGoto) {
        this.push = push;
        this.ifGoto = ifGoto;
    }

    @Override
    public List<String> decode() throws Exception {
        List<String> asm = new ArrayList<>();

        asm.addAll(push.setD());
        asm.addAll(List.of("@" + ifGoto.getCurrentFile() + "." + ifGoto.getCurrentFunction() + "$" + ifGoto.getLabel(), "D;JNE"));
        return asm;
    }

    @Override
    public String toString() {
        return "ConditionalGroup{" + "push=" + push + ", ifGoto=" + ifGoto + '}';
    }
}
