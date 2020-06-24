package cyclonecompiler;

import SymbolTable.Description;
import static cyclonecompiler.DOT.setNodeStyle;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InfoDump {

    public static enum ErrorType {
        SEMANTIC, LEXIC, SYNTACTIC
    }
    
    public static BufferedWriter br; 

    private static boolean anySyntaxError = false, 
                           anySemanticError = false,
                           anyLexicError = false;
    
    private static BufferedWriter tokenWriter;
    private static BufferedWriter tsWriter;
    private static BufferedWriter errorWriter;
    private static BufferedWriter icVarWriter;
    private static BufferedWriter icFuncWriter;

    public boolean IsAnySyntaxError(){
        return anySyntaxError;
    }
    
    public boolean IsAnyLexicError(){
        return anyLexicError;
    }
   
    public boolean IsAnySemanticError(){
        return anySemanticError;
    }
   
    
    public static void initAllWriters(String token_path, String ts_path,
            String error_path, String ic_var_path, String ic_func_path){
        try {
            FileWriter fwriterToken = new FileWriter(new File(token_path));            
            FileWriter fwriterTS = new FileWriter(new File(ts_path));            
            FileWriter fwriterError = new FileWriter(new File(error_path));            
            FileWriter fwriterIcVar = new FileWriter(new File(ic_var_path));            
            FileWriter fwriterIcFunc = new FileWriter(new File(ic_func_path));            

            
            
            errorWriter = new BufferedWriter(fwriterError);
            tokenWriter = new BufferedWriter(fwriterToken);
            tsWriter = new BufferedWriter(fwriterTS);
            icVarWriter = new BufferedWriter(fwriterIcVar);
            icFuncWriter = new BufferedWriter(fwriterIcFunc);
            
            
            errorWriter.write("### ---------- Compilation Errors ----------");
            errorWriter.newLine();
            
            tsWriter.write("### ---------- Symbol Table ----------");
            tsWriter.newLine();
            
            tokenWriter.write("### ---------- Token File ----------");
            tokenWriter.newLine();
            tokenWriter.write("### Format: (line,colum) TokenName: Attribute?");
            tokenWriter.newLine();            
            tokenWriter.newLine();
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
        setNodeStyle("box");
    }
    
    public static void addIcFileText(String text){
        try{
            icVarWriter.write(text);
        }catch(IOException ex){
            System.err.println("Error writing to IC var file: "+ex.getMessage());
        }
    }
    
    public static void addIcVar(IntermediateCode.Variable v){
        try{
            icVarWriter.write(v.toStringDetailed());
            icVarWriter.newLine();
        } catch(IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void addIcFunc(IntermediateCode.Function f){
        try{
            icFuncWriter.write(f.toStringDetailed());
            icFuncWriter.newLine();
        } catch(IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public static void addTableSymbolEntry(String pre,Description d){
        try {
            tsWriter.write(pre);
            tsWriter.write(d.toString());
            tsWriter.newLine();
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
      public static void addTableSymbolText(String text){
        try {
            tsWriter.write(text);
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    private static void reportError(String error_msg, ErrorType errorType){
        String [] errorLabel = {"[Semantic Error]","[Lexic Error]","[Syntax error]"};
        String msg = errorLabel[errorType.ordinal()]+": "+error_msg;
        try {
            errorWriter.write(msg);
            errorWriter.newLine();
            System.out.println(msg+"\n");
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void reportSemanticError(String error_msg) throws FatalError{
        anySemanticError = true;
        reportError(error_msg, ErrorType.SEMANTIC);
        throw new FatalError();

    }
    
    
    public static void reportSyntacticError(String error_msg){
        anySyntaxError = true;
        reportError(error_msg, ErrorType.SYNTACTIC);
    }
    
    
    public static void reportLexicError(String error_msg) {
        anyLexicError = true;
        reportError(error_msg, ErrorType.LEXIC);
    }
    
    
    
    
    public static void addTokenInfo(String token,int line, int column){
        try {
            tokenWriter.write("("+line+","+column+")\t"+token);
            tokenWriter.newLine();
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void addTokenInfo(String token,int line, int column, Object attribute){
        try {
            tokenWriter.write("("+line+","+column+")\t"+token+": "+attribute.toString());
            tokenWriter.newLine();
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void closeAllWriters(){
        try {
            tokenWriter.close();
            tsWriter.close();
            errorWriter.close();
            icVarWriter.close();
            icFuncWriter.close();
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
