import java.util.*;

public class CodeGenerator {
    private final Node root;
    private ProgramState ps;
    private final Map<String, Integer> varCounts = new HashMap<>();
    private final Map<String, SymbolInfo> classScope = new HashMap<>();
    private final Map<String, SymbolInfo> subroutineScope = new HashMap<>();
    private String currentClassName = "";
    private String currentFunctionName = "";

    public CodeGenerator(Node theRoot) {
        this.root = theRoot;
        this.ps = new ProgramState();
    }

    public List<String> generateCode() {
        return compileTree(root);
    }

    private List<String> compileTree(Node node) {
        List<String> vmCode = new ArrayList<>();

        switch (node.structureType) {
            case CLASS:
                currentClassName = node.children.get(1).value;
                for (int i = 2; i < node.children.size() - 1; i++) {
                    vmCode.addAll(compileTree(node.children.get(i)));
                }
                return vmCode;

            case CLASS_VAR_DEC:
                String kind = node.children.get(0).value; // static or field
                String type = node.children.get(1).value;
                for (int i = 2; i < node.children.size(); i++) {
                    Node child = node.children.get(i);
                    if (child.tokenType == Node.TokenType.IDENTIFIER) {
                        int index = varCounts.get(kind);
                        classScope.put(child.value, new SymbolInfo(type, kind, index));
                        varCounts.put(kind, index + 1);
                    }
                }
                return List.of();

            case SUBROUTINE_DEC:
                String subroutineType = node.children.get(0).value; // constructor/function/method
                String subroutineName = node.children.get(2).value;

                subroutineScope.clear();
                varCounts.put("argument", 0);
                varCounts.put("local", 0);

                // Compile parameterList
                compileTree(node.children.get(4)); // updates subroutineScope and varCounts["argument"]

                // Compile subroutineBody
                List<String> bodyCode = compileTree(node.children.get(6));

                int localVarCount = varCounts.get("local");
                int argumentCount = varCounts.get("argument");
                String fullFunctionName = currentClassName + "." + subroutineName;

                bodyCode.add(0, String.format("function %s.%d %d", fullFunctionName, argumentCount, localVarCount));

                if ("method".equals(subroutineType)) {
                    bodyCode.add(1, "push argument 0");
                    bodyCode.add(2, "pop pointer 0");
                } else if ("constructor".equals(subroutineType)) {
                    int fieldCount = varCounts.get("field");
                    bodyCode.add(1, "push constant " + fieldCount);
                    bodyCode.add(2, "call Memory.alloc 1");
                    bodyCode.add(3, "pop pointer 0");
                }

                return bodyCode;

            case PARAMETER_LIST:
                for (int i = 0; i < node.children.size(); i += 3) {
                    String varType = node.children.get(i).value;
                    String varName = node.children.get(i + 1).value;
                    int index = varCounts.get("argument");
                    subroutineScope.put(varName, new SymbolInfo(varType, "argument", index));
                    varCounts.put("argument", index + 1);
                }
                return List.of();

            case SUBROUTINE_BODY:
                List<String> bodyInstructions = new ArrayList<>();
                for (int i = 1; i < node.children.size() - 1; i++) {
                    bodyInstructions.addAll(compileTree(node.children.get(i)));
                }
                return bodyInstructions;


            case VAR_DEC:
                String localType = node.children.get(1).value;
                for (int i = 2; i < node.children.size(); i++) {
                    Node child = node.children.get(i);
                    if (child.tokenType == Node.TokenType.IDENTIFIER) {
                        int index = varCounts.get("local");
                        subroutineScope.put(child.value, new SymbolInfo(localType, "local", index));
                        varCounts.put("local", index + 1);
                    }
                }
                return List.of();

            case STATEMENTS:
                List<String> statements = new ArrayList<>();
                for (Node child : node.children) {
                    statements.addAll(compileTree(child));
                }
                return statements;

            case WHILE_STATEMENT:
                List<String> whileCode = new ArrayList<>();
                String labelStart = "WHILE_START_" + currentFunctionName;
                String labelEnd = "WHILE_END_" + currentFunctionName;

                whileCode.add("label " + labelStart);
                whileCode.addAll(compileTree(node.children.get(2))); // condition
                whileCode.add("if-goto " + labelEnd);
                whileCode.addAll(compileTree(node.children.get(4))); // body
                whileCode.add("goto " + labelStart);
                whileCode.add("label " + labelEnd);

                return whileCode;

            case IF_STATEMENT:
                List<String> ifCode = new ArrayList<>(compileTree(node.children.get(2))); // condition
                ifCode.add("not");
                ifCode.add("if-goto IfElse");

                ifCode.addAll(compileTree(node.children.get(5))); // then block
                if (node.children.size() > 7) {
                    ifCode.add("goto IfEnd");
                    ifCode.add("label IfElse");
                    ifCode.addAll(compileTree(node.children.get(7))); // else block
                }
                ifCode.add("label IfEnd");

                return ifCode;

            case LET_STATEMENT:
                String varName = node.children.get(1).value;
                List<String> letCode = new ArrayList<>();

                if (node.children.size() > 5) {
                    // let x[expr1] = expr2;
                    letCode.addAll(compileTree(node.children.get(3))); // expr1
                    letCode.add(handleVarName(varName, true)); // push base
                    letCode.add("pop pointer 1");
                    letCode.addAll(compileTree(node.children.get(node.children.size() - 2))); // expr2
                    letCode.add("pop that 0");
                } else {
                    // let x = expr;
                    letCode.addAll(compileTree(node.children.get(node.children.size() - 2)));
                    letCode.add(handleVarName(varName, false)); // pop into x
                }

                return letCode;

            case DO_STATEMENT:
                List<Node> callNodes = node.children.subList(1, node.children.size() - 1); // subroutineCall
                List<String> doCode = compileSubroutineCall(callNodes);
                doCode.add("pop temp 0"); // discard return value
                return doCode;

            case RETURN_STATEMENT:
                List<String> returnCode = new ArrayList<>();
                if (node.children.size() == 3) {
                    returnCode.addAll(compileTree(node.children.get(1))); // return expression
                } else {
                    returnCode.add("push constant 0"); // void
                }
                returnCode.add("return");
                return returnCode;

            case EXPRESSION: {
                // Compile the first term
                List<String> vmInstructions = new ArrayList<>(compileTree(node.children.getFirst()));

                // Process (op term)* — binary operations
                for (int i = 1; i < node.children.size(); i += 2) {
                    String operator = node.children.get(i).value;

                    // Compile the next term
                    vmInstructions.addAll(compileTree(node.children.get(i + 1)));

                    switch (operator) {
                        case "+" -> vmInstructions.add("add");
                        case "-" -> vmInstructions.add("sub");
                        case "*" -> vmInstructions.add("call Math.multiply 2");
                        case "/" -> vmInstructions.add("call Math.divide 2");
                        case "&" -> vmInstructions.add("and");
                        case "|" -> vmInstructions.add("or");
                        case "<" -> vmInstructions.add("lt");
                        case ">" -> vmInstructions.add("gt");
                        case "=" -> vmInstructions.add("eq");
                        default -> throw new IllegalArgumentException("Unknown operator: " + operator);
                    }
                }
                return vmInstructions;
            }

            case TERM: {
                List<String> term_vmInstructions = new ArrayList<>();
                List<Node> children = node.children;
                Node firstChild = children.get(0);

                Node.TokenType tokenType = firstChild.tokenType  // TokenType as string for switch

                switch (tokenType) {
                    case INTEGER_CONSTANT:
                        // integerConstant
                        term_vmInstructions.add("push constant " + firstChild.value);
                        break;

                    case STRING_CONSTANT:
                        // stringConstant
                        String strVal = firstChild.value;
                        term_vmInstructions.add("push constant " + strVal.length());
                        term_vmInstructions.add("call String.new 1");
                        for (char c : strVal.toCharArray()) {
                            term_vmInstructions.add("push constant " + (int) c);
                            term_vmInstructions.add("call String.appendChar 2");
                        }
                        break;

                    case KEYWORD:
                        // keywordConstant: true, false, null, this
                        switch (firstChild.value) {
                            case "true":
                                term_vmInstructions.add("push constant 0");
                                term_vmInstructions.add("not");
                                break;
                            case "false":
                            case "null":
                                term_vmInstructions.add("push constant 0");
                                break;
                            case "this":
                                term_vmInstructions.add("push pointer 0");
                                break;
                            default:
                                throw new IllegalStateException("Unexpected keyword constant: " + firstChild.value);
                        }
                        break;

                    case IDENTIFIER:
                        // Could be varName alone, varName '[' expression ']', or subroutineCall
                        if (children.size() == 1) {
                            // Just a variable
                            term_vmInstructions.add(handleVarName(firstChild.value, true));
                        } else {
                            Node secondChild = children.get(1);

                            if (secondChild.tokenType == Node.TokenType.SYMBOL) {
                                String sym = secondChild.value;

                                if ("[".equals(sym)) {
                                    // varName '[' expression ']'
                                    String theVarName = firstChild.value;
                                    term_vmInstructions.addAll(compileTree(children.get(2))); // expression
                                    // get kind and index from symbol table
                                    var symbolEntry =  SymbolTables[1].get(theVarName);
                                    String kind = symbolEntry.getKind();
                                    int index = symbolEntry.getIndex();
                                    term_vmInstructions.add("push " + kind + " " + index);
                                    term_vmInstructions.add("add");
                                    term_vmInstructions.add("pop pointer 1");
                                    term_vmInstructions.add("push that 0");
                                } else if ("(".equals(sym) || ".".equals(sym)) {
                                    // subroutineCall
                                    term_vmInstructions.addAll(compileSubroutineCall(children));
                                } else {
                                    throw new IllegalStateException("Unexpected symbol after identifier in term: " + sym);
                                }
                            } else {
                                throw new IllegalStateException("Unexpected token after identifier in term: " + secondChild.tokenType);
                            }
                        }
                        break;

                    case SYMBOL:
                        // Could be unaryOp or parenthesized expression
                        String sym = firstChild.value;
                        if ("(".equals(sym)) {
                            // '(' expression ')'
                            term_vmInstructions.addAll(compileTree(children.get(1)));
                        } else if ("-".equals(sym) || "~".equals(sym)) {
                            // unaryOp term
                            term_vmInstructions.addAll(compileTree(children.get(1)));
                            if ("-".equals(sym)) {
                                term_vmInstructions.add("neg");
                            } else { // "~"
                                term_vmInstructions.add("not");
                            }
                        } else {
                            throw new IllegalStateException("Unexpected symbol in term: " + sym);
                        }
                        break;

                    default:
                        throw new IllegalStateException("Unexpected token type in term: " + tokenType);
                }

                return term_vmInstructions;
            }


        }

        return vmCode;
    }


    private static class SymbolInfo {
        String type;
        String kind;
        int index;

        SymbolInfo(String type, String kind, int index) {
            this.type = type;
            this.kind = kind;
            this.index = index;
        }
    }

    private String handleVarName(String varName, boolean push) {
        String kind;
        int count;
        if (subroutineScope.containsKey(varName)) {
            SymbolInfo info = subroutineScope.get(varName);
            kind = info.kind;
            count = info.index;
        } else {
            SymbolInfo info = classScope.get(varName);
            kind = switch (info.kind) {
                case "field" -> "this";
                case "static" -> "static";
                default -> info.kind;
            };
            count = info.index;
        }
        return (push ? "push " : "pop ") + kind + " " + count;
    }

    private List<String> compileSubroutineCall(List<Node> nodes) {
        List<String> vmInstructions = new ArrayList<>();

        // Count arguments in the expressionList
        int argCount = 0;
        for (Node expr : nodes.get(nodes.size() - 2).children) {
            if (expr.structureType == Node.StructureType.EXPRESSION) {
                argCount++;
                vmInstructions.addAll(compileTree(expr));
            }
        }

        if (nodes.size() == 6) {
            // Case: foo.bar(...)
            String base = nodes.get(0).value; // foo
            String subroutineName = nodes.get(2).value;

            boolean isObject = subroutineScope.containsKey(base) || classScope.containsKey(base);

            if (isObject) {
                // Push object reference as first argument
                vmInstructions.add(0, handleVarName(base, true));

                SymbolInfo info = subroutineScope.getOrDefault(base, classScope.get(base));
                String type = info.type;

                vmInstructions.add(String.format("call %s.%s %d", type, subroutineName, argCount + 1));
            } else {
                // Static call like ClassName.func(...)
                vmInstructions.add(String.format("call %s.%s %d", base, subroutineName, argCount));
            }

        } else if (nodes.size() == 4) {
            // Case: foo(...) — method in current class
            String subroutineName = nodes.get(0).value;

            vmInstructions.add("push pointer 0"); // push `this` reference
            vmInstructions.add(String.format("call %s.%s %d", currentClassName, subroutineName, argCount + 1));
        }

        return vmInstructions;
    }

}
