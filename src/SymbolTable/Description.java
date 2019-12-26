/* 
    Clase base para las entradas de la Tabla de Simbolos 
*/ 
package SymbolTable;

public class Description {
    
    protected String name;
    protected DescriptionType dtype;
    
    public Description(String name, DescriptionType dtype){
        this.name = name;
        this.dtype = dtype;
    }
    
    
    public DescriptionType getDescriptionType(){
        return dtype;
    }
    
    @Override
    public String toString(){
        return name + " "+dtype;
    }
    
}
