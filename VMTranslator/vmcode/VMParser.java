package VMTranslator.vmcode;

import VMTranslator.VMTranslator;

import java.util.*;

public class VMParser {
    public static String moduleName = ""; //Name of the current X.vm file
    public static String currentFunction = "";//Name of the current function we are in
    private final List<String> lines;
    public Map<String, Integer> funcMapping = new HashMap<>();
    public Integer compNum; //Counter to generate unique labels

    public VMParser(List<String> lines, String moduleName) {
        this.lines = lines;
        VMParser.moduleName = moduleName;
        compNum = 0;
    }


    private static PushGroup getThePushOnTop(Deque<VMinstruction> stack) throws Exception {
        if (stack.isEmpty()) {
            throw new Exception("Empty stack when looking for a PushGroup");
        }
        if (stack.peekLast() instanceof PushGroup pg) {
            stack.removeLast();
            return pg;
        } else {
            throw new Exception("No PushGroup on top. " + VMParser.currentFunction + " " + VMParser.moduleName);
        }
    }


    public List<VMinstruction> parse() throws Exception {
        List<VMinstruction> flat = new ArrayList<>();
        //flat.add(new CallInstruction("Sys.init", 0, funcMapping, "global"));
        for (String line : removeComments(lines)) {
            flat.add(parseLine(line));
        }
        return flat;
    }

// ─────────────────── helper ───────────────────

    static public List<VMinstruction> group(List<VMinstruction> work) throws Exception {
        Deque<VMinstruction> todo = new ArrayDeque<>(work); // tail == top
        Deque<VMinstruction> stack = new ArrayDeque<>();
        List<VMinstruction> context = new ArrayList<>();
        while (!todo.isEmpty()) {
            VMinstruction cur = todo.removeFirst();   // process tail-first
            switch (cur) {
                case CallGroup c -> stack.addLast(c);
                case PushGroup pg -> {
                    if (!stack.isEmpty() && stack.getLast() instanceof PushPopPair PPP && PPP.getPopAddress().equals(new Address("pointer", (short) 1)) && pg instanceof PushInstruction pi && pi.equals(new PushInstruction(new Address("that", (short) 0)))) {
                        Dereference d = new Dereference(PPP.getPush());
                        stack.removeLast();
                        stack.addLast(d);
                    } else {
                        stack.addLast(pg);
                    }
                }

                case PopInstruction pop -> {
                    if (stack.isEmpty()) {
                        throw new Exception("pop without matching push");
                    }
                    if (stack.peekLast() instanceof PushPopPair ppp && ppp.getPopAddress().equals(new Address("pointer", (short) 1)) && pop.getAddress().equals(new Address("that", (short) 0))) {
                        PushPopPair thePPP = (PushPopPair) stack.removeLast();
                        if (stack.peekLast() instanceof PushGroup) {
                            PushGroup pg = (PushGroup) stack.getLast(); //This is the source
                            stack.removeLast();
                            stack.addLast(new PushWriter(pg, thePPP.getPush()));
                        } else {
                            throw new Exception("error when creating PushWriter");
                        }
                    } else {
                        if (stack.peekLast() instanceof PushGroup pg) {
                            stack.removeLast();
                            stack.addLast(new PushPopPair(pg, pop));
                        } else {
                            throw new Exception("pop without matching push");
                        }
                    }
                }


                case ArithmeticInstruction ai -> {
                    if (ai.isUnary()) {
                        if (stack.isEmpty()) throw new Exception(ai + " unary op without arg");
                        PushGroup pg = getThePushOnTop(stack);

                        if (pg.isConstant()) {
                            // Constant folding for unary op
                            short value = pg.getConstant();
                            ArithmeticInstruction.Op op = ai.getOp();
                            if (op == ArithmeticInstruction.Op.NEG) {
                                stack.addLast(new PushInstruction(new Address("constant", (short) (-value))));
                            } else if (op == ArithmeticInstruction.Op.NOT) {
                                stack.addLast(new PushInstruction(new Address("constant", (short) (~value))));
                            } else {
                                stack.addLast(new UnaryPushGroup(pg, op)); // fallback
                            }
                        } else if (pg instanceof UnaryPushGroup u) {
                            if (u.getOp() == ai.getOp()) {
                                // neg(neg(x)) or not(not(x)) → x
                                stack.addLast(u.getInner());
                            } else if ((ai.getOp() == ArithmeticInstruction.Op.NOT && u.getOp() == ArithmeticInstruction.Op.NEG) || (ai.getOp() == ArithmeticInstruction.Op.NEG && u.getOp() == ArithmeticInstruction.Op.NOT)) {
                                // neg(not(x)) → x + 1, not(neg(x)) → x - 1
                                PushInstruction one = new PushInstruction(new Address("constant", (short) 1));
                                ArithmeticInstruction.Op binOp = (ai.getOp() == ArithmeticInstruction.Op.NOT) ? ArithmeticInstruction.Op.SUB : ArithmeticInstruction.Op.ADD;
                                stack.addLast(new BinaryPushGroup(u.getInner(), one, binOp));
                            } else {
                                stack.addLast(new UnaryPushGroup(pg, ai.getOp()));
                            }
                        } else {
                            stack.addLast(new UnaryPushGroup(pg, ai.getOp()));
                        }

                    } else { // binary
                        PushGroup right = getThePushOnTop(stack);
                        PushGroup left = getThePushOnTop(stack);
                        ArithmeticInstruction.Op op = ai.getOp();

                        if (left.isConstant() && right.isConstant()) {
                            // Constant folding for binary op
                            int lv = left.getConstant(), rv = right.getConstant();
                            short result;

                            switch (op) {
                                case ADD -> result = (short) (lv + rv);
                                case SUB -> result = (short) (lv - rv);
                                case AND -> result = (short) (lv & rv);
                                case OR -> result = (short) (lv | rv);
                                case LT -> result = (short) ((lv < rv) ? -1 : 0);
                                case GT -> result = (short) ((lv > rv) ? -1 : 0);
                                case EQ -> result = (short) ((lv == rv) ? -1 : 0);
                                default -> {
                                    throw new IllegalStateException("Unexpected op " + op);
                                }
                            }

                            stack.addLast(new PushInstruction(new Address("constant", result)));
                        } else {
                            stack.addLast(new BinaryPushGroup(left, right, op));
                        }
                    }

                }


                case CallInstruction call -> {
                    int n = call.getArgs();
                    List<PushGroup> args = new ArrayList<>(n);

                    for (int i = 0; i < n; i++) {
                        if (stack.isEmpty()) throw new Exception("not enough args for call " + call.getFunctionName());
                        args.addFirst(getThePushOnTop(stack));
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
                    context.addAll(stack);
                    stack.clear();
                    VMParser.currentFunction = f.getFuncName();
                    context.addLast(f);
                }

                case ReturnInstruction r -> stack.addLast(r);


                default -> stack.addLast(cur); // keep labels, goto, function, return, etc.
            }
        }
        context.addAll(stack);
        return new ArrayList<>(context);
    }

    public static List<VMinstruction> groupConstantsOnly(List<VMinstruction> work) throws Exception {
        Deque<VMinstruction> todo = new ArrayDeque<>(work);  // tail == top
        Deque<VMinstruction> stack = new ArrayDeque<>();

        while (!todo.isEmpty()) {
            VMinstruction cur = todo.removeFirst();

            switch (cur) {
                case ArithmeticInstruction ai -> {
                    if (ai.isUnary()) {
                        if (stack.isEmpty()) throw new Exception("Unary op with no operand");
                        VMinstruction last = stack.removeLast();
                        if (last instanceof PushInstruction pi && pi.getAddress().getSegment().equals("constant")) {
                            short value = pi.getAddress().getIndex();
                            short folded = switch (ai.getOp()) {
                                case NEG -> (short) -value;
                                case NOT -> (short) ~value;
                                default -> throw new IllegalStateException("Invalid unary op: " + ai.getOp());
                            };
                            stack.addLast(new PushInstruction(new Address("constant", folded)));
                        } else {
                            stack.addLast(last);
                            stack.addLast(ai); // no folding
                        }
                    } else {
                        if (stack.size() < 2) throw new Exception("Binary op with too few operands");
                        VMinstruction b = stack.removeLast();
                        VMinstruction a = stack.removeLast();

                        if (a instanceof PushInstruction pa && b instanceof PushInstruction pb && pa.getAddress().getSegment().equals("constant") && pb.getAddress().getSegment().equals("constant")) {

                            int x = pa.getAddress().getIndex();
                            int y = pb.getAddress().getIndex();
                            short folded = switch (ai.getOp()) {
                                case ADD -> (short) (x + y);
                                case SUB -> (short) (x - y);
                                case AND -> (short) (x & y);
                                case OR -> (short) (x | y);
                                case EQ -> (short) (x == y ? -1 : 0);
                                case LT -> (short) (x < y ? -1 : 0);
                                case GT -> (short) (x > y ? -1 : 0);
                                default -> throw new IllegalStateException("Invalid binary op: " + ai.getOp());
                            };

                            stack.addLast(new PushInstruction(new Address("constant", folded)));
                        } else {
                            stack.addLast(a);
                            stack.addLast(b);
                            stack.addLast(ai); // no folding
                        }
                    }
                }

                default -> stack.addLast(cur); // keep everything else
            }
        }

        return new ArrayList<>(stack);
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
