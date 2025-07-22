package VMTranslator;

import VMTranslator.vmcode.*;

import java.io.File;
import java.nio.file.Files;
import java.util.*;

//Basic: 47 lines

public class VMTranslator {
    public static boolean thread = false;
    private final File[] vmFiles;
    private final File outputFile;
    public int machineLine;

    public VMTranslator(File[] vmFiles, File outputFile) {
        this.vmFiles = vmFiles;
        this.outputFile = outputFile;
        machineLine = 0;
    }

    public void translate() throws Exception {
        List<String> bootstrapCode = new ArrayList<>(List.of("// Set 256 to be the start of the stack", "@256", "D=A", "@SP", "M=D",

                "// Set up the comparison ops subroutines", "@SKIP", "0;JMP",

                "// gt: D > 0", "(DO_GT)", "@RETURN_TRUE", "D;JGT", "@RETURN_FALSE", "0;JMP",

                "// eq: D == 0", "(DO_EQ)", "@RETURN_TRUE", "D;JEQ", "@RETURN_FALSE", "0;JMP",

                "// lt: D < 0", "(DO_LT)", "@RETURN_TRUE", "D;JLT", "@RETURN_FALSE", "0;JMP",

                "// Set boolean in D", "(RETURN_TRUE)", "D=-1", "@WRITE_BACK", "0;JMP", "(RETURN_FALSE)", "D=0", "@WRITE_BACK", "0;JMP",

                "// Collapse stack and return", "(WRITE_BACK)", "@SP", "AM=M-1", "A=M", "0;JMP",

                "// Function call/return setup", "(SKIP)", "@SKIP1", "0;JMP",

                "(CALL)", "@SP", "AM=M+1", "A=A-1", "M=D", // push return address (in D)
                "@LCL", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", "@ARG", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", "@THIS", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", "@THAT", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", "@14", "D=M", "@SP", "D=M-D", "@ARG", "M=D", "@SP", "D=M", "@LCL", "M=D", "@13", "A=M", "0;JMP",

                "(RETURN)", "@LCL", "D=M", "@14", "M=D", "@5", "A=D-A", "D=M", "@15", "M=D", // store return address
                "@SP", "AM=M-1", "D=M", "@ARG", "A=M", "M=D", // reposition return value
                "@ARG", "D=M", "@SP", "M=D+1", // SP = ARG + 1

                "@14", "A=M-1", "D=M", "@THAT", "M=D", "@14", "A=M-1", "A=A-1", "D=M", "@THIS", "M=D", "@14", "A=M-1", "A=A-1", "A=A-1", "D=M", "@ARG", "M=D", "@14", "A=M-1", "A=A-1", "A=A-1", "A=A-1", "D=M", "@LCL", "M=D", "@15", "A=M", "0;JMP",

                "(PUSH_D)", "@SP", "AM=M+1", "A=A-1", "M=D", "@13", "A=M", "0;JMP",

                "(ARG_PUSH)", "@ARG", "A=D+M", "D=M", "@PUSH_D", "0;JMP", "(LCL_PUSH)", "@LCL", "A=D+M", "D=M", "@PUSH_D", "0;JMP", "(THIS_PUSH)", "@THIS", "A=D+M", "D=M", "@PUSH_D", "0;JMP", "(THAT_PUSH)", "@THAT", "A=D+M", "D=M", "@PUSH_D", "0;JMP",

                "(SKIP1)"));

        Map<String, List<VMinstruction>> functionBodies = new HashMap<>();
        Map<String, Set<String>> callGraph = new HashMap<>();
        Map<String, Set<String>> reverseCallGraph = new HashMap<>();
        String currentFunction = null;

        for (File vmFile : vmFiles) {
            List<String> lines = Files.readAllLines(vmFile.toPath());
            VMParser parser = new VMParser(lines, getModuleName(vmFile));
            VMParser.moduleName = getModuleName(vmFile);
            List<VMinstruction> instructions = parser.parse();

            for (VMinstruction inst : instructions) {
                if (inst instanceof FunctionInstruction f) {
                    currentFunction = f.getFuncName();
                    functionBodies.putIfAbsent(currentFunction, new ArrayList<>());
                    callGraph.putIfAbsent(currentFunction, new HashSet<>());
                }

                if (currentFunction != null) {
                    functionBodies.get(currentFunction).add(inst);
                }

                if (inst instanceof CallInstruction callInst) {
                    String callee = callInst.getFunctionName();
                    callGraph.computeIfAbsent(currentFunction, k -> new HashSet<>()).add(callee);
                    reverseCallGraph.computeIfAbsent(callee, k -> new HashSet<>()).add(currentFunction);
                }
            }
        }
        Set<String> reachableFunctions = new HashSet<>();
        Deque<String> worklist = new ArrayDeque<>();
        worklist.add("Sys.init");
        while (!worklist.isEmpty()) {
            String function = worklist.poll();
            if (!reachableFunctions.add(function)) continue;

            worklist.addAll(callGraph.getOrDefault(function, Set.of()));
        }
        List<String> allAssemblyLines = new ArrayList<>();

        if (thread) {
            bootstrapCode.clear();
            bootstrapCode.addAll(List.of("@256", "D=A", "@SP", "M=D", "@SKIP", "0;JMP"));

            Set<Address> pushAddresses = new HashSet<>();
            Set<Address> popAddresses = new HashSet<>();
            Set<Address> pushStaticAddress = new HashSet<>();
            Set<Address> popStaticAddresses = new HashSet<>();

            String previousModule = null;
            List<String> sortedFunctions = new ArrayList<>(reachableFunctions);
            Collections.sort(sortedFunctions);

            for (String function : sortedFunctions) {
                String currentModule = function.substring(0, function.indexOf("."));

                // Flush static subroutines BEFORE switching to the next module
                if (previousModule != null && !previousModule.equals(currentModule)) {
                    for (Address a : pushStaticAddress) {
                        bootstrapCode.addAll(List.of("(" + previousModule + "." + a.getIndex() + "_PUSH)", "@" + previousModule + "." + a.getIndex(), "D=M", "@PC_PUSH", "0;JMP"));
                    }
                    for (Address a : popStaticAddresses) {
                        bootstrapCode.addAll(List.of("(" + previousModule + "." + a.getIndex() + "_POP)", "@SP", "AM=M-1", "D=M", "@" + previousModule + "." + a.getIndex(), "M=D", "@PC_2", "0;JMP"));
                    }
                    pushStaticAddress.clear();
                    popStaticAddresses.clear();
                }

                // Now switch to current module
                VMParser.moduleName = currentModule;
                previousModule = currentModule;

                List<VMinstruction> grouped = VMParser.group(functionBodies.get(function));
                functionBodies.put(function, grouped);

                for (VMinstruction v : grouped) {
                    if (v instanceof PushInstruction pushI) {
                        if ("static".equals(pushI.getAddress().getSegment())) {
                            pushStaticAddress.add(pushI.getAddress());
                        } else {
                            pushAddresses.add(pushI.getAddress());
                        }
                    } else if (v instanceof PopInstruction popI) {
                        if ("static".equals(popI.getAddress().getSegment())) {
                            popStaticAddresses.add(popI.getAddress());
                        } else {
                            popAddresses.add(popI.getAddress());
                        }
                    }
                }
            }
            // Flush the last module's static push/pop subroutines
            if (previousModule != null) {
                for (Address a : pushStaticAddress) {
                    bootstrapCode.addAll(List.of("(" + previousModule + "." + a.getIndex() + "_PUSH)", "@" + previousModule + "." + a.getIndex(), "D=M", "@PC_PUSH", "0;JMP"));
                }
                for (Address a : popStaticAddresses) {
                    bootstrapCode.addAll(List.of("(" + previousModule + "." + a.getIndex() + "_POP)", "@SP", "AM=M-1", "D=M", "@" + previousModule + "." + a.getIndex(), "M=D", "@PC_2", "0;JMP"));
                }
            }

            for (Address a : pushAddresses) {
                String label = "PUSH_" + a.getSegment() + "_" + a.getIndex();
                switch (a.getSegment()) {
                    case "constant" ->
                            bootstrapCode.addAll(List.of("(" + label + ")", "@" + a.getIndex(), "D=A", "@PC_PUSH", "0;JMP"));
                    case "pointer" ->
                            bootstrapCode.addAll(List.of("(" + label + ")", "@" + (3 + a.getIndex()), "D=M", "@PC_PUSH", "0;JMP"));
                    default ->
                            bootstrapCode.addAll(List.of("(" + label + ")", "@" + a.getIndex(), "D=A", "@" + a.getShortSegmentName(), "A=D+M", "D=M", "@PC_PUSH", "0;JMP"));
                }
            }

            for (Address a : popAddresses) {
                String label = "POP_" + a.getSegment() + "_" + a.getIndex();
                switch (a.getSegment()) {
                    case "pointer" ->
                            bootstrapCode.addAll(List.of("(" + label + ")", "@SP", "AM=M-1", "D=M", "@" + (3 + a.getIndex()), "M=D", "@PC_2", "0;JMP"));
                    case "temp" ->
                            bootstrapCode.addAll(List.of("(" + label + ")", "@SP", "AM=M-1", "D=M", "@" + (5 + a.getIndex()), "M=D", "@PC_2", "0;JMP"));
                    default ->
                            bootstrapCode.addAll(List.of("(" + label + ")", "@" + a.getIndex(), "D=A", "@" + a.getShortSegmentName(), "D=D+M", "@14", "M=D", "@SP", "AM=M-1", "D=M", "@14", "A=M", "M=D", "@PC_2", "0;JMP"));
                }
            }
        }
        bootstrapCode.addAll(List.of(
                // === (CALL) subroutine ===
                "(CALL)", "@15", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D",     // Push return address to stack

                "@LCL", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D",  // Push LCL

                "@ARG", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D",  // Push ARG
                "@THIS", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", // Push THIS

                "@THAT", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", // Push THAT

                "@14", "D=M", "@SP", "D=M-D", "@ARG", "M=D",       // ARG = SP - 5 - numArgs (in R14)

                "@SP", "D=M", "@LCL", "M=D",         // LCL = SP

                "@13", "D=M", "@15", "AM=D;JMP",     // Jump to callee (stored in R13)

                // === (RETURN) subroutine ===
                "(RETURN)",                          // Label for the RETURN subroutine
                "@LCL", "D=M", "@14", "M=D", "@5", "A=D-A", "D=M", "@13", "M=D", // store return address
                "@SP", "AM=M-1", "D=M", "@ARG", "A=M", "M=D", // reposition return value
                "@ARG", "D=M", "@SP", "M=D+1", // SP = ARG + 1

                "@14", "A=M-1", "D=M", "@THAT", "M=D", "@14", "A=M-1", "A=A-1", "D=M", "@THIS", "M=D", "@14", "A=M-1", "A=A-1", "A=A-1", "D=M", "@ARG", "M=D", "@14", "A=M-1", "A=A-1", "A=A-1", "A=A-1", "D=M", "@LCL", "M=D", "@13", "D=M", "@10", "D=D+A", "@15", "AM=D;JMP"));

        bootstrapCode.addAll(List.of("(IF_GOTO)", "@13", "M=D", "@SP", "AM=M-1", "D=M", "@IF_GOTO_TRUE", "D;JNE", "@4", "D=A", "@15", "AM=D+M;JMP", "(IF_GOTO_TRUE)", "@13", "D=M", "@15", "AM=D;JMP"));
        bootstrapCode.addAll(List.of("(GT)", "@SP", "AM=M-1", "D=M", "A=A-1", "D=M-D", "@PC_TRUE_GT", "D;JGT", "@SP", "A=M-1", "M=0", "@PC_2", "0;JMP", "(PC_TRUE_GT)", "@SP", "A=M-1", "M=-1", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(LT)", "@SP", "AM=M-1", "D=M", "A=A-1", "D=M-D", "@PC_TRUE_LT", "D;JLT", "@SP", "A=M-1", "M=0", "@PC_2", "0;JMP", "(PC_TRUE_LT)", "@SP", "A=M-1", "M=-1", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(EQ)", "@SP", "AM=M-1", "D=M", "A=A-1", "D=M-D", "@PC_TRUE_EQ", "D;JEQ", "@SP", "A=M-1", "M=0", "@PC_2", "0;JMP", "(PC_TRUE_EQ)", "@SP", "A=M-1", "M=-1", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(ADD)", "@SP", "AM=M-1", "D=M", "A=A-1", "M=D+M", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(SUB)", "@SP", "AM=M-1", "D=M", "A=A-1", "M=M-D", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(AND)", "@SP", "AM=M-1", "D=M", "A=A-1", "M=D&M", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(OR)", "@SP", "AM=M-1", "D=M", "A=A-1", "M=D|M", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(NEG)", "@SP", "A=M-1", "M=-M", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(NOT)", "@SP", "A=M-1", "M=!M", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(PC_PUSH)", "@SP", "AM=M+1", "A=A-1", "M=D", "@PC_2", "0;JMP"));
        bootstrapCode.addAll(List.of("(POP_D)", "@SP", "AM=M-1", "D=M", "@13", "A=M", "M=D"));
        bootstrapCode.addAll(List.of("(PC_2)", "@15", "M=M+1", "AM=M+1;JMP"));
        bootstrapCode.addAll(List.of("(SKIP)", "@4096", "D=A", "@15", "M=D"));
        // Add bootstrap code
        VMParser.currentFunction = "global";
        CallInstruction c = new CallInstruction("Sys.init", 0, new HashMap<>());
        bootstrapCode.addAll(c.decode());
        for (String line : bootstrapCode) {
            if (isRealInstruction(line)) {
                allAssemblyLines.add(line + " // " + machineLine++);
            } else {
                allAssemblyLines.add(line);
            }
        }
        //Group the code
        // Only generate code for reachable functions
        for (String function : reachableFunctions) {
            VMParser.moduleName = function.substring(0, function.indexOf("."));
            functionBodies.put(function, VMParser.group(functionBodies.get(function)));

            List<VMinstruction> instructions = functionBodies.get(function);
            if (instructions == null) continue; // function might not be defined

            for (VMinstruction inst : instructions) {
                String comment = "//" + inst.toString().replaceAll("(?m)^", "//");
                allAssemblyLines.add(comment);

                List<String> assembly = inst.decode();
                if (assembly != null) {
                    for (String line : assembly) {
                        if (isRealInstruction(line)) {
                            allAssemblyLines.add(line + " // " + machineLine++);
                        } else {
                            allAssemblyLines.add(line);
                        }
                    }
                }

                allAssemblyLines.add(""); // blank line
            }
        }
        System.out.println("\nFunction relationships:");
        for (String function : reachableFunctions.stream().sorted().toList()) {
            System.out.println("Function: " + function);

            if (!function.equals("Sys.init")) {
                Set<String> callers = reverseCallGraph.getOrDefault(function, Set.of());
                System.out.println("  Called by: " + (callers.isEmpty() ? "(none)" : String.join(", ", callers)));
            }

            Set<String> callees = callGraph.getOrDefault(function, Set.of());
            System.out.println("  Calls: " + (callees.isEmpty() ? "(none)" : String.join(", ", callees)));
        }

        Files.write(outputFile.toPath(), allAssemblyLines);
    }

    private String getModuleName(File file) {
        String name = file.getName();
        return name.substring(0, name.lastIndexOf('.'));
    }

    private boolean isRealInstruction(String line) {
        line = line.trim();
        return !line.isEmpty() && !line.startsWith("//") && !line.startsWith("(");

    }
}