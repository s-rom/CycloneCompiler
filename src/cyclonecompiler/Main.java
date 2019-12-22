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
        final String FILE_NAME = ".\\cyclone_src\\prueba_ast.cc";
        
        try {
            
            DOT.initWriter(".\\dot\\prueba.dot");
            
            SymbolFactory sf = new ComplexSymbolFactory();
            Scanner scanner = new Scanner(new FileReader(FILE_NAME));
            Parser parser = new Parser(scanner, sf);
            parser.parse();
            
            DOT.closeWriter();
        } catch (FileNotFoundException ex) {
            System.err.println("Could not found "+FILE_NAME+"!\n"+ex.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
