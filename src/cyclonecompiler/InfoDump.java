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


    private static BufferedWriter tokenWriter;
    private static BufferedWriter tsWriter;
    private static BufferedWriter errorWriter;

    
    public static void initAllWriters(String token_path, String ts_path,
            String error_path){
        try {
            FileWriter fwriterToken = new FileWriter(new File(token_path));            
            FileWriter fwriterTS = new FileWriter(new File(ts_path));            
            FileWriter fwriterError = new FileWriter(new File(error_path));            

            errorWriter = new BufferedWriter(fwriterError);
            tokenWriter = new BufferedWriter(fwriterToken);
            tsWriter = new BufferedWriter(fwriterTS);

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
            Logger.getLogger(DOT.class.getName()).log(Level.SEVERE, null, ex);
        }
        setNodeStyle("box");
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
    
    public static void reportError(String error_msg, ErrorType errorType){
        String [] errorLabel = {"[Semantic Error]","[Lexic Error]","Syntax error"};
        String msg = errorLabel[errorType.ordinal()]+": "+error_msg;
        System.out.println(msg);
        try {
            errorWriter.write(msg);
            errorWriter.newLine();
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        } catch (IOException ex) {
            Logger.getLogger(DOT.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}