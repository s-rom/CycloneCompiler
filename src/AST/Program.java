package AST;

import SymbolTable.Description;
import SymbolTable.DescriptionType;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;

public class Program extends Node{
    private FunctionList fl;
    
    public Program(FunctionList fl) throws FatalError{
        this.fl = fl;
        semanticCheck();
        toDot();
        generateIntermediateCode();
    }

    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "Program");
        if (fl!=null) DOT.writeEdge(nodeNumber,fl.getNodeNumber());
    }

    @Override
    public void semanticCheck() throws FatalError {
        Description d = Main.ts.get("cyclone");
        if (d == null ||  d.getDescriptionType() != DescriptionType.D_FUNC){
            InfoDump.reportSemanticError("All Cyclone programs must have a main function");
        }
    }

    @Override
    public void generateIntermediateCode() {
        if (fl != null){
            fl.generateIntermediateCode();
        }
    }
    
    
}
