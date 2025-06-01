package vmcode;
import java.util.List;

public abstract class PushGroup implements VMinstruction{
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
    abstract String toString(int i);
    abstract Address getAddress() throws Exception;


}