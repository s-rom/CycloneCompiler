package cyclonecompiler;

import Parser.*;
import Scanner.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.SymbolFactory;

public class Main {
    
    public static void main (String [] args){
        final String SRC_FILE = ".\\cyclone_src\\prueba_errores_lexicos.cc";
        final String TOKEN_FILE = ".\\tokens\\tokens.txt";
        final String DOT_FILE = ".\\dot\\prueba_errores_lexicos.dot";
        
        try {
            DOT.initWriter(DOT_FILE);
            InfoDump.initAllWriters(TOKEN_FILE);
            
            SymbolFactory sf = new ComplexSymbolFactory();
            Scanner scanner = new Scanner(new FileReader(SRC_FILE));
            Parser parser = new Parser(scanner, sf);
            parser.parse();
            
//            ComplexSymbol cs = (ComplexSymbol)scanner.next_token();
//            while (cs.sym != ParserSym.EOF)
//            {
//                System.out.print(ParserSym.terminalNames[cs.sym]);
//                Object attr = cs.value;
//                if (attr != null && cs.sym == ParserSym.ID) System.out.println(" : "+attr);
//                else System.out.println("");
//                cs = (ComplexSymbol)scanner.next_token();
//            }
            
            InfoDump.closeAllWriters();
            DOT.closeWriter();
        } catch (FileNotFoundException ex) {
            System.err.println("Could not found "+SRC_FILE+"!\n"+ex.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
