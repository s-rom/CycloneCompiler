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
    
    /*
        ##__TESTS__##
         => Expresions: 
            test_1_bien
            test_1_mal
            test_2_bien
            test_2_mal
            test_3_bien
            test_3_mal
    */
    
    public static void main (String [] args){
        final String NAME = "test_1_bien";
        
        final String SRC_FILE = ".\\cyclone_src\\"+NAME+".cc";
        final String TOKEN_FILE = ".\\InfoFiles\\tokens_"+NAME+".txt";
        final String SYMBOL_TABLE_FILE = ".\\InfoFiles\\symbol_table_"+NAME+".txt";
        final String ERROR_FILE = ".\\InfoFiles\\error_log_"+NAME+".txt";

        final String DOT_FILE = ".\\InfoFiles\\"+NAME+".dot";
        
        try {
            
            DOT.initWriter(DOT_FILE);
            InfoDump.initAllWriters(TOKEN_FILE, SYMBOL_TABLE_FILE, ERROR_FILE);
            initSymbolTable();

            SymbolFactory sf = new ComplexSymbolFactory();
            Scanner scanner = new Scanner(new FileReader(SRC_FILE));
            Parser parser = new Parser(scanner, sf);
            parser.parse();
           
        } catch (FileNotFoundException ex) {
            System.err.println("Could not found "+SRC_FILE+"!\n"+ex.getMessage());
        }catch(FatalError f){
            System.err.println("A fatal error ocurred, compilation halted.");
        }catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            InfoDump.closeAllWriters();
            DOT.closeWriter();
        }
    }
 
    
    public static void initSymbolTable(){
        ts = new SymbolTable();
        InfoDump.addTableSymbolText("------------------------\n");
        InfoDump.addTableSymbolText("| LEVEL 0\n");

        atomicBool = new AtomicType(Atomic.TS_BOOL, 0, 255, 1);
        atomicChar = new AtomicType(Atomic.TS_CHAR, 0, 255, 1);
        atomicInt32 = new AtomicType(Atomic.TS_INT, -2147483648, +2147483647, 4);
        atomicInt16 = new AtomicType(Atomic.TS_INT, -65536, +65535, 2);
        atomicNull = new AtomicType(Atomic.TS_NULL, 0, 0, 0);
        atomicInt = atomicInt32; //alias de int32 bits
        
        
        Description dInt = new TypeDescription("int",atomicInt32); 
        Description dBool = new TypeDescription("bool",atomicBool);
        Description dTrue = new ConstDescription("false","bool",0); 
        Description dFalse = new ConstDescription("true","bool",1);
        Description dIntMax = new ConstDescription("INT32_MAX","int",2147483647);
        Description dIntMin = new ConstDescription("INT32_MIN","int",-2147483648);
        Description dChar = new TypeDescription("string",atomicChar);
        Description dVoid = new TypeDescription("void",atomicNull);

        
        try{
            ts.insert("void",dVoid);
            ts.insert("string",dChar);
            ts.insert("int", dInt);
            ts.insert("bool", dBool);
            ts.insert("true", dTrue);
            ts.insert("false", dFalse);
            ts.insert("INT32_MAX",dIntMax);
            ts.insert("INT32_MIN",dIntMin);
        }catch(FatalError e){
        }
    }
}
