package VMTranslator.vmcode;

import java.util.*;

public class VMParser {
    public static String moduleName; //Name of the current X.vm file
    public static String currentFunction = "";//Name of the current function we are in
    private final List<String> lines;
    public Map<String, Integer> funcMapping = new HashMap<>();
    public Integer compNum; //Counter to generate unique labels

    public VMParser(List<String> lines, String moduleName) {
        this.lines = lines;
        VMParser.moduleName = moduleName;
        compNum = 0;
    }

    /**
     * Pops and returns the next (+1) PushGroup, skipping net-zero items.
     */
    private static PushGroup popNextPush(Deque<VMinstruction> stack) throws Exception {
        List<VMinstruction> temp = new ArrayList<>();
        PushGroup found = null;

        while (!stack.isEmpty()) {
            VMinstruction v = stack.removeLast();
            temp.add(v);

            if (v instanceof PushGroup pg) {
                found = pg;
                break;
            }
        }

        if (found == null) {
            // Restore stack
            for (int i = temp.size() - 1; i >= 0; i--) {
                stack.addLast(temp.get(i));
            }
            throw new Exception("stack underflow while searching for operand");
        }

        // Put back everything *except* the one we matched
        for (int i = temp.size() - 2; i >= 0; i--) {
            stack.addLast(temp.get(i));
        }

        return found;
    }


    public List<VMinstruction> parse() throws Exception {
        List<VMinstruction> flat = new ArrayList<>();
        //flat.add(new CallInstruction("Sys.init", 0, funcMapping, "global"));
        for (String line : removeComments(lines)) {
            flat.add(parseLine(line));
        }
        //return flat;
        return group(flat);
    }

// ─────────────────── helper ───────────────────

    private List<VMinstruction> group(List<VMinstruction> work) throws Exception {
        Deque<VMinstruction> todo = new ArrayDeque<>(work); // tail == top
        Deque<VMinstruction> stack = new ArrayDeque<>();
        List<VMinstruction> fuck = new ArrayList<>();
        while (!todo.isEmpty()) {
            VMinstruction cur = todo.removeFirst();   // process tail-first

            switch (cur) {
                case CallGroup c -> stack.addLast(c);

                case PushGroup pg -> stack.addLast(pg);


                case PopInstruction pop -> {
                    if (VMParser.currentFunction.equals("Memory.getBinIndex")) {
                        int x = 0;
                    }
                    // Try to find the most recent PushGroup
                    PushGroup pg = popNextPush(stack);
                    // See if there’s a previously grouped PPP already waiting to be nested
                    if (!stack.isEmpty() && stack.peekLast() instanceof PushPopPair ppp) {
                        stack.removeLast(); // remove the previous PPP
                        stack.addLast(new PushPopPair(ppp, pg, pop));
                    } else {
                        stack.addLast(new PushPopPair(pg, pop));
                    }


                    if (stack.isEmpty()) throw new Exception("pop without matching push");
                }


                case ArithmeticInstruction ai -> {
                    if (ai.isUnary()) {
                        if (stack.isEmpty()) throw new Exception(ai + " unary op without arg");
                        PushGroup pg = popNextPush(stack);                 // use helper
                        if (pg instanceof UnaryPushGroup u) {
                            if (u.getOp().equals(ai.getOp())) {
                                // neg(neg(x)) or not(not(x)) → x
                                stack.addLast(u.getInner());
                            } else if ((ai.getOp() == ArithmeticInstruction.Op.NOT && u.getOp() == ArithmeticInstruction.Op.NEG) || (ai.getOp() == ArithmeticInstruction.Op.NEG && u.getOp() == ArithmeticInstruction.Op.NOT)) {
                                // neg(not(x)) → x + 1, not(neg(x)) → x - 1
                                PushInstruction one = new PushInstruction(new Address("constant", (short) 1));
                                ArithmeticInstruction.Op binOp = (ai.getOp() == ArithmeticInstruction.Op.NOT) ? ArithmeticInstruction.Op.SUB : ArithmeticInstruction.Op.ADD;
                                stack.addLast(new BinaryPushGroup(u.getInner(), one, binOp));
                            } else {
                                // No simplification
                                stack.addLast(new UnaryPushGroup(pg, ai.getOp()));
                            }
                        } else {
                            stack.addLast(new UnaryPushGroup(pg, ai.getOp()));
                        }


                    } else { // binary
                        // need two PushGroups, skipping any net-zero items on top
                        PushGroup right = popNextPush(stack);
                        PushGroup left = popNextPush(stack);
                        stack.addLast(new BinaryPushGroup(left, right, ai.getOp()));
                    }
                }


                case CallInstruction call -> {
                    int n = call.getArgs();
                    List<PushGroup> args = new ArrayList<>(n);

                    for (int i = 0; i < n; i++) {
                        if (stack.isEmpty()) throw new Exception("not enough args for call " + call.getFunctionName());
                        args.addFirst(popNextPush(stack));    // skip net-0 items
                    }

                    stack.addLast(new CallGroup(args, call));
                }


                case IfGotoInstruction ifg -> {
                    if (stack.isEmpty() || !(stack.peekLast() instanceof PushGroup cond))
                        throw new Exception("if-goto without condition");
                    stack.removeLast();
                    stack.addLast(new ConditionalGroup(cond, ifg));
                }

                case FunctionInstruction f -> {
                    fuck.addAll(stack);
                    stack.clear();
                    VMParser.currentFunction = f.getFuncName();
                    fuck.addLast(f);
                }
                default -> stack.addLast(cur); // keep labels, goto, function, return, etc.
            }
        }

        return new ArrayList<>(fuck);
    }

    private VMinstruction parseLine(String line) {
        String[] tokens = line.split("\\s+");
        String cmd = tokens[0];

        switch (cmd) {
            case "push", "pop" -> {
                requireLength(tokens, 3, line);
                Address address = new Address(tokens[1], (short) Integer.parseInt(tokens[2]));
                return cmd.equals("push") ? new PushInstruction(address) : new PopInstruction(address);
            }
            case "label" -> {
                requireLength(tokens, 2, line);
                return new LabelInstruction(tokens[1]);
            }
            case "goto" -> {
                requireLength(tokens, 2, line);
                return new GotoInstruction(tokens[1]);
            }
            case "if-goto" -> {
                requireLength(tokens, 2, line);
                return new IfGotoInstruction(tokens[1]);
            }
            case "function" -> {
                requireLength(tokens, 3, line);
                VMParser.currentFunction = tokens[1];
                return new FunctionInstruction(tokens[1], Integer.parseInt(tokens[2]), funcMapping);
            }
            case "call" -> {
                requireLength(tokens, 3, line);
                return new CallInstruction(tokens[1], Integer.parseInt(tokens[2]), funcMapping);
            }
            case "return" -> {
                requireLength(tokens, 1, line);
                return new ReturnInstruction();
            }
            case "add", "sub", "neg", "and", "or", "not", "gt", "lt", "eq" -> {
                requireLength(tokens, 1, line);

                // map the lowercase VM keyword to the enum constant
                ArithmeticInstruction.Op op = switch (cmd) {
                    case "add" -> ArithmeticInstruction.Op.ADD;
                    case "sub" -> ArithmeticInstruction.Op.SUB;
                    case "and" -> ArithmeticInstruction.Op.AND;
                    case "or" -> ArithmeticInstruction.Op.OR;
                    case "neg" -> ArithmeticInstruction.Op.NEG;
                    case "not" -> ArithmeticInstruction.Op.NOT;
                    case "gt" -> ArithmeticInstruction.Op.GT;
                    case "eq" -> ArithmeticInstruction.Op.EQ;
                    case "lt" -> ArithmeticInstruction.Op.LT;
                    default -> throw new IllegalStateException("Unhandled op: " + cmd);
                };

                return new ArithmeticInstruction(op);
            }

            default -> throw new IllegalArgumentException("Unknown command: " + line);
        }
    }

    private void requireLength(String[] tokens, int expected, String line) {
        if (tokens.length != expected)
            throw new IllegalArgumentException("Expected " + expected + " tokens but got " + tokens.length + " for line: " + line);
    }


    private List<String> removeComments(List<String> rawLines) {
        List<String> cleaned = new ArrayList<>();
        for (String line : rawLines) {
            String noComment = line.split("//", 2)[0].trim();
            if (!noComment.isEmpty()) cleaned.add(noComment);
        }
        return cleaned;
    }
}
