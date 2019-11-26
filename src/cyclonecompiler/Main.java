package cyclonecompiler;

import Parser.*;
import Scanner.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {
    
    @SuppressWarnings("empty-statement")
    public static void main (String [] args){
        final String FILE_NAME = "C:\\Users\\Sergi\\Desktop\\PracticaCompiladores\\CycloneCompiler\\cyclone_src\\program.cc";
        try {
            
            FileReader in = new FileReader(FILE_NAME);
            Scanner s = new Scanner(in);
            while(s.next_token().sym != ParserSym.EOF);
            
        } catch (FileNotFoundException e) {
                System.err.println("Could not open '"+FILE_NAME+"'");
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } 

    }
    
}
