import java.io.*;
import java.util.*;

import VMTranslator.VMTranslator;

public class JackCompiler {
    private final File[] files;

    public JackCompiler(File[] jackFiles) {
        files = jackFiles;
    }

    public void compileFiles() throws Exception {
        File parentDir = null;

        // Step 1: Compile all .jack files to .vm
        for (File input : files) {
            List<String> vmCode = compileFile(input);

            String baseName = input.getName().replaceAll("\\.jack$", "");
            parentDir = input.getParentFile(); // save the last used parent
            File outputFile = new File(parentDir, baseName + ".vm");

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
            } catch (IOException e) {
                System.err.println("Translation failed: " + e.getMessage());
                System.exit(1);
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
