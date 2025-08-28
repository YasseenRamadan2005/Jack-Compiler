import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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

            case CONSTANT_DEC:
                //constantDec: 'constant' varName integerConstant;
                ps.addClassConstant(node.children.get(1).children.getFirst().getValue(), node.children.get(2).children.getFirst().getValue());
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
                        ps.addToSubroutineST(child.value, localType, "local");
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
                String while_funcName = ps.getFunctionDeclarationName();

                String labelExp = while_funcName + "_WHILE_EXP" + x;
                String labelEnd = while_funcName + "_WHILE_END" + x;

                whileCode.add("label " + labelExp);
                whileCode.addAll(Objects.requireNonNull(compileTree(node.children.get(2)))); // condition
                whileCode.add("not");
                whileCode.add("if-goto " + labelEnd);
                whileCode.addAll(Objects.requireNonNull(compileTree(node.children.get(5)))); // body
                whileCode.add("goto " + labelExp);
                whileCode.add("label " + labelEnd);

                return whileCode;

            case IF_STATEMENT: {
                int y = ps.getStatementCounter("if");
                String funcName = ps.getFunctionDeclarationName(); // e.g., "Main.main"

                String if_labelTrue = funcName + "$IF_TRUE" + y;
                String if_labelFalse = funcName + "$IF_FALSE" + y;
                String if_labelEnd = funcName + "$IF_END" + y;

                // Compile condition
                List<String> code = new ArrayList<>(Objects.requireNonNull(compileTree(node.children.get(2))));

                if (node.children.size() > 7) {
                    // With ELSE
                    code.add("if-goto " + if_labelTrue);
                    code.add("goto " + if_labelFalse);

                    code.add("label " + if_labelTrue);
                    code.addAll(Objects.requireNonNull(compileTree(node.children.get(5))));
                    code.add("goto " + if_labelEnd);

                    code.add("label " + if_labelFalse);
                    code.addAll(Objects.requireNonNull(compileTree(node.children.get(9))));
                    code.add("label " + if_labelEnd);
                } else {
                    // No ELSE: fallthrough avoids unnecessary label/jump
                    code.add("if-goto " + if_labelTrue);
                    code.add("goto " + if_labelEnd);

                    code.add("label " + if_labelTrue);
                    code.addAll(Objects.requireNonNull(compileTree(node.children.get(5))));
                    // No jump to END needed
                    code.add("label " + if_labelEnd);
                }

                return code;
            }


            case LET_STATEMENT: {
                Node lhsTerm = node.children.get(1); // the TERM node
                String varName = lhsTerm.children.getFirst().value;
                List<String> letCode = new ArrayList<>();

                // Scan for any brackets in the TERM node
                List<Node> bracketExprs = new ArrayList<>();
                for (int j = 1; j < lhsTerm.children.size(); j++) {
                    Node child = lhsTerm.children.get(j);
                    if ("[".equals(child.value)) {
                        Node expr = lhsTerm.children.get(j + 1); // the expression inside brackets
                        bracketExprs.add(expr);
                        j += 2; // skip "[", expr, "]"
                    }
                }

                boolean isArray = !bracketExprs.isEmpty();

                Node rhsExpr = node.children.get(node.children.size() - 2);
                if (isArray) {
                    // Compile RHS expression
                    letCode.addAll(Objects.requireNonNull(compileTree(rhsExpr)));
                    // Push base address
                    letCode.add(ps.handleVarName(varName, true));
                    // For each index: compute and dereference
                    for (int i = 0; i < bracketExprs.size() - 1; i++) {
                        letCode.addAll(compileTree(bracketExprs.get(i))); // index expression
                        letCode.add("add");                   // add offset
                        letCode.add("pop pointer 1");         // THAT = base + index
                        letCode.add("push that 0");           // base = *THAT
                    }
                    // Last index — do not dereference the pointer, just compute final address
                    letCode.addAll(compileTree(bracketExprs.getLast()));
                    letCode.add("add");          // final address

                    letCode.add("pop pointer 1"); // target address → pointer 1
                    letCode.add("pop that 0");    // value → *that
                } else {
                    // Simple assignment
                    letCode.addAll(Objects.requireNonNull(compileTree(rhsExpr)));
                    letCode.add(ps.handleVarName(varName, false));
                }

                return letCode;
            }


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
                        case "<=" -> {
                            vmInstructions.add("gt");
                            vmInstructions.add("not");
                        }
                        case ">=" -> {
                            vmInstructions.add("lt");
                            vmInstructions.add("not");
                        }
                        case "~=" -> {
                            vmInstructions.add("eq");
                            vmInstructions.add("not");
                        }
                        default -> throw new IllegalArgumentException("Unknown operator: " + operator);
                    }
                }
                return vmInstructions;
            }

            case TERM: {
                List<String> term_vmInstructions = new ArrayList<>();
                List<Node> children = node.children;
                Node base = children.getFirst();
                Node.TokenType tokenType = base.tokenType;

                if (tokenType != null) {
                    switch (tokenType) {
                        case INTEGER_CONSTANT:
                            String val = base.value;
                            if (val.contains(".")) {
                                // Float literal → convert to half-float bits
                                float f = Float.parseFloat(val);
                                short halfBits = floatToHalfBits(f);
                                term_vmInstructions.add("push constant " + (halfBits & 0xFFFF));
                            } else {
                                // Normal integer
                                term_vmInstructions.add("push constant " + val);
                            }
                            break;


                        case STRING_CONSTANT:
                            String strVal = base.value;
                            assert strVal != null;


                            // General string (stupid leak for now) :p
                            term_vmInstructions.add("push constant " + strVal.length());
                            term_vmInstructions.add("call String.new 1");
                            for (char c : strVal.toCharArray()) {
                                term_vmInstructions.add("push constant " + (int) c);
                                term_vmInstructions.add("call String.appendChar 2");
                            }

                            break;


                        case KEYWORD:
                            switch (base.value) {
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
                                    throw new IllegalStateException("Null value for keyword :(");
                                default:
                                    throw new IllegalStateException("Unexpected keyword constant: " + base.value);
                            }
                            break;

                        case IDENTIFIER:
                            if (children.size() == 1 || "[".equals(children.get(1).value)) {
                                term_vmInstructions.add(ps.handleVarName(base.value, true));
                            } else {
                                Node second = children.get(1);
                                if (second.tokenType == Node.TokenType.SYMBOL) {
                                    String sym = second.value;
                                    if ("(".equals(sym) || ".".equals(sym)) {
                                        term_vmInstructions.addAll(compileSubroutineCall(children));
                                    } else {
                                        throw new IllegalStateException("Unexpected symbol after identifier: " + sym);
                                    }
                                } else {
                                    throw new IllegalStateException("Unexpected token after identifier: " + second.tokenType);
                                }
                            }
                            break;

                        case SYMBOL:
                            String sym = base.value;
                            if ("(".equals(sym)) {
                                term_vmInstructions.addAll(Objects.requireNonNull(compileTree(children.get(1))));
                            } else if ("-".equals(sym) || "~".equals(sym)) {
                                term_vmInstructions.addAll(Objects.requireNonNull(compileTree(children.get(1))));
                                term_vmInstructions.add("-".equals(sym) ? "neg" : "not");
                            } else {
                                throw new IllegalStateException("Unexpected symbol: " + sym);
                            }
                            break;

                        default:
                            throw new IllegalStateException("Unexpected token type: " + tokenType);
                    }
                } else {
                    throw new RuntimeException("Illegal grammar for terms");
                }

                // Step 2: Handle any `[expression]` segments
                int i = 1;
                while (i < children.size()) {
                    if ("[".equals(children.get(i).value)) {
                        Node expr = children.get(i + 1);
                        term_vmInstructions.addAll(Objects.requireNonNull(compileTree(expr)));
                        term_vmInstructions.add("add");
                        if (i + 3 < children.size() && "[".equals(children.get(i + 3).value)) {
                            // There is another bracket after this one: dereference for nesting
                            term_vmInstructions.add("pop pointer 1");
                            term_vmInstructions.add("push that 0");
                        } else {
                            // Final index: use as address
                            term_vmInstructions.add("pop pointer 1");
                            term_vmInstructions.add("push that 0");
                        }
                        i += 3; // skip [, expr, ]
                    } else {
                        i++;
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

        // Count and compile all arguments in the expressionList
        int argCount = 0;
        for (Node expr : nodes.get(nodes.size() - 2).children) {
            if (expr.structureType == Node.StructureType.EXPRESSION) {
                argCount++;
                vmInstructions.addAll(Objects.requireNonNull(compileTree(expr)));
            }
        }

        if (nodes.size() == 6) {
            // Case: obj.method(...) or Class.function(...)
            String base = nodes.get(0).value; // either variable name (object) or class name
            String subroutineName = nodes.get(2).value;

            ProgramState.SymbolInfo symbol = ps.lookupSymbol(base);

            if (symbol != null) {
                vmInstructions.addFirst(ps.handleVarName(base, true)); // push obj as first arg
                vmInstructions.add(String.format("call %s.%s %d", symbol.type, subroutineName, argCount + 1));
            } else {
                vmInstructions.add(String.format("call %s.%s %d", base, subroutineName, argCount));
            }
        } else if (nodes.size() == 4) {
            // Case: method(...) — implicit `this` method call
            String subroutineName = nodes.getFirst().value;
            // Normal method on this
            vmInstructions.addFirst("push pointer 0"); // push this
            vmInstructions.add(String.format("call %s.%s %d", ps.getClassName(), subroutineName, argCount + 1));
        }

        return vmInstructions;
    }

    public static short floatToHalfBits(float value) {
        int bits = Float.floatToIntBits(value);
        int sign = (bits >>> 16) & 0x8000;       // sign
        int exp = (bits >>> 23) & 0xFF;          // exponent
        int mant = bits & 0x7FFFFF;              // mantissa

        if (exp == 255) { // Inf/NaN
            return (short) (sign | 0x7C00 | (mant != 0 ? 1 : 0));
        }

        if (exp > 142) { // Overflow -> Inf
            return (short) (sign | 0x7C00);
        }

        if (exp < 113) { // Subnormal or underflow
            if (exp < 103) {
                return (short) sign; // underflow to zero
            }
            mant |= 0x800000;
            int shift = 126 - exp;
            mant = mant >> (shift + 13);
            return (short) (sign | mant);
        }

        // Normalized
        exp = exp - 112;
        mant = mant >> 13;
        return (short) (sign | (exp << 10) | mant);
    }

}
