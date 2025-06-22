package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Dereference extends PushGroup {
    //Dereferences a Push Group
    PushGroup base;


    public Dereference(PushGroup base) {
        this.base = base;
    }

    @Override
    public List<String> decode() throws Exception {
        List<String> list = new ArrayList<>(setD());
        list.addAll(List.of("@SP", "AM=M+1", "A=A-1", "M=D"));
        return list;
    }

    @Override
    List<String> setD() throws Exception {
        List<String> list = new ArrayList<>( base.setD());
        list.set(list.size() - 1, 'A' + list.get(list.size() - 1).substring(1));
        list.add("D=M");
        return list;
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
    String toString(int i) {
        return " ".repeat(i) + "Dereference(\n" +
                " ".repeat(i + 4) + "base:\n" +
                base.toString(i + 8) + "\n" +
                " ".repeat(i) + ")";
    }

    @Override
    public String toString(){
        return toString(0);
    }

    @Override
    Address getAddress() throws Exception {
        return null;
    }

}
