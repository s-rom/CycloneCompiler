package cyclonecompiler;

import AssemblyGeneration.AsmGenerator;
import AssemblyGeneration.M68kGenerator;
import IntermediateCode.Function;
import IntermediateCode.Generator;
import IntermediateCode.Opcode;
import Parser.*;
import Scanner.*;
import SymbolTable.AtomicType;
import SymbolTable.AtomicType.Atomic;
import SymbolTable.ConstDescription;
import SymbolTable.Description;
import SymbolTable.FuncDescription;
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
    public static Generator gen;
    public static AsmGenerator asmGen;
    
    public static AtomicType atomicBool;
    public static AtomicType atomicChar;
    public static AtomicType atomicInt32;
    public static AtomicType atomicInt16;
    public static AtomicType atomicNull;
    public static AtomicType atomicInt;
    
    
    
    public static void main (String [] args){
        final String NAME = "comp2";
        compilar(NAME);

    }
 
    public static void compilar(String NAME){
        
        final String SRC_FILE = ".\\cyclone_src\\"+NAME+".cc";
        final String TOKEN_FILE = ".\\InfoFiles\\tokens_"+NAME+".txt";
        final String SYMBOL_TABLE_FILE = ".\\InfoFiles\\symbol_table_"+NAME+".txt";
        final String ERROR_FILE = ".\\InfoFiles\\error_log_"+NAME+".txt";
        final String INTERMEDIATE_FILE = ".\\generated\\"+NAME+".ic";
        final String DOT_FILE = ".\\InfoFiles\\"+NAME+".dot";
        final String IC_VAR = ".\\InfoFiles\\"+NAME+"_IC_Var.txt";
        final String IC_FUNC = ".\\InfoFiles\\"+NAME+"_IC_Func.txt";
        final String ASM_MAIN = ".\\generated\\"+NAME.toUpperCase()+"_MAIN.X68";

        
        try {
            gen = new Generator(INTERMEDIATE_FILE);
            asmGen = new M68kGenerator(ASM_MAIN);
            DOT.initWriter(DOT_FILE);
            InfoDump.initAllWriters
                (TOKEN_FILE, SYMBOL_TABLE_FILE, ERROR_FILE, IC_VAR, IC_FUNC);
            initSymbolTable();

            SymbolFactory sf = new ComplexSymbolFactory();
            Scanner scanner = new Scanner(new FileReader(SRC_FILE));
            Parser parser = new Parser(scanner, sf);
            parser.parse();
            
            
            gen.getFunctionTable().forEach((entry) -> {
                asmGen.generateFunction(entry.getValue());
            });
            asmGen.generateMain();
            
            System.out.println(Main.ts.toString());
        } catch (FileNotFoundException ex) {
            System.err.println("Could not found "+SRC_FILE+"!\n"+ex.getMessage());
        } catch(FatalError f){
            System.err.println("A fatal error ocurred, compilation halted.");
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            gen.infoDumpAllFunctions();
            gen.close();
            asmGen.close();
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
        Description dFalse = new ConstDescription("true","bool",-1);
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
