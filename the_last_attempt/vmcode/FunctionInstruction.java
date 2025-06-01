package vmcode;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class FunctionInstruction implements VMinstruction {
    private final String functionName;
    private final int numLocals;
    private final Map<String, Integer> funcMapping;

    public FunctionInstruction(String functionName, int numLocals, Map<String, Integer> funcMapping) {
        this.functionName = functionName;
        this.numLocals = numLocals;
        this.funcMapping = funcMapping;
    }

    @Override
    public List<String> decode() {
        List<String> asm = new ArrayList<>();

        // Reset the call count for this function in the map
        funcMapping.put(functionName, 0);

        asm.add("// function " + functionName + " with " + numLocals);
        asm.add("(" + functionName + ")");

        // Initialize local variables to 0 by pushing 0 numLocals times
        for (int i = 0; i < numLocals; i++) {
            asm.addAll(List.of("@SP", "AM=M+1", "A=A-1", "M=0"));
        }

        return asm;
    }

    @Override
    public String toString() {
        return "FunctionInstruction{" +
                "functionName='" + functionName + '\'' +
                ", numLocals=" + numLocals +
                ", funcMapping=" + funcMapping +
                '}';
    }
}
