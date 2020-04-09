package IntermediateCode;

import SymbolTable.VarDescription;

public class Variable {
    
    /**
     * Esto está así para respetar los id de las variables del 
     * código fuente sin que se añada a la tabla de símbolos.
     * @return 
     */
    public static int nextId(){
        return VarDescription.nextVarNumber();
    }
   
    private int id;
    
    /**
     * Cada variable de código intermedio és único con este constructor.
     */
    public Variable(){
        id = nextId();
    }
    
    public Variable(int existingId){
        id = existingId;
    }
    
    public int getId(){
        return this.id;
    }
    
    @Override
    public String toString(){
        return "t"+id; 
    }
    
    public static boolean equals(Variable v1, Variable v2){
        return v1.id == v2.id;
    }
    
    
}
