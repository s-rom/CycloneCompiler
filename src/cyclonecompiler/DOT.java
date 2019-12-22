package cyclonecompiler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DOT {
    
    private static int totalNodes = -1;
    
    private static BufferedWriter writer;
    
    public static void initWriter(String path){
        try {
            FileWriter fwriter = new FileWriter(new File(path));
            writer = new BufferedWriter(fwriter);
            writer.write("digraph ccTree {\r\n");
        } catch (IOException ex) {
            Logger.getLogger(DOT.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void closeWriter(){
        try {
            writer.write("}");
            writer.close();
        } catch (IOException ex) {
            Logger.getLogger(DOT.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static int nextNode(){
        return ++totalNodes;
    }
    
    public static int currNode(){
        return totalNodes;
    }
    
    // nNODE [label = "LABEL"]
    public static void writeNode(int node, String label){
        try {
            writer.write("\tn" + node + " [label = \"" + label + "\"]\r\n");
        } catch (IOException ex) {
            Logger.getLogger(DOT.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // nNODE1-> nNODE2
    public static void writeEdge(int node1, int node2){
        try {
            writer.write("\tn" + node1 + "-> n" + node2 + "\r\n");
        } catch (IOException ex) {
            Logger.getLogger(DOT.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
