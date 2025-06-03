import java.util.*;

public class Parser {
    List<String> theTokens;

    public Parser(List<String> tokens) {
        this.theTokens = tokens;
    }

    private static class TokenStream {
        private final List<String> tokens;
        private int pos = 0;

        TokenStream(List<String> tokens) {
            this.tokens = tokens;
        }

        String peek() {
            return pos < tokens.size() ? tokens.get(pos) : null;
        }

        String next() {
            return pos < tokens.size() ? tokens.get(pos++) : null;
        }

        boolean match(String expected) {
            if (expected.equals(peek())) {
                pos++;
                return true;
            }
            return false;
        }

        void expect(String expected, Node n, Node.TokenType tt) {
            if (!expected.equals(next())) {
                throw new RuntimeException("Expected '" + expected + "'");
            }
            n.addChild(new Node(expected, tt));
        }

        void expect2(String expected, List<Node> n, Node.TokenType tt) {
            if (!expected.equals(next())) {
                throw new RuntimeException("Expected '" + expected + "'");
            }
            n.add(new Node(expected, tt));
        }
    }

    public Node parse() {
        TokenStream stream = new TokenStream(theTokens);
        return parseClass(stream);
    }

    private Node parseClass(TokenStream tokens) {
        Node node = new Node(Node.StructureType.CLASS);
        tokens.expect("class", node, Node.TokenType.KEYWORD);
        node.addChild(new Node(tokens.next(), Node.TokenType.IDENTIFIER)); // className
        tokens.expect("{", node, Node.TokenType.SYMBOL);

        while (tokens.peek().equals("constant")) {
            node.addChild(parseCosntantDec(tokens));
        }
        while (Set.of("static", "field").contains(tokens.peek())) {
            node.addChild(parseClassVarDec(tokens));
        }

        while (Set.of("constructor", "function", "method").contains(tokens.peek())) {
            node.addChild(parseSubroutineDec(tokens));
        }

        tokens.expect("}", node, Node.TokenType.SYMBOL);
        return node;
    }

    private Node parseClassVarDec(TokenStream tokens) {
        Node node = new Node(Node.StructureType.CLASS_VAR_DEC);
        node.addChild(new Node(tokens.next(), Node.TokenType.KEYWORD));
        node.addChild(parseType(tokens));

        while (true) {
            node.addChild(new Node(tokens.next(), Node.TokenType.IDENTIFIER));
            if (!tokens.match(",")) break;
            node.addChild(new Node(",", Node.TokenType.SYMBOL));
        }

        tokens.expect(";", node, Node.TokenType.SYMBOL);
        return node;
    }

    private Node parseSubroutineDec(TokenStream tokens) {
        Node node = new Node(Node.StructureType.SUBROUTINE_DEC);
        node.addChild(new Node(tokens.next(), Node.TokenType.KEYWORD));
        node.addChild(parseTypeOrVoid(tokens));
        node.addChild(new Node(tokens.next(), Node.TokenType.IDENTIFIER));
        tokens.expect("(", node, Node.TokenType.SYMBOL);
        node.addChild(parseParameterList(tokens));
        tokens.expect(")", node, Node.TokenType.SYMBOL);
        node.addChild(parseSubroutineBody(tokens));
        return node;
    }

    private Node parseParameterList(TokenStream tokens) {
        Node node = new Node(Node.StructureType.PARAMETER_LIST);
        while (!")".equals(tokens.peek())) {
            node.addChild(parseType(tokens));
            node.addChild(new Node(tokens.next(), Node.TokenType.IDENTIFIER));
            if (!tokens.match(",")) break;
            node.addChild(new Node(",", Node.TokenType.SYMBOL));
        }
        return node;
    }

    private Node parseSubroutineBody(TokenStream tokens) {
        Node node = new Node(Node.StructureType.SUBROUTINE_BODY);
        tokens.expect("{", node, Node.TokenType.SYMBOL);
        while ("var".equals(tokens.peek())) {
            node.addChild(parseVarDec(tokens));
        }
        node.addChild(parseStatements(tokens));
        tokens.expect("}", node, Node.TokenType.SYMBOL);
        return node;
    }

    private Node parseCosntantDec(TokenStream tokens) {
        Node node = new Node(Node.StructureType.CONSTANT_DEC);
        tokens.expect("constant", node, Node.TokenType.KEYWORD);
        node.addChild(parseTerm(tokens));
        node.addChild(parseTerm(tokens));
        tokens.expect(";", node, Node.TokenType.SYMBOL);
        return node;
    }

    private Node parseVarDec(TokenStream tokens) {
        Node node = new Node(Node.StructureType.VAR_DEC);
        tokens.expect("var", node, Node.TokenType.KEYWORD);
        node.addChild(parseType(tokens));

        while (true) {
            node.addChild(new Node(tokens.next(), Node.TokenType.IDENTIFIER));
            if (!tokens.match(",")) break;
            node.addChild(new Node(",", Node.TokenType.SYMBOL));
        }

        tokens.expect(";", node, Node.TokenType.SYMBOL);
        return node;
    }

    private Node parseStatements(TokenStream tokens) {
        Node node = new Node(Node.StructureType.STATEMENTS);
        while (Set.of("let", "if", "while", "do", "return").contains(tokens.peek())) {
            switch (Objects.requireNonNull(tokens.peek())) {
                case "let" -> node.addChild(parseLet(tokens));
                case "if" -> node.addChild(parseIf(tokens));
                case "while" -> node.addChild(parseWhile(tokens));
                case "do" -> node.addChild(parseDo(tokens));
                case "return" -> node.addChild(parseReturn(tokens));
            }
        }
        return node;
    }

    private Node parseLet(TokenStream tokens) {
        Node node = new Node(Node.StructureType.LET_STATEMENT);
        tokens.expect("let", node, Node.TokenType.KEYWORD);

        // Variable base
        Node varNode = new Node(tokens.next(), Node.TokenType.IDENTIFIER);
        node.addChild(varNode);

        // Support multiple [expr] indexers
        while (tokens.peek().equals("[")) {
            tokens.expect("[", node, Node.TokenType.SYMBOL);
            node.addChild(parseExpression(tokens));
            tokens.expect("]", node, Node.TokenType.SYMBOL);
        }

        tokens.expect("=", node, Node.TokenType.SYMBOL);
        node.addChild(parseExpression(tokens));
        tokens.expect(";", node, Node.TokenType.SYMBOL);
        return node;
    }


    private Node parseIf(TokenStream tokens) {
        Node node = new Node(Node.StructureType.IF_STATEMENT);
        tokens.expect("if", node, Node.TokenType.KEYWORD);
        tokens.expect("(", node, Node.TokenType.SYMBOL);
        node.addChild(parseExpression(tokens));
        tokens.expect(")", node, Node.TokenType.SYMBOL);
        tokens.expect("{", node, Node.TokenType.SYMBOL);
        node.addChild(parseStatements(tokens));
        tokens.expect("}", node, Node.TokenType.SYMBOL);
        if (tokens.match("else")) {
            node.addChild(new Node("else", Node.TokenType.KEYWORD));
            tokens.expect("{", node, Node.TokenType.SYMBOL);
            node.addChild(parseStatements(tokens));
            tokens.expect("}", node, Node.TokenType.SYMBOL);
        }
        return node;
    }

    private Node parseWhile(TokenStream tokens) {
        Node node = new Node(Node.StructureType.WHILE_STATEMENT);
        tokens.expect("while", node, Node.TokenType.KEYWORD);
        tokens.expect("(", node, Node.TokenType.SYMBOL);
        node.addChild(parseExpression(tokens));
        tokens.expect(")", node, Node.TokenType.SYMBOL);
        tokens.expect("{", node, Node.TokenType.SYMBOL);
        node.addChild(parseStatements(tokens));
        tokens.expect("}", node, Node.TokenType.SYMBOL);
        return node;
    }

    private Node parseDo(TokenStream tokens) {
        Node node = new Node(Node.StructureType.DO_STATEMENT);
        tokens.expect("do", node, Node.TokenType.KEYWORD);
        node.addChildren(parseSubroutineCall(tokens));
        tokens.expect(";", node, Node.TokenType.SYMBOL);
        return node;
    }

    private Node parseReturn(TokenStream tokens) {
        Node node = new Node(Node.StructureType.RETURN_STATEMENT);
        tokens.expect("return", node, Node.TokenType.KEYWORD);
        if (!";".equals(tokens.peek())) {
            node.addChild(parseExpression(tokens));
        }
        tokens.expect(";", node, Node.TokenType.SYMBOL);
        return node;
    }

    private Node parseExpression(TokenStream tokens) {
        Node node = new Node(Node.StructureType.EXPRESSION);
        node.addChild(parseTerm(tokens));
        while (Set.of("+", "-", "*", "/", "&", "|", "<", ">", "=", "<=", ">=", "~=").contains(tokens.peek())) {
            node.addChild(new Node(tokens.next(), Node.TokenType.SYMBOL));
            node.addChild(parseTerm(tokens));
        }
        return node;
    }

    private Node parseTerm(TokenStream tokens) {
        Node node = new Node(Node.StructureType.TERM);
        String token = tokens.peek();
        assert token != null;
        if (token.matches("\\d+")) {
            node.addChild(new Node(tokens.next(), Node.TokenType.INTEGER_CONSTANT));
        } else if (token.startsWith("\"")) {
            node.addChild(new Node(Objects.requireNonNull(tokens.next()).replace("\"", ""), Node.TokenType.STRING_CONSTANT));
        } else if (Set.of("true", "false", "null", "this").contains(token)) {
            node.addChild(new Node(tokens.next(), Node.TokenType.KEYWORD));
        } else if (token.equals("(")) {
            tokens.expect("(", node, Node.TokenType.SYMBOL);
            node.addChild(parseExpression(tokens));
            tokens.expect(")", node, Node.TokenType.SYMBOL);
        } else if (Set.of("-", "~").contains(token)) {
            node.addChild(new Node(tokens.next(), Node.TokenType.SYMBOL));
            node.addChild(parseTerm(tokens));
        } else if ("[".equals(tokens.tokens.get(tokens.pos + 1))) {
            node.addChild(new Node(tokens.next(), Node.TokenType.IDENTIFIER));
            tokens.expect("[", node, Node.TokenType.SYMBOL);
            node.addChild(parseExpression(tokens));
            tokens.expect("]", node, Node.TokenType.SYMBOL);
        } else if (Set.of("(", ".").contains(tokens.tokens.get(tokens.pos + 1))) {
            node.addChildren(parseSubroutineCall(tokens));
        } else {
            node.addChild(new Node(tokens.next(), Node.TokenType.IDENTIFIER));
        }
        return node;
    }

    private Node parseType(TokenStream tokens) {
        String token = tokens.next();
        return new Node(token, Set.of("int", "char", "boolean").contains(token) ? Node.TokenType.KEYWORD : Node.TokenType.IDENTIFIER);
    }

    private Node parseTypeOrVoid(TokenStream tokens) {
        String token = tokens.next();
        assert token != null;
        return new Node(token, token.equals("void") || Set.of("int", "char", "boolean").contains(token) ? Node.TokenType.KEYWORD : Node.TokenType.IDENTIFIER);
    }

    private List<Node> parseSubroutineCall(TokenStream tokens) {
        List<Node> nodes = new ArrayList<>();
        nodes.add(new Node(tokens.next(), Node.TokenType.IDENTIFIER));
        if (tokens.match(".")) {
            nodes.add(new Node(".", Node.TokenType.SYMBOL));
            nodes.add(new Node(tokens.next(), Node.TokenType.IDENTIFIER));
        }
        tokens.expect2("(", nodes, Node.TokenType.SYMBOL);
        nodes.add(parseExpressionList(tokens));
        tokens.expect2(")", nodes, Node.TokenType.SYMBOL);
        return nodes;
    }

    private Node parseExpressionList(TokenStream tokens) {
        Node node = new Node(Node.StructureType.EXPRESSION_LIST);
        if (!")".equals(tokens.peek())) {
            node.addChild(parseExpression(tokens));
            while (tokens.match(",")) {
                node.addChild(new Node(",", Node.TokenType.SYMBOL));
                node.addChild(parseExpression(tokens));
            }
        }
        return node;
    }
}
