import java.util.*;

public class Node {
    public enum TokenType {
        KEYWORD,
        SYMBOL,
        IDENTIFIER,
        INTEGER_CONSTANT,
        STRING_CONSTANT
    }

    public enum StructureType {
        CLASS,
        CLASS_VAR_DEC,
        SUBROUTINE_DEC,
        PARAMETER_LIST,
        SUBROUTINE_BODY,
        VAR_DEC,
        STATEMENTS,
        LET_STATEMENT,
        IF_STATEMENT,
        WHILE_STATEMENT,
        DO_STATEMENT,
        RETURN_STATEMENT,
        EXPRESSION,
        TERM,
        EXPRESSION_LIST
        // Add more as needed
    }

    public final TokenType tokenType;
    public final StructureType structureType;
    public final String value;
    public final List<Node> children = new ArrayList<>();

    // Constructor for token nodes (leaves)
    public Node(String value, TokenType tokenType) {
        this.tokenType = tokenType;
        this.structureType = null;
        this.value = value;
    }


    // Constructor for structure nodes (non-leaves)
    public Node(StructureType structureType) {
        this.tokenType = null;
        this.structureType = structureType;
        this.value = null;
    }

    public void addChild(Node child) {
        children.add(child);
    }

    public void addChildren(List<Node> list) {
        children.addAll(list);
    }

    public TokenType getTokenType() {
        return tokenType;
    }

    public StructureType getStructureType() {
        return structureType;
    }

    public String getValue() {
        return value;
    }

    public List<Node> getChildren() {
        return List.copyOf(children);
    }

    public boolean isLeaf() {
        return tokenType != null;
    }

    public boolean isStructure() {
        return structureType != null;
    }

    @Override
    public String toString() {
        return toString(0);
    }

    private String toString(int indent) {
        String pad = "  ".repeat(indent);
        StringBuilder sb = new StringBuilder();
        sb.append(pad);
        if (isLeaf()) {
            sb.append("Leaf(").append(tokenType).append(", ").append(value).append(")\n");
        } else {
            sb.append("Node(").append(structureType).append(")\n");
            for (Node child : children) {
                sb.append(child.toString(indent + 1));
            }
        }
        return sb.toString();
    }
}
