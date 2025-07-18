package VMTranslator.vmcode;

import java.util.ArrayList;
import java.util.List;

public class Dereference extends PushGroup {
    //Grammar
    //  PushGroup
    //  pop pointer 1
    //  push that 0
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
        List<String> list;

        if (base instanceof BinaryPushGroup bpg && bpg.getOp() == ArithmeticInstruction.Op.ADD) {
            PushGroup constSide = null, otherSide = null;
            short c = 0;

            if (bpg.getRight().isConstant()) {
                constSide = bpg.getRight();
                otherSide = bpg.getLeft();
                c = constSide.getConstant();
            } else if (bpg.getLeft().isConstant()) {
                constSide = bpg.getLeft();
                otherSide = bpg.getRight();
                c = constSide.getConstant();
            }

            if (constSide != null) {
                list = new ArrayList<>(otherSide.setD());
                if (Math.abs(c) <= 1) {
                    if (c == 0) {
                        list.removeLast();
                        list.add("A=M");
                    }
                    if (c == 1) {
                        list.removeLast();
                        list.add("A=M+1");
                    }
                    if (c == -1) {
                        list.add("A=D-1");
                    }
                } else {
                    list.addAll(bpg.setD());
                    list.add("A=D");
                }
                list.add("D=M");
                return list;
            }
        }

        list = new ArrayList<>(base.setD());
        if (base.isConstant()) {
            list.removeLast();
        }
        else {
            list.set(list.size() - 1, 'A' + list.getLast().substring(1));
        }
        list.add("D=M");
        return list;
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
        return " ".repeat(i) + "Dereference(\n" + " ".repeat(i + 4) + "base:\n" + base.toString(i + 8) + "\n" + " ".repeat(i) + ")";
    }

    @Override
    public String toString() {
        return toString(0);
    }


    public PushGroup getBase() {
        return base;
    }
}
