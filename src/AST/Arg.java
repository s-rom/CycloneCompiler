package AST;

import SymbolTable.Description;
import SymbolTable.DescriptionType;
import SymbolTable.VarDescription;
import SymbolTable.VarDescription.VarSemantics;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;

public class Arg extends Node{

    private String type;
    private String id;

    public Arg(String type, String id) throws FatalError {
        this.type = type;
        this.id = id;
        semanticCheck();
        toDot();
    }
    
    public String getType(){
        return type;
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(this.nodeNumber, "Arg: "+type+" "+id);
    }

    @Override
    public void semanticCheck() throws FatalError {
        Description d = Main.ts.get(type);
        if (d == null || (d!=null && d.getDescriptionType() != DescriptionType.D_TYPE)){
            InfoDump.reportSemanticError("Type "+type+" is not defined");
        }
        
        VarDescription vd = new VarDescription(id,type, VarSemantics.INPARAM);
        Main.ts.insert(id, vd);
    }
    
    @Override
    public String toString(){
        return type+" "+id;
    }

    @Override
    public void generateIntermediateCode() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
