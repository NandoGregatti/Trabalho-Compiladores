import java.io.IOException;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.tree.ParseTree;

public class ExemploLexer {
    
    public static void main(String[] args) {
        String filename = "C:\\Users\\ferna\\Desktop\\Trabalho Compiladores\\Trabalho-Compiladores\\ExemploCodigoIII.txt";
        
        try {
            CharStream input = CharStreams.fromFileName(filename);
            JavanesLexer lexer =  new JavanesLexer(input);

            CommonTokenStream tokens = new CommonTokenStream(lexer);

            JavanesParser parser = new JavanesParser(tokens);
            ParseTree ast = parser.programa();

            System.out.println(ast.toStringTree());
            
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}