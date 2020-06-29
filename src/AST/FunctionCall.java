package AST;

import IntermediateCode.Opcode;
import SymbolTable.Description;
import SymbolTable.DescriptionType;
import SymbolTable.FuncDescription;
import SymbolTable.TypeDescription;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;
import java.util.ArrayList;

public class FunctionCall extends Node {
    
    private String id;
    private ExprArg param;
    private ArrayList<Expr> listFound; 
    private int line, column;
    
    public ArrayList<Expr> getExpressionList(){
        return listFound;
    }
    
    public String getID(){
        return id;
    }
    
    public FunctionCall(String id, ExprArg param, int line, int column) throws FatalError{
        this.id = id;
        this.param = param;
        this.line= line;
        this.column = column;
        semanticCheck();
        toDot();
    }
    
    private String getLocationInfo(){
        return "line "+line+", column "+column;
    }

    @Override
    public void toDot(){
        
        DOT.writeNode(nodeNumber, "{FunctionCall | { ID: "+id+" | <e>ExprArg}}","record");
//        DOT.writeNode(nodeNumber, "FunctionCall: "+id);
        if (param != null) DOT.writeEdge(nodeNumber,"e", param.getNodeNumber());
        
    }

    @Override
    public void semanticCheck() throws FatalError {
        Description d = Main.ts.get(this.id);
        if (d == null || d.getDescriptionType() != DescriptionType.D_FUNC){
            InfoDump.reportSemanticError(id+" is not an existing function, in "+getLocationInfo());
        }
        
        ArrayList<Arg> list = ((FuncDescription) d).getParamList();
        listFound = new ArrayList();
        int numParam = 0;
        ExprArg ea = this.param;
        if (ea != null){
            if (ea.getExpr() != null) {
                numParam++;
                listFound.add(ea.getExpr());
            }
            ExprList el = ea.getExprList();
            
            while (el != null){
                if (el.getExpr() != null) 
                {
                    listFound.add(el.getExpr());
                    numParam++;
                }
                el = el.getNext();
            }
        }
        
        if (numParam != list.size()){
            InfoDump.reportSemanticError("Function "+id+" requires "+list.size()+" parameters, found "+numParam+
                    " in "+getLocationInfo());
        }
        for (int i = 0; i<numParam; i++){
            Arg a = list.get(i);
            TypeDescription td = (TypeDescription)Main.ts.get(a.getType());
            if (listFound.get(i).getAtomicType() != td.getAtomicType()){
                
                
                InfoDump.reportSemanticError("Error in parameter "+(i+1)+" in function "
                        + id+" in "+getLocationInfo()+": expected "+
                        td.getAtomicType().getDType()+", found "+
                        listFound.get(i).getAtomicType().getDType());
            }
        }
        
        
    }

    @Override
    public void generateIntermediateCode() {

        FuncDescription fd = (FuncDescription) Main.ts.getForward(this.id);
        for (Expr arg : this.listFound){
            arg.generateIntermediateCode();
            Main.gen.generateParam(arg.intermediateVar == null? 
                    arg.literal : arg.intermediateVar);
        }
                
        Main.gen.generateCall(fd.getTag());
    }

}
