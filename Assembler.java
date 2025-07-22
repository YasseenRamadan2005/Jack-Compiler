import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public class Assembler {
    private static final Map<String, Integer> SYMBOL_TABLE = new HashMap<>();
    private static final Pattern NUMBER_PATTERN = Pattern.compile("\\d+");
    private static int nextVariableAddress = 16;

    public static void processFile(Path inputFile) throws IOException {
        Path outputFile = inputFile.resolveSibling(inputFile.getFileName().toString().replace(".asm", ".hack"));
        System.out.println("Assembling: " + inputFile);

        List<String> lines = Files.readAllLines(inputFile);
        List<String> cleaned = new ArrayList<>();
        SYMBOL_TABLE.clear();
        initializePredefinedSymbols();

        // First pass: handle labels
        int instructionAddress = 0;
        for (String line : lines) {
            String cleanedLine = cleanLine(line);
            if (cleanedLine.isEmpty()) continue;

            if (cleanedLine.startsWith("(") && cleanedLine.endsWith(")")) {
                String label = cleanedLine.substring(1, cleanedLine.length() - 1);
                SYMBOL_TABLE.put(label, instructionAddress);
            } else {
                cleaned.add(cleanedLine);
                instructionAddress++;
            }
        }

        // Second pass: generate machine code
        List<String> output = new ArrayList<>();
        for (String line : cleaned) {
            if (line.startsWith("@")) {
                output.add(translateAInstruction(line));
            } else {
                output.add(convertCInstruction(line));
            }
        }

        Files.write(outputFile, output);
        System.out.println("Wrote: " + outputFile + "\n");
    }

    private static String translateAInstruction(String line) {
        String symbol = line.substring(1);
        int address;

        if (NUMBER_PATTERN.matcher(symbol).matches()) {
            address = Integer.parseInt(symbol);
        } else {
            if (!SYMBOL_TABLE.containsKey(symbol)) {
                SYMBOL_TABLE.put(symbol, nextVariableAddress++);
            }
            address = SYMBOL_TABLE.get(symbol);
        }

        String binary = Integer.toBinaryString(address);
        return "0".repeat(16 - binary.length()) + binary;
    }

    private static String convertCInstruction(String line) {
        String destBits = "000";
        String compBits;
        String jumpBits = "000";

        String dest = null;
        String comp;
        String jump = null;

        if (line.contains("=")) {
            String[] parts = line.split("=", 2);
            dest = parts[0];
            line = parts[1];
        }

        if (line.contains(";")) {
            String[] parts = line.split(";", 2);
            comp = parts[0];
            jump = parts[1];
        } else {
            comp = line;
        }

        compBits = compTable(comp);
        if (dest != null) destBits = destTable(dest);
        if (jump != null) jumpBits = jumpTable(jump);

        return "111" + compBits + destBits + jumpBits;
    }

    private static String compTable(String comp) {
        return switch (comp) {
            case "0" -> "0101010";
            case "1" -> "0111111";
            case "-1" -> "0111010";
            case "D" -> "0001100";
            case "A" -> "0110000";
            case "M" -> "1110000";
            case "!D" -> "0001101";
            case "!A" -> "0110001";
            case "!M" -> "1110001";
            case "-D" -> "0001111";
            case "-A" -> "0110011";
            case "-M" -> "1110011";
            case "D+1" -> "0011111";
            case "A+1" -> "0110111";
            case "M+1" -> "1110111";
            case "D-1" -> "0001110";
            case "A-1" -> "0110010";
            case "M-1" -> "1110010";
            case "D+A" -> "0000010";
            case "D+M" -> "1000010";
            case "D-A" -> "0010011";
            case "D-M" -> "1010011";
            case "A-D" -> "0000111";
            case "M-D" -> "1000111";
            case "D&A" -> "0000000";
            case "D&M" -> "1000000";
            case "D|A" -> "0010101";
            case "D|M" -> "1010101";
            default -> throw new IllegalArgumentException("Invalid comp: " + comp);
        };
    }

    private static String destTable(String dest) {
        int d = 0;
        if (dest.contains("A")) d |= 0b100;
        if (dest.contains("D")) d |= 0b010;
        if (dest.contains("M")) d |= 0b001;
        return String.format("%3s", Integer.toBinaryString(d)).replace(' ', '0');
    }


    private static String jumpTable(String jump) {
        return switch (jump) {
            case "JGT" -> "001";
            case "JEQ" -> "010";
            case "JGE" -> "011";
            case "JLT" -> "100";
            case "JNE" -> "101";
            case "JLE" -> "110";
            case "JMP" -> "111";
            default -> "000"; // null or empty
        };
    }

    private static String cleanLine(String line) {
        int commentIndex = line.indexOf("//");
        if (commentIndex != -1) {
            line = line.substring(0, commentIndex);
        }
        StringBuilder sb = new StringBuilder();
        for (char c : line.toCharArray()) {
            if (!Character.isWhitespace(c)) {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    private static void initializePredefinedSymbols() {
        SYMBOL_TABLE.put("SP", 0);
        SYMBOL_TABLE.put("LCL", 1);
        SYMBOL_TABLE.put("ARG", 2);
        SYMBOL_TABLE.put("THIS", 3);
        SYMBOL_TABLE.put("THAT", 4);
        for (int i = 0; i <= 15; i++) {
            SYMBOL_TABLE.put("R" + i, i);
        }
        SYMBOL_TABLE.put("SCREEN", 16384);
        SYMBOL_TABLE.put("KBD", 24576);
    }
}
