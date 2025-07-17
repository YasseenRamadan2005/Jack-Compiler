import java.io.*;
import java.util.*;

import VMTranslator.VMTranslator;

public class JackCompiler {
    private final File[] files;
    private final boolean keepVmFiles;

    public JackCompiler(File[] jackFiles, boolean keepVmFiles) {
        files = jackFiles;
        this.keepVmFiles = keepVmFiles;
    }

    public void compileFiles() throws Exception {
        File parentDir = null;
        List<File> generatedVmFiles = new ArrayList<>();
        // Step 1: Compile all .jack files to .vm
        for (File input : files) {
            List<String> vmCode = compileFile(input);

            String baseName = input.getName().replaceAll("\\.jack$", "");
            parentDir = input.getParentFile(); // save the last used parent
            File outputFile = new File(parentDir, baseName + ".vm");
            generatedVmFiles.add(outputFile);
            try (PrintWriter writer = new PrintWriter(outputFile)) {
                for (String line : vmCode) {
                    writer.println(line);
                }
            }
        }

        // Step 2: Collect all .vm files in that directory
        if (parentDir != null) {
            File[] vmFiles = parentDir.listFiles((dir, name) -> name.endsWith(".vm"));
            if (vmFiles == null || vmFiles.length == 0) {
                throw new IOException("No .vm files found in directory: " + parentDir);
            }

            // Step 3: Translate .vm to .asm
            String outputName = parentDir.getName() + ".asm"; // directory-based output
            File outputFile = new File(parentDir, outputName);

            try {
                VMTranslator translator = new VMTranslator(vmFiles, outputFile);
                translator.translate();
                System.out.println("Translation complete: " + outputFile.getAbsolutePath());
                System.out.println("Number of asm lines:" + translator.machineLine);
                //printStaticVariables(outputFile);
            } catch (IOException e) {
                System.err.println("Translation failed: " + e.getMessage());
                System.exit(1);
            }
            if (!keepVmFiles) {
                for (File vm : generatedVmFiles) {
                    if (!vm.delete()) {
                        System.err.println("Warning: Could not delete " + vm.getName());
                    }
                }
            }
        } else {
            throw new IllegalStateException("No parent directory found.");
        }
    }

    public List<String> compileFile(File file) throws Exception {
        Lexer the_lexer = new Lexer(file);
        Parser the_parser = new Parser(the_lexer.lex());
        Node root = the_parser.parse();
        CodeGenerator the_codeGenerator = new CodeGenerator(root);
        if (Main.makeXML) {
            writeXML(root, file);
        }
        return the_codeGenerator.generateCode();
    }


    public void translateOnlyVmFiles() throws IOException {
        File parentDir = null;
        if (files.length > 0) {
            parentDir = files[0].getParentFile();
        }

        if (parentDir == null) {
            throw new IllegalStateException("No parent directory found.");
        }

        File outputFile = new File(parentDir, parentDir.getName() + ".asm");

        try {
            VMTranslator translator = new VMTranslator(files, outputFile);
            translator.translate();
            System.out.println("Translation complete: " + outputFile.getAbsolutePath());
        } catch (Exception e) {
            System.err.println("Translation failed: " + e.getMessage());
            System.exit(1);
        }
    }


    private void writeXML(Node root, File input) throws IOException {
        String filename = input.getName().replace(".jack", ".xml");
        File output = new File(input.getParentFile(), filename);

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(output))) {
            writeNodeAsXML(writer, root, 0);
        }
    }

    private void writeNodeAsXML(BufferedWriter writer, Node node, int level) throws IOException {
        String indent = "  ".repeat(level);
        if (node.isLeaf()) {
            String tag = node.getTokenType().toString();
            String value = escapeXML(node.getValue());
            writer.write(indent + "<" + tag + "> " + value + " </" + tag + ">\n");
        } else {
            String tag = node.getStructureType().toString();
            writer.write(indent + "<" + tag + ">\n");
            for (Node child : node.getChildren()) {
                writeNodeAsXML(writer, child, level + 1);
            }
            writer.write(indent + "</" + tag + ">\n");
        }
    }

    private String escapeXML(String text) {
        return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    }

}
