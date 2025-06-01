import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Lexer {
    File theFile;

    public Lexer(File file) {
        this.theFile = file;
    }

    public List<String> lex() throws IOException {
        // Step 1: Read the file content
        String content = Files.readString(theFile.toPath());

        // Step 2: Remove comments
        String noComments = removeComments(content);

        // Step 3: Tokenize
        return tokenize(noComments);
    }

    private String removeComments(String input) {
        StringBuilder result = new StringBuilder();
        boolean inSingleLine = false;
        boolean inBlock = false;

        for (int i = 0; i < input.length(); i++) {
            if (inSingleLine) {
                if (input.charAt(i) == '\n') {
                    inSingleLine = false;
                    result.append('\n');
                }
                continue;
            }

            if (inBlock) {
                if (input.charAt(i) == '*' && i + 1 < input.length() && input.charAt(i + 1) == '/') {
                    inBlock = false;
                    i++; // skip '/'
                }
                continue;
            }

            if (input.charAt(i) == '/' && i + 1 < input.length()) {
                if (input.charAt(i + 1) == '/') {
                    inSingleLine = true;
                    i++; // skip second '/'
                    continue;
                } else if (input.charAt(i + 1) == '*') {
                    inBlock = true;
                    i++; // skip '*'
                    continue;
                }
            }

            result.append(input.charAt(i));
        }

        return result.toString();
    }

    private List<String> tokenize(String input) {
        List<String> tokens = new ArrayList<>();

        // Regex: strings | words | symbols
        Pattern tokenPattern = Pattern.compile("\"[^\"]*\"|\\w+|[^\\s\\w]");
        Matcher matcher = tokenPattern.matcher(input);

        while (matcher.find()) {
            tokens.add(matcher.group());
        }

        return tokens;
    }
}
