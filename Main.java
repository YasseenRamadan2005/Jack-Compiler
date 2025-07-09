import java.io.File;
import java.util.Arrays;
import java.io.IOException;

public class Main {
    public static boolean makeXML = false;

    public static void main(String[] args) throws IOException {
        if (args.length < 1 || args.length > 4) {
            System.err.println("Usage: java Main <directory> [--vm] [-x] [-v]");
            System.exit(1);
        }

        File inputDir = new File(args[0]);
        if (!(inputDir.exists() && inputDir.isDirectory())) {
            System.err.println("Error: Provided path is not a directory.");
            System.exit(1);
        }

        boolean isVmOnly = Arrays.asList(args).contains("--vm");
        makeXML = Arrays.asList(args).contains("-x");
        boolean keepVmFiles = Arrays.asList(args).contains("-v");

        File[] jackFiles = inputDir.listFiles((dir, name) -> name.endsWith(".jack"));
        File[] vmFiles = inputDir.listFiles((dir, name) -> name.endsWith(".vm"));

        if (isVmOnly) {
            if (vmFiles == null || vmFiles.length == 0) {
                System.err.println("Error: No .vm files found in directory.");
                System.exit(1);
            }
            try {
                JackCompiler compiler = new JackCompiler(vmFiles, true); // force keepVmFiles = true
                compiler.translateOnlyVmFiles(); // new method
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            return;
        }

        if (jackFiles == null || jackFiles.length == 0) {
            System.err.println("Error: No .jack files found in directory.");
            System.exit(1);
        }

        boolean hasMainJack = Arrays.stream(jackFiles).anyMatch(file -> file.getName().equals("Main.jack"));
        if (!hasMainJack) {
            System.err.println("Error: Directory must contain a Main.jack file.");
            System.exit(1);
        }

        try {
            JackCompiler compiler = new JackCompiler(jackFiles, keepVmFiles);
            compiler.compileFiles();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
