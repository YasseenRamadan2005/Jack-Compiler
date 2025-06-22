package VMTranslator.vmcode;
import java.util.ArrayList;
import java.util.List;

public abstract class PushGroup implements VMinstruction{
    private List<PushPopPair> fluff = new ArrayList<>();
    //Basic means it doesn't use R13
    //A lone push instruction is always basic
    //A Unary Push Group is basic if it's inner group is basic
    //A Binary Push Group is basic if it's inner groups are basic, and it doesn't use a compare instruction
    //A Call Group is never basic
    abstract boolean isBasic(); // new method


    abstract boolean isConstant();
    abstract short getConstant();


    //Set's the D register to the Push Value
    abstract List<String> setD() throws Exception;
    //abstract String toString(int i);
    abstract Address getAddress() throws Exception;

    public void add_PPP(PushPopPair PPP){
        fluff.add(PPP);
    }
    public List<String> decodeAll() throws Exception {
        List<String> a = new ArrayList<>(decode());
        for (PushPopPair PPP : fluff){
            a.addAll(PPP.decode());
        }
        return a;
    }

    @Override
    public String toString() {
        return toString(0);
    }

    public String toString(int indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(" ".repeat(indent))
                .append(getClass().getSimpleName())
                .append(" (\n");

        appendSelf(sb, indent + 2);

        if (!fluff.isEmpty()) {
            sb.append(" ".repeat(indent + 2)).append("fluff:\n");
            for (PushPopPair ppp : fluff) {
                sb.append(ppp.toString(indent + 4));
            }
        }

        sb.append(" ".repeat(indent)).append(")\n");
        return sb.toString();
    }

    // Let each subclass override this to describe itself in detail
    protected abstract void appendSelf(StringBuilder sb, int indent);


}