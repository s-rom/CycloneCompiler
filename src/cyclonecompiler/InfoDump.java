package cyclonecompiler;

import static cyclonecompiler.DOT.setNodeStyle;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InfoDump {

    public static BufferedWriter br; 


    private static BufferedWriter writer;
    
    public static void initAllWriters(String token_path){
        try {
            FileWriter fwriter = new FileWriter(new File(token_path));
            writer = new BufferedWriter(fwriter);
            writer.write("### ---------- Token File ----------");
            writer.newLine();
            writer.write("### Format: (line,colum) TokenName: Attribute?");
            writer.newLine();            
            writer.newLine();
        } catch (IOException ex) {
            Logger.getLogger(DOT.class.getName()).log(Level.SEVERE, null, ex);
        }
        setNodeStyle("box");
    }
    
    public static void addTokenInfo(String token,int line, int column){
        try {
            writer.write("("+line+","+column+")\t"+token);
            writer.newLine();
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void addTokenInfo(String token,int line, int column, Object attribute){
        try {
            writer.write("("+line+","+column+")\t"+token+": "+attribute.toString());
            writer.newLine();
        } catch (IOException ex) {
            Logger.getLogger(InfoDump.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void closeAllWriters(){
        try {
            writer.close();
        } catch (IOException ex) {
            Logger.getLogger(DOT.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
