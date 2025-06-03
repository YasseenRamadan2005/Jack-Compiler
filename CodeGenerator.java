import java.util.*;

public class CodeGenerator {
    private final Node root;
    private ProgramState ps;

    public CodeGenerator(Node theRoot) {
        this.root = theRoot;
        this.ps = new ProgramState();
    }

    public List<String> generateCode() {
        return compileTree(root);
    }

    private List<String> compileTree(Node node) {

        switch (node.structureType) {
            case CLASS:
                //"'class': className '{' classVarDec* subroutineDec* '}'"
                List<String> classCode = new ArrayList<>();
                ps.setClassName(node.children.get(1).value);
                for (int i = 3; i < node.children.size() - 1; i++) {
                    classCode.addAll(Objects.requireNonNull(compileTree(node.children.get(i))));
                }
                return classCode;

            case CLASS_VAR_DEC:
                //"classVarDec: ('static'|'field') type varName (',' varName)* ';'"
                for (int i = 2; i < node.children.size(); i++) {
                    Node child = node.children.get(i);
                    if (child.tokenType == Node.TokenType.IDENTIFIER) {
                        ps.addToClassST(child.getValue(), node.children.get(1).value, node.children.get(0).value);
                    }
                }
                return List.of();

            case SUBROUTINE_DEC:
                //"('constructor'|'function'|'method') ('void' | type) subroutineName '(' parameterList ')' subroutineBody"
                ps.resetSubroutineST();
                String subroutineType = node.children.get(0).value; // constructor/function/method
                //If the function is a method, then there is always one "argument" - the pointer to the object
                if (subroutineType.equals("method")) {
                    ps.incrementVarCount("argument");
                }
                ps.setSubroutineName(node.children.get(2).value);
                // Compile parameterList
                compileTree(node.children.get(4)); // updates subroutineScope and varCounts["argument"]
                ps.addFunctionStatementCounter();
                List<String> bodyCode = new ArrayList<>(Objects.requireNonNull(compileTree(node.children.get(6))));
                bodyCode.add(0, String.format("function %s %d", ps.getFunctionDeclarationName(), ps.getVarCount("local")));
                if ("method".equals(subroutineType)) {
                    bodyCode.add(1, "push argument 0");
                    bodyCode.add(2, "pop pointer 0");
                } else if ("constructor".equals(subroutineType)) {
                    bodyCode.add(1, "push constant " + ps.getVarCount("field"));
                    bodyCode.add(2, "call Memory.alloc 1");
                    bodyCode.add(3, "pop pointer 0");
                }
                return bodyCode;

            case PARAMETER_LIST:
                //"parameterList: ((type varName) (',' type varName)*)?"
                for (int i = 0; i < node.children.size(); i += 3) {
                    ps.addToSubroutineST(node.children.get(i + 1).value, node.children.get(i).value, "argument");
                }
                return List.of();

            case SUBROUTINE_BODY:
                //"subroutineBody: '{' varDec* statements '}'"
                List<String> bodyInstructions = new ArrayList<>();
                for (int i = 1; i < node.children.size() - 1; i++) {
                    bodyInstructions.addAll(Objects.requireNonNull(compileTree(node.children.get(i))));
                }
                return bodyInstructions;


            case VAR_DEC:
                //"varDec: 'var' type varName (',' varName)* ';'"
                String localType = node.children.get(1).value;
                for (int i = 2; i < node.children.size(); i++) {
                    Node child = node.children.get(i);
                    if (child.tokenType == Node.TokenType.IDENTIFIER) {
                        ps.addToSubroutineST(child.value, node.children.get(1).value, "local");
                    }
                }
                return List.of();

            case STATEMENTS:
                List<String> statements = new ArrayList<>();
                for (Node child : node.children) {
                    statements.addAll(Objects.requireNonNull(compileTree(child)));
                }
                return statements;

            case WHILE_STATEMENT:
                List<String> whileCode = new ArrayList<>();
                int x = ps.getStatementCounter("while");
                String labelStart = "WHILE_START_" + ps.getFunctionDeclarationName() + x;
                String labelEnd = "WHILE_END_" + ps.getFunctionDeclarationName() + x;

                whileCode.add("label " + labelStart);
                whileCode.addAll(Objects.requireNonNull(compileTree(node.children.get(2)))); // condition
                whileCode.add("if-goto " + labelEnd);
                whileCode.addAll(Objects.requireNonNull(compileTree(node.children.get(5)))); // body
                whileCode.add("goto " + labelStart);
                whileCode.add("label " + labelEnd);

                return whileCode;

            case IF_STATEMENT:
                int y = ps.getStatementCounter("if");
                String funcName = ps.getFunctionDeclarationName();

                List<String> ifCode = new ArrayList<>(Objects.requireNonNull(compileTree(node.children.get(2)))); // condition
                ifCode.add("not");
                ifCode.add("if-goto " + funcName + ".IfElse" + y);

                ifCode.addAll(Objects.requireNonNull(compileTree(node.children.get(5)))); // then block

                if (node.children.size() > 7) {
                    ifCode.add("goto " + funcName + ".IfElse" + y);
                    ifCode.add("label " + funcName + ".IfElse" + y);
                    ifCode.addAll(Objects.requireNonNull(compileTree(node.children.get(9)))); // else block ✅
                }

                ifCode.add("label " + funcName + ".IfElse" + y);
                return ifCode;


            case LET_STATEMENT:
                String varName = node.children.get(1).value;
                List<String> letCode = new ArrayList<>();

                if (node.children.size() > 5) {
                    // let x[expr1] = expr2;
                    letCode.addAll(Objects.requireNonNull(compileTree(node.children.get(3)))); // expr1
                    letCode.add(ps.handleVarName(varName, true)); // push base
                    letCode.add("add");
                    letCode.add("pop pointer 1");
                    letCode.addAll(Objects.requireNonNull(compileTree(node.children.get(node.children.size() - 2)))); // expr2
                    letCode.add("pop that 0");
                } else {
                    // let x = expr;
                    letCode.addAll(Objects.requireNonNull(compileTree(node.children.get(node.children.size() - 2))));
                    letCode.add(ps.handleVarName(varName, false)); // pop into x
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
                    returnCode.addAll(Objects.requireNonNull(compileTree(node.children.get(1)))); // return expression
                } else {
                    returnCode.add("push constant 0"); // void
                }
                returnCode.add("return");
                return returnCode;

            case EXPRESSION: {
                // Compile the first term
                List<String> vmInstructions = new ArrayList<>(Objects.requireNonNull(compileTree(node.children.getFirst())));

                // Process (op term)* — binary operations
                for (int i = 1; i < node.children.size(); i += 2) {
                    String operator = node.children.get(i).value;

                    // Compile the next term
                    vmInstructions.addAll(Objects.requireNonNull(compileTree(node.children.get(i + 1))));

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
                Node firstChild = children.getFirst();
                Node.TokenType tokenType = firstChild.tokenType;
                Node.StructureType structureType = firstChild.structureType;
                if (tokenType != null) {
                    switch (tokenType) {
                        case INTEGER_CONSTANT:
                            // integerConstant
                            term_vmInstructions.add("push constant " + firstChild.value);
                            break;

                        case STRING_CONSTANT:
                            // stringConstant (guarantee leak for now)
                            String strVal = firstChild.value;
                            assert strVal != null;
                            term_vmInstructions.add("push constant " + strVal.length());
                            term_vmInstructions.add("call String.new.1 1");
                            for (char c : strVal.toCharArray()) {
                                term_vmInstructions.add("push constant " + (int) c);
                                term_vmInstructions.add("call String.appendChar.1 2");
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
                                case null:
                                    break;
                                default:
                                    throw new IllegalStateException("Unexpected keyword constant: " + firstChild.value);
                            }
                            break;

                        case IDENTIFIER:
                            // Could be varName alone, varName '[' expression ']', or subroutineCall
                            if (children.size() == 1) {
                                // Just a variable
                                term_vmInstructions.add(ps.handleVarName(firstChild.value, true));
                            } else {
                                Node secondChild = children.get(1);

                                if (secondChild.tokenType == Node.TokenType.SYMBOL) {
                                    String sym = secondChild.value;

                                    if ("[".equals(sym)) {
                                        // varName '[' expression ']'
                                        term_vmInstructions.addAll(Objects.requireNonNull(compileTree(children.get(2)))); // expression
                                        term_vmInstructions.addAll(List.of(ps.handleVarName(firstChild.value, true), "add", "pop pointer 1", "push that 0"));
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
                                term_vmInstructions.addAll(Objects.requireNonNull(compileTree(children.get(1))));
                            } else if ("-".equals(sym) || "~".equals(sym)) {
                                // unaryOp term
                                term_vmInstructions.addAll(Objects.requireNonNull(compileTree(children.get(1))));
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
                }
                else{
                    if (structureType == Node.StructureType.EXPRESSION){
                        term_vmInstructions.addAll(Objects.requireNonNull(compileTree(firstChild)));
                    }
                    else{
                        throw new RuntimeException("The only StructureType allowed in a term is an expression");
                    }
                }
                return term_vmInstructions;
            }

            case EXPRESSION_LIST:
                //(expression (',' expression)* )?
                List<String> expressionListVM = new ArrayList<>();
                for (int i = 0; i < node.children.size(); i += 2) {
                    expressionListVM.addAll(Objects.requireNonNull(compileTree(node.children.get(i))));
                }
                return expressionListVM;

            case null:
                break;
        }

        return null;
    }

    private List<String> compileSubroutineCall(List<Node> nodes) {
        List<String> vmInstructions = new ArrayList<>();

        // Count arguments in the expressionList
        int argCount = 0;
        for (Node expr : nodes.get(nodes.size() - 2).children) {
            if (expr.structureType == Node.StructureType.EXPRESSION) {
                argCount++;
                vmInstructions.addAll(Objects.requireNonNull(compileTree(expr)));
            }
        }

        if (nodes.size() == 6) {
            // Case: foo.bar(...)
            String base = nodes.get(0).value; // foo
            String subroutineName = nodes.get(2).value;

            ProgramState.SymbolInfo symbol = ps.lookupSymbol(base);

            if (symbol != null) {
                // Push object reference as first argument
                vmInstructions.addFirst(ps.handleVarName(base, true));
                vmInstructions.add(String.format("call %s.%s.%d %d", symbol.type, subroutineName, argCount + 1, argCount + 1));
            } else {
                // Static call like ClassName.func(...)
                vmInstructions.add(String.format("call %s.%s.%d %d", base, subroutineName, argCount, argCount));
            }
        } else if (nodes.size() == 4) {
            // Case: foo(...) — method in current class
            String subroutineName = nodes.getFirst().value;

            vmInstructions.add("push pointer 0"); // push `this` reference
            vmInstructions.add(String.format("call %s.%s.%d %d", ps.getClassName(), subroutineName, argCount + 1, argCount + 1));
        }

        return vmInstructions;
    }

}
