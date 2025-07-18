package VMTranslator;

import VMTranslator.vmcode.CallInstruction;
import VMTranslator.vmcode.FunctionInstruction;
import VMTranslator.vmcode.VMParser;
import VMTranslator.vmcode.VMinstruction;

import java.io.File;
import java.nio.file.Files;
import java.util.*;

//Basic: 47 lines
public class VMTranslator {
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