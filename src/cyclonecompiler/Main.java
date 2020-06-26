package cyclonecompiler;

import AssemblyGeneration.AsmGenerator;
import AssemblyGeneration.M68kGenerator;
import IntermediateCode.Function;
import IntermediateCode.Generator;
import Parser.*;
import Scanner.*;
import SymbolTable.AtomicType;
import SymbolTable.AtomicType.Atomic;
import SymbolTable.ConstDescription;
import SymbolTable.Description;
import SymbolTable.SymbolTable;
import SymbolTable.TypeDescription;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Map.Entry;
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
        gen();
        if (args.length == 0){
            compileFromIDE("movement");
            return;
        }
        
        String fileName = args[0];
        File f = new File(fileName);
        int idxOfExtension = f.getName().indexOf(".cc");
        if (idxOfExtension == -1) {
            System.err.println(f.getPath()+" is not a Cyclone file. All cyclone files must end with .cc");
            return;
        } 
        
        fileName = f.getName().substring(0, idxOfExtension);
        String currentPath = System.getProperty("user.dir");
        File infoPath = new File(currentPath+"\\info\\");
        infoPath.mkdir();
        
        compileFromCmd(fileName, f.getAbsolutePath(), currentPath, infoPath.getAbsolutePath());
    }
    
    
    public static void gen(){
       
        
        for (int i = 0; i < 30; i++)
        { 
            int side = (int) (Math.random() * 4) + 2;
            int x = (int) (Math.random() * 600);
            int y = (int) (Math.random() * 600);
            System.out.println("M68K_draw_rect("+x+","+y+","+side+","+side+");");

        }
    }
    
    public static void compileFromCmd
        (String fileName, String absoluteSrc, String rootPath, String infoPath){
        
        final String SRC_FILE = absoluteSrc;
        final String TOKEN_FILE = infoPath+"\\tokens_"+fileName+".txt";
        final String SYMBOL_TABLE_FILE = infoPath + "\\symbol_table_"+fileName+".txt";
        final String ERROR_FILE = infoPath+"\\error_log_"+fileName+".txt";
        final String DOT_FILE = infoPath+"\\"+fileName+".dot";
        final String IC_VAR = infoPath+"\\"+fileName+"_IC_Var.txt";
        final String IC_FUNC = infoPath+"\\"+fileName+"_IC_Func.txt";
       
        final String ASM_MAIN = rootPath + "\\"+fileName.toUpperCase()+"_MAIN.X68";
        final String INTERMEDIATE_FILE = rootPath + "\\"+fileName+".ic";

        compile(SRC_FILE, INTERMEDIATE_FILE, ASM_MAIN, TOKEN_FILE, SYMBOL_TABLE_FILE,
                ERROR_FILE, DOT_FILE, IC_VAR, IC_FUNC);
    }
        
        
    public static void compileFromIDE(String name){
        final String SRC_FILE = ".\\cyclone_src\\"+name+".cc";
        final String INTERMEDIATE_FILE = ".\\generated\\"+name+".ic";

        final String TOKEN_FILE = ".\\InfoFiles\\tokens_"+name+".txt";
        final String SYMBOL_TABLE_FILE = ".\\InfoFiles\\symbol_table_"+name+".txt";
        final String ERROR_FILE = ".\\InfoFiles\\error_log_"+name+".txt";
        final String DOT_FILE = ".\\InfoFiles\\"+name+".dot";
        final String IC_VAR = ".\\InfoFiles\\"+name+"_IC_Var.txt";
        final String IC_FUNC = ".\\InfoFiles\\"+name+"_IC_Func.txt";
        final String ASM_MAIN = ".\\generated\\"+name.toUpperCase()+"_MAIN.X68";
        compile(SRC_FILE, INTERMEDIATE_FILE, ASM_MAIN, TOKEN_FILE, SYMBOL_TABLE_FILE,
                ERROR_FILE, DOT_FILE, IC_VAR, IC_FUNC);
    }
 
    public static void compile(
            String src_file, 
            String intermediate_file, 
            String asm_file,
            String token_file, 
            String symbol_table_file, 
            String error_file,
            String dot_file,
            String ic_var,
            String ic_func){
        
      
        System.out.println("Compiling file: "+src_file);
        try {
            gen = new Generator(intermediate_file);
            asmGen = new M68kGenerator(asm_file);
            DOT.initWriter(dot_file);
            InfoDump.initAllWriters
                (token_file, symbol_table_file, error_file, ic_var, ic_func);
            initSymbolTable();

            SymbolFactory sf = new ComplexSymbolFactory();
            Scanner scanner = new Scanner(new FileReader(src_file));
            Parser parser = new Parser(scanner, sf);
            parser.parse();
            
            
            Description cycloneFunc = Main.ts.getForward("cyclone");
            if (cycloneFunc == null) InfoDump.reportSemanticError("cyclone function not found!");
            
            final int TOTAL = gen.getFunctionTable().size();
            String tabs;
            int generated = 0;
            int percentage = 0;
            
            long elapsed;
            
            for (Entry<Integer,Function> entry : gen.getFunctionTable()){
                elapsed = System.nanoTime();
                asmGen.generateFunction(entry.getValue());
                elapsed = System.nanoTime() - elapsed;
                
                generated++;
                
                tabs = "";
                percentage = (int) ((float) generated / (float) TOTAL * 100);
                String fName = "--> Generated: "+entry.getValue().toString();
                for (int i = 0; i < 50 - fName.length(); i++) tabs += ' ';
                System.out.println(fName+tabs+" elapsed: "+elapsed/1000000+" ms ... "+
                        percentage+"%");
            }
            
            System.out.println("\nCompilation successful");
            
            asmGen.generateMain();
            
        } catch (FileNotFoundException ex) {
            System.err.println("Could not found "+src_file+"!\n"+ex.getMessage());
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
