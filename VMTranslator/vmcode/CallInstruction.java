package VMTranslator.vmcode;

import VMTranslator.VMTranslator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CallInstruction implements VMinstruction {
    private final String calleeFunction;
    private final int numArgs;
    private final Map<String, Integer> funcMapping;

    public CallInstruction(String calleeFunction, int numArgs, Map<String, Integer> funcMapping) {
        this.calleeFunction = calleeFunction;
        this.numArgs = numArgs;
        this.funcMapping = funcMapping;
    }

    public int getArgs() {
        return numArgs;
    }

    @Override
    public List<String> decode() {
        List<String> asm = new ArrayList<>();

        int callCount = funcMapping.getOrDefault(VMParser.currentFunction, 0);
        String returnLabel = VMParser.currentFunction + ".ret." + callCount;
        funcMapping.put(VMParser.currentFunction, callCount + 1);

        asm.add("// call " + calleeFunction);

        // Set ARG + 5 in @14
        asm.add("@" + (numArgs + 5));
        asm.add("D=A");
        asm.add("@14");
        asm.add("M=D");

        // Set function pointer in @13
        asm.add("@" + calleeFunction);
        asm.add("D=A");
        asm.add("@13");
        asm.add("M=D");

        if (VMTranslator.thread) {
            asm.add("@CALL");
            asm.add("0;JMP");
            asm.add("(" + returnLabel + ")");
            return asm;
        }

        // Set return address in D, jump to CALL
        asm.add("@" + returnLabel);
        asm.add("D=A");
        asm.add("@CALL");
        asm.add("0;JMP");
        asm.add("(" + returnLabel + ")");

        return asm;
    }

    @Override
    public List<VMinstruction> unWrap() {
        return List.of(this);
    }

    public String getFunctionName() {
        return calleeFunction;
    }

    @Override
    public String toString() {
        return "CallInstruction{" + calleeFunction + '}';
    }
}
