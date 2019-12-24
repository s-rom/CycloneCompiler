package cyclonecompiler;

import Parser.*;
import Scanner.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.ComplexSymbol;
import java_cup.runtime.SymbolFactory;

public class Main {
    
    public static void main (String [] args){
        final String FILE_NAME = ".\\cyclone_src\\prueba_errores_lexicos.cc";
//        final String FILE_NAME = ".\\cyclone_src\\program.cc";
        
        try {
            DOT.initWriter(".\\dot\\prueba_errores_lexicos.dot");
            
            SymbolFactory sf = new ComplexSymbolFactory();
            Scanner scanner = new Scanner(new FileReader(FILE_NAME));
//            Parser parser = new Parser(scanner, sf);
//            parser.parse();
            
            
            ComplexSymbol cs = (ComplexSymbol)scanner.next_token();
            while (cs.sym != ParserSym.EOF)
            {
                System.out.print(ParserSym.terminalNames[cs.sym]);
                Object attr = cs.value;
                if (attr != null && cs.sym == ParserSym.ID) System.out.println(" : "+attr);
                else System.out.println("");
                cs = (ComplexSymbol)scanner.next_token();
            }
            
            DOT.closeWriter();
        } catch (FileNotFoundException ex) {
            System.err.println("Could not found "+FILE_NAME+"!\n"+ex.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
