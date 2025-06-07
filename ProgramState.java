import java.util.HashMap;
import java.util.Map;

public class ProgramState {

    private static final int CLASS_INDEX = 0;
    private static final int SUBROUTINE_INDEX = 1;
    private static final int WHILE_INDEX = 0;
    private static final int IF_INDEX = 1;

    private String className = "";
    private String subroutineName = "";

    private Map<String, String> ConstantLookup = new HashMap<>();

    // [CLASS_INDEX] = class-level symbol table, [SUBROUTINE_INDEX] = subroutine-level
    private final Map<String, SymbolInfo>[] ST = new Map[]{new HashMap<>(), new HashMap<>()};

    // static, field, argument, local counters
    private final Map<String, Integer> varCounts = new HashMap<>();

    // Per-function tracking: map from "Class.Subroutine.Args" → [whileCount, ifCount]
    private final Map<String, int[]> PT = new HashMap<>();

    public ProgramState() {
        varCounts.put("static", 0);
        varCounts.put("field", 0);
        varCounts.put("argument", 0);
        varCounts.put("local", 0);
    }

    public String getClassName() {
        return className;
    }

    public String getSubroutineName() {
        return subroutineName;
    }

    public void setClassName(String name) {
        this.className = name;
    }

    public void setSubroutineName(String name) {
        this.subroutineName = name;
    }

    public void resetSubroutineST() {
        ST[SUBROUTINE_INDEX].clear();
        varCounts.put("argument", 0);
        varCounts.put("local", 0);
    }

    public int getVarCount(String kind) {
        return varCounts.getOrDefault(kind, 0);
    }

    public void incrementVarCount(String kind) {
        varCounts.put(kind, getVarCount(kind) + 1);
    }

    public void addToClassST(String name, String type, String kind) {
        int count = getVarCount(kind);
        ST[CLASS_INDEX].put(name, new SymbolInfo(type, kind, count));
        incrementVarCount(kind);
    }

    public void addClassConstant(String name, String number){
        ConstantLookup.put(name, number);
    }

    public void addToSubroutineST(String name, String type, String kind) {
        int count = getVarCount(kind);
        ST[SUBROUTINE_INDEX].put(name, new SymbolInfo(type, kind, count));
        incrementVarCount(kind);
    }

    public String getFunctionDeclarationName() {
        return className + "." + subroutineName;
    }

    public SymbolInfo lookupSymbol(String name) {
        if (ST[CLASS_INDEX].containsKey(name)) {
            return ST[CLASS_INDEX].get(name);
        }
        if (ST[SUBROUTINE_INDEX].containsKey(name)) {
            return ST[SUBROUTINE_INDEX].getOrDefault(name, null);
        }
        return null;
    }

    public String handleVarName(String varName, boolean push) {
        if (ConstantLookup.containsKey(varName)){
            return "push constant " + ConstantLookup.get(varName);
        }


        SymbolInfo info = lookupSymbol(varName);
        if (info == null) return "// Error: variable not found: " + varName;

        String kind = info.kind;
        if (kind.equals("field")) kind = "this";

        return (push ? "push" : "pop") + " " + kind + " " + info.count;
    }

    public void addFunctionStatementCounter() {
        PT.put(getFunctionDeclarationName(), new int[]{0, 0});
    }

    public int getStatementCounter(String statementType) {
        String function = getFunctionDeclarationName();
        int[] counts = PT.get(function);

        if (counts == null) {
            System.err.println("Error: Function '" + function + "' not found in PT.");
            return -1;
        }

        if (statementType.equals("while")) {
            return ++counts[WHILE_INDEX];
        } else if (statementType.equals("if")) {
            return ++counts[IF_INDEX];
        } else {
            throw new IllegalArgumentException("Unknown statement type: " + statementType);
        }
    }
    @Override
    public String toString() {
        return "Class: " + className + ", Subroutine: " + subroutineName + ", ST: " + ST[CLASS_INDEX] + " / " + ST[SUBROUTINE_INDEX] + ", Vars: " + varCounts;
    }

    /**
     * Inner class to represent a symbol's metadata
     */
    public static class SymbolInfo {
        public final String type;
        public final String kind;
        public final int count;

        public SymbolInfo(String type, String kind, int count) {
            this.type = type; //ex: WHILE_STATEMENT
            this.kind = kind; //static vs field or local vs argument
            this.count = count;
        }

        @Override
        public String toString() {
            return "(" + type + ", " + kind + ", " + count + ")";
        }
    }
}
