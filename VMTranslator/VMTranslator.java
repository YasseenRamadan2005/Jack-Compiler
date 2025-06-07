package VMTranslator;
import VMTranslator.vmcode.*;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

//Basic: 47 lines
public class VMTranslator {
    private final File[] vmFiles;
    private final File outputFile;

    public VMTranslator(File[] vmFiles, File outputFile) {
        this.vmFiles = vmFiles;
        this.outputFile = outputFile;
    }

    public void translate() throws Exception {

        List<String> allAssemblyLines = new ArrayList<>(List.of("//Set 256 to be the start of the stack", "@256", "D=A", "@SP", "M=D",

                "//Set up the comparison ops subroutines", "@SKIP", "0;JMP",

                "// ------------------------------------------------------------", "//  Shared code for gt, lt, eq", "//  Expectations on entry:", "//R13  – return address", "//R15  – (left – right)", "// ------------------------------------------------------------",

                "// want  (left  > right)  ⇔ (R15 > 0)", "(DO_GT)", "@15", "D=M", "@RETURN_TRUE", "D;JGT", "@RETURN_FALSE", "0;JMP",

                "// want  (left == right)  ⇔ (R15 == 0)", "(DO_EQ)", "@15", "D=M", "@RETURN_TRUE", "D;JEQ", "@RETURN_FALSE", "0;JMP",

                "// want  (left  < right)  ⇔ (R15 < 0)", "(DO_LT)", "@15", "D=M", "@RETURN_TRUE", "D;JLT", "@RETURN_FALSE", "0;JMP",

                "// ---- set boolean in D --------------------------------------", "(RETURN_TRUE)", "D=-1", "@WRITE_BACK", "0;JMP",

                "(RETURN_FALSE)", "D=0", "@WRITE_BACK", "0;JMP",

                "// ---- collapse stack and return -----------------------------", "(WRITE_BACK)", "@13", "A=M", "0;JMP",

                "(SKIP)",

                "//Set up calling and returning from functions", "@SKIPo", "0;JMP",

                "(CALL)", "@SP", "AM=M+1", "A=A-1", "M=D", "@LCL", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", "@ARG", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", "@THIS", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", "@THAT", "D=M", "@SP", "AM=M+1", "A=A-1", "M=D", "@14", "D=M", "@SP", "D=M-D", "@ARG", "M=D", "@SP", "D=M", "@LCL", "M=D", "@13", "A=M", "0;JMP",

                "(RETURN)", "@LCL", "D=M", "@14", "M=D", "@5", "A=D-A", "D=M", "@15", "M=D", "@SP", "AM=M-1", "D=M", "@ARG", "A=M", "M=D", "@ARG", "D=M", "@SP", "M=D+1", "@14", "A=M-1", "D=M", "@THAT", "M=D", "@14", "A=M-1", "A=A-1", "D=M", "@THIS", "M=D", "@14", "A=M-1", "A=A-1", "A=A-1", "D=M", "@ARG", "M=D", "@14", "A=M-1", "A=A-1", "A=A-1", "A=A-1", "D=M", "@LCL", "M=D", "@15", "A=M", "0;JMP",

                "(SKIPo)"));
        CallInstruction c = new CallInstruction("Sys.init.0", 0, new HashMap<>(), "global");
        allAssemblyLines.addAll(c.decode());
        // Step 2: Process each VM file
        for (File vmFile : vmFiles) {
            List<String> lines = Files.readAllLines(vmFile.toPath());
            VMParser parser = new VMParser(lines, getModuleName(vmFile));

            List<VMinstruction> instructions = parser.parse();

            for (VMinstruction inst : instructions) {
                List<String> assembly = inst.decode();
                if (assembly != null) allAssemblyLines.addAll(assembly);
                allAssemblyLines.add("\n");
            }

            System.out.println(vmFile.getName() + "  " + instructions.size());
        }

        // Step 3: Write to output file
        Files.write(outputFile.toPath(), allAssemblyLines);
    }

    private String getModuleName(File file) {
        String name = file.getName();
        return name.substring(0, name.lastIndexOf('.'));
    }
}
