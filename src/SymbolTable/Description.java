/* 
    Clase base para las entradas de la Tabla de Simbolos 
*/ 
package SymbolTable;

public class Description {

    /* De aqui hacia abajo, 100% temporal */
    
    String name;
    String type;
    
    public Description(String name, String type){
        this.name = name;
        this.type = type;
    }
    
    
    /* PARA PRUEBAS */
    @Override
    public String toString(){
        return type+": "+name;
    }
    
}
