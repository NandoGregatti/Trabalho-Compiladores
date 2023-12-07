import java.io.IOException;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.CharStreams;

public class ExemploLexer {
    
    public static void main(String[] args) {
        String filename = "C:\\Users\\ferna\\Desktop\\Trabalho Compiladores\\Trabalho-Compiladores\\ExemploCodigoII.txt";
        
        try {
            CharStream input = CharStreams.fromFileName(filename);
            JavanesLexer lexer =  new JavanesLexer(input);
            Token token;
            while (!lexer._hitEOF) {
                token = lexer.nextToken();
                System.out.println("Token: " + token.toString());
                System.out.println("Lexema: " + token.getText());
                System.out.println("Classe: " + lexer.getVocabulary().getDisplayName(token.getType()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
