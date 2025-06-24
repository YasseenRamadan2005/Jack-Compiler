package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;

public class PushPopPair implements VMinstruction {
    //Grammar:
    //  PushGroup
    //  PopInstruction

    private final PushGroup push;
    private final PopInstruction pop;

    public PushPopPair(PushGroup push, PopInstruction pop) {
        this.push = push;
        this.pop = pop;
    }

    public PushGroup getPush() {
        return push;
    }

    public PopInstruction getPop() {
        return pop;
    }

    @Override
    public List<String> decode() throws Exception {
        List<String> asm = new ArrayList<>();
        Address dest = pop.getAddress();
        if (dest.isTrivial()) {
            asm.addAll(push.setD());
            asm.addAll(dest.resolveAddressTo("A"));
            asm.add("M=D");
        } else {
            asm.addAll(push.decode());
            asm.addAll(pop.decode());
        }
        return asm;
    }


    public Address getPopAddress(){
        return pop.getAddress();
    }
    @Override
    public String toString() {
        return toStringHelper(0);
    }

    private String toStringHelper(int indent) {
        StringBuilder sb = new StringBuilder();
        String pad = "  ".repeat(indent);
        sb.append(pad).append("PushPopPair {\n");
        sb.append(pad).append("  push: ").append(push).append("\n");


        sb.append(pad).append("  pop:  ").append(pop).append("\n");
        sb.append(pad).append("}\n");

        return sb.toString();
    }
}
