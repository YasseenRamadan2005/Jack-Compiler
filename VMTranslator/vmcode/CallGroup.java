package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CallGroup extends PushGroup{
    //A call Group is a list of n pushGroups followed by "call Foo n"
    private List<PushGroup> pushes;
    private CallInstruction call;

    public CallGroup(List<PushGroup> pushes, CallInstruction call) {
        this.pushes = pushes;
        this.call = call;
    }
    public List<String> decode() throws Exception {
        List<String> asm = new ArrayList<>();
        for (PushGroup p : pushes)
            asm.addAll(p.decode());
        asm.addAll(call.decode());
        return asm;
    }


    @Override
    List<String> setD() throws Exception {
        List<String> asm = new ArrayList<>(decode());
        asm.addAll(List.of("@SP", "AM=M-1", "D=M"));
        return asm;
    }

    @Override
    boolean isBasic() {
        return false;
    }

    @Override
    boolean isConstant() {
        return false;
    }

    @Override
    short getConstant() {
        return 0;
    }

    @Override
    Address getAddress() throws Exception {
        return null;
    }

    @Override
    protected void appendSelf(StringBuilder sb, int indent) {
        sb.append(" ".repeat(indent)).append("CallGroup(\n");

        for (int i = 0; i < pushes.size(); i++) {
            sb.append(" ".repeat(indent + 4)).append("arg[").append(i).append("]:\n");
            pushes.get(i).appendSelf(sb, indent + 8);
        }

        sb.append(" ".repeat(indent + 4)).append("call: ").append(call).append("\n");
        sb.append(" ".repeat(indent)).append(")");
    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof CallGroup other)) return false;
        return Objects.equals(pushes, other.pushes)
                && Objects.equals(call, other.call);
    }
    @Override
    public int hashCode() {
        return Objects.hash(pushes, call);
    }

}
