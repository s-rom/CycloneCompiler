package IntermediateCode;

import SymbolTable.VarDescription;

public class Variable {
    
    /**
     * Esto es así para respetar los identificadores de las variables del 
     * código fuente.
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
    
    @Override
    public String toString(){
        return "t"+id; 
    }
    
    public static boolean equals(Variable v1, Variable v2){
        return v1.id == v2.id;
    }
    
    
}
