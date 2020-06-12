
package AST;

import IntermediateCode.Variable;
import SymbolTable.Description;
import SymbolTable.Scope;
import SymbolTable.VarDescription;
import SymbolTable.VarDescription.VarSemantics;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;

public class Allocation extends Node{

    private String type;
    private String id;
    private int length;
    private int line, column;
    
    public Allocation (String type, String id, int length, int line, int column)
    throws FatalError {
        this.type = type;
        this.id = id;
        this.length = length;
        this.line = line;
        this.column = column;
        semanticCheck();
        toDot();
    }
    
    
    @Override
    public void toDot() {
        String label = "Allocation: "+id+" "+type+" ["+length+"] ";
        DOT.writeNode(nodeNumber, label);    
    }

    @Override
    public void semanticCheck() throws FatalError {
        if (!this.type.equals("string")){
            InfoDump.reportSemanticError
                ("In "+getLocationInfo()+": Allocation of type "+type+" is not supported yet!");
        }
        Main.ts.insert(id, new VarDescription(id, type, VarSemantics.LOCAL, length));
    }

    @Override
    public void generateIntermediateCode() { 
//        Variable v = new Variable(VarSemantics.LOCAL, length);

        
        if (Main.ts.getCurrentFunc() == null){
            System.err.println("Asignación fuera de una función (currentFunc == null)");
        }
            
        Scope funcScope = Main.ts.getCurrentFunc().getScope();
        Description d = Main.ts.getForwardStartingFrom(id,funcScope);

        if (d == null){
            System.err.println("No ha encontrado "+id+" en la ts");
            return;
        }

        VarDescription vd = (VarDescription) d;
        Variable v = Main.gen.getVariable(vd.varNumber);
        if (v == null){
            System.out.println("ID = Expr, id ic_var not found! (id: \""+id+"\")");
            v = new Variable(vd.varNumber, vd.getVarSemantics(), vd.getLength());
        }
    }
    
    public String getLocationInfo(){
        return "line "+(line+1)+", column "+(column+1);
    }
    
    
}
