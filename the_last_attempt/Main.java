import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.Arrays;

public class Main {

    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.err.println("Usage: java Main <directory>");
            System.exit(1);
        }

        File inputDir = new File(args[0]);
        if (!(inputDir.exists() && inputDir.isDirectory())) {
            System.err.println("Error: Provided path is not a directory.");
            System.exit(1);
        }

        // Filter for .vm files
        File[] vmFiles = inputDir.listFiles(new FilenameFilter() {
            public boolean accept(File dir, String name) {
                return name.endsWith(".vm");
            }
        });

        if (vmFiles == null || vmFiles.length == 0) {
            System.err.println("Error: No .vm files found in directory.");
            System.exit(1);
        }

        boolean hasMainVM = Arrays.stream(vmFiles).anyMatch(file -> file.getName().equals("Main.vm"));

        if (!hasMainVM) {
            System.err.println("Error: Directory must contain a Main.vm file.");
            System.exit(1);
        }

        String dirName = inputDir.getCanonicalFile().getName();
        String outputFilename = dirName + ".asm";
        File canonicalDir = inputDir.getCanonicalFile();
        File outputFile = new File(canonicalDir, outputFilename);

        try {
            VMTranslator translator = new VMTranslator(vmFiles, outputFile);
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
