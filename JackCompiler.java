import java.io.*;
import java.util.*;

import VMTranslator.VMTranslator;
import VMTranslator.VMTranslator.*;

public class JackCompiler {
    private final File[] files;

    public JackCompiler(File[] jackFiles) {
        files = jackFiles;
    }

    public void compileFiles() throws Exception {
        for (File input : files) {
            List<String> vmCode = compileFile(input);

            // Replace ".jack" with ".vm" to form the output filename
            String baseName = input.getName().replaceAll("\\.jack$", "");
            File parentDir = input.getParentFile();
            File outputFile = new File(parentDir, baseName + ".vm");

            // Write the VM code to the output file
            try (PrintWriter writer = new PrintWriter(outputFile)) {
                for (String line : vmCode) {
                    writer.println(line);
                }
            }
            // Filter for .vm files
            File[] vmFiles = parentDir.listFiles(new FilenameFilter() {
                public boolean accept(File dir, String name) {
                    return name.endsWith(".vm");
                }
            });
            try {
                // Replace ".vm" with ".hack" to form the output filename
                String baseName1 = input.getName().replaceAll("\\.vm$", "");
                File outputFile1 = new File(parentDir, baseName + ".hack");
                VMTranslator translator = new VMTranslator(vmFiles, outputFile1);
                translator.translate();
                System.out.println("Translation complete: " + outputFile.getAbsolutePath());
            } catch (IOException e) {
                System.err.println("Translation failed: " + e.getMessage());
                System.exit(1);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
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
