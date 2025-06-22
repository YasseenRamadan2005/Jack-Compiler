package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;

public class PushPopPair implements VMinstruction {
    private final PushGroup push;
    private final PushPopPair PPP;
    private final PopInstruction pop;

    public PushPopPair(PushGroup push, PopInstruction pop) {
        this.push = push;
        this.pop = pop;
        this.PPP = null;
    }

    public PushPopPair(PushPopPair PPP, PushGroup push, PopInstruction pop) {
        this.push = push;
        this.pop = pop;
        this.PPP = PPP;
    }

    public PushPopPair getPPP() {
        return PPP;
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

        //Handling dereferencing
        if (PPP != null && push.isConstant() && Math.abs(push.getConstant()) <= 1 && PPP.pop.getAddress().equals(new Address("pointer" ,(short) 1 )) && pop.getAddress().equals(new Address("that", (short) 0))){
            //We write the constant directly with this dereferencing
            List<String> test = PPP.push.setD();
            test.set(test.size() - 1, 'A' + test.getLast().substring(1));
            asm.addAll(test);
            asm.add("M=" + push.getConstant());
            return asm;
        }

        if (PPP != null) {
            asm.addAll(push.decode());
            asm.addAll(PPP.decode());
            asm.addAll(pop.decode());
            return asm;
        }
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
        if (PPP != null) {
            sb.append(pad).append("  nested:\n");
            sb.append(PPP.toStringHelper(indent + 2));
        }
        sb.append(pad).append("PushPopPair {\n");
        sb.append(pad).append("  push: ").append(push).append("\n");


        sb.append(pad).append("  pop:  ").append(pop).append("\n");
        sb.append(pad).append("}\n");

        return sb.toString();
    }
}
