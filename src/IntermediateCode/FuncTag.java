/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IntermediateCode;

/**
 *
 * @author Sergi
 */
public class FuncTag {
    private int id;
    private String tag = "f";
    
    public FuncTag(int id){
        this.id = id;
        tag += id;
    }
    
    public FuncTag(String subroutine){
        tag = subroutine;
    }
    
    @Override
    public String toString(){
        return tag; 
    }
    
    public int getID(){
        return this.id;
    }
    
    public static boolean equals(FuncTag t1, FuncTag t2){
        return t1.id == t2.id;
    }
}