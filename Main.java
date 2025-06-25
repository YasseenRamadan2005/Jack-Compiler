import java.io.File;
import java.util.Arrays;

import java.io.IOException;
public class Main {
    public static boolean makeXML = false;

    public static void main(String[] args) throws IOException {
        if (args.length < 1 || args.length > 3) {
            System.err.println("Usage: java Main <directory> [-x] [-v]");
            System.exit(1);
        }

        File inputDir = new File(args[0]);
        if (!(inputDir.exists() && inputDir.isDirectory())) {
            System.err.println("Error: Provided path is not a directory.");
            System.exit(1);
        }

        //Flags
        if (args.length == 2 && args[1].equals("-x")) {
            makeXML = true;
        }
        boolean keepVmFiles = Arrays.asList(args).contains("-v");

        File[] vmFiles = inputDir.listFiles((dir, name) -> name.endsWith(".jack"));

        if (vmFiles == null || vmFiles.length == 0) {
            System.err.println("Error: No .jack files found in directory.");
            System.exit(1);
        }

        boolean hasMainVM = Arrays.stream(vmFiles).anyMatch(file -> file.getName().equals("Main.jack"));
        if (!hasMainVM) {
            System.err.println("Error: Directory must contain a Main.jack file.");
            System.exit(1);
        }

        try {
            JackCompiler compiler = new JackCompiler(vmFiles, keepVmFiles);
            compiler.compileFiles();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
