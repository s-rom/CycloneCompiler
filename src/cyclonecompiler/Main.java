package cyclonecompiler;

import Parser.*;
import Scanner.*;
import SymbolTable.AtomicType;
import SymbolTable.AtomicType.Atomic;
import SymbolTable.ConstDescription;
import SymbolTable.Description;
import SymbolTable.SymbolTable;
import SymbolTable.TypeDescription;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.SymbolFactory;

public class Main {
    
    public static SymbolTable ts;
    public static AtomicType atomicBool;
    public static AtomicType atomicChar;
    public static AtomicType atomicInt32;
    public static AtomicType atomicInt16;
    public static AtomicType atomicNull;
    public static AtomicType atomicInt;
    
    
    public static void main (String [] args){
        final String SRC_FILE = ".\\cyclone_src\\test_expresiones.cc";
        final String TOKEN_FILE = ".\\InfoFiles\\tokens.txt";
        final String SYMBOL_TABLE_FILE = ".\\InfoFiles\\symbol_table.txt";
        final String ERROR_FILE = ".\\InfoFiles\\error_log.txt";

        final String DOT_FILE = ".\\InfoFiles\\test_expresiones.dot";
        
        
        try {
            DOT.initWriter(DOT_FILE);
            InfoDump.initAllWriters(TOKEN_FILE, SYMBOL_TABLE_FILE, ERROR_FILE);
            initSymbolTable();

            SymbolFactory sf = new ComplexSymbolFactory();
            Scanner scanner = new Scanner(new FileReader(SRC_FILE));
            Parser parser = new Parser(scanner, sf);
            parser.parse();
            InfoDump.closeAllWriters();
            DOT.closeWriter();
//            System.out.println("Parsing successfull.");
        } catch (FileNotFoundException ex) {
            System.err.println("Could not found "+SRC_FILE+"!\n"+ex.getMessage());
        }catch(FatalError f){
            System.err.println("A fatal error ocurred, compilation halted.");
        }catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
 
    
    public static void initSymbolTable(){
        ts = new SymbolTable();
        atomicBool = new AtomicType(Atomic.TS_BOOL, 0, 255, 1);
        atomicChar = new AtomicType(Atomic.TS_CHAR, 0, 255, 1);
        atomicInt32 = new AtomicType(Atomic.TS_INT, -2147483648, +2147483647, 4);
        atomicInt16 = new AtomicType(Atomic.TS_INT, -65536, +65535, 2);
        atomicNull = new AtomicType(Atomic.TS_NULL, 0, 0, 1);
        atomicInt = atomicInt32; //alias de int32 bits
        
        
        Description dInt = new TypeDescription("int",atomicInt32); 
        Description dBool = new TypeDescription("bool",atomicBool);
        Description dTrue = new ConstDescription("false","bool",0); 
        Description dFalse = new ConstDescription("true","bool",1);
        Description dIntMax = new ConstDescription("INT32_MAX","int",2147483647);
        Description dIntMin = new ConstDescription("INT32_MIN","int",-2147483648);
        Description dChar = new TypeDescription("string",atomicChar);
        
        ts.insert("string",dChar);
        ts.insert("int", dInt);
        ts.insert("bool", dBool);
        ts.insert("true", dTrue);
        ts.insert("false", dFalse);
        ts.insert("INT32_MAX",dIntMax);
        ts.insert("INT32_MIN",dIntMin);
    }
    
}
