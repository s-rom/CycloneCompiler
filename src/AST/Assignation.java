package AST;

import SymbolTable.Description;
import SymbolTable.DescriptionType;
import SymbolTable.TypeDescription;
import SymbolTable.VarDescription;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.InfoDump.ErrorType;
import static cyclonecompiler.Main.ts;

public class Assignation extends Node{

    private String type;
    private String id;
    private Expr e;
    
    
    public Assignation(String type, String id, Expr e)  throws FatalError{
        this.e = e;
        this.id = id;
        this.type = type;
        semanticCheck();
        toDot();
    }
    
    public Assignation(String id, Expr e)  throws FatalError{
        this.type = null;
        this.e = e;
        this.id = id;
        semanticCheck();
        toDot();
    }
    
    @Override
    public void toDot() {
        String label = "";
        if (e == null){
            label = "Declaration: "+type+" "+id;
        } else {
            if (type == null){
                label = "Assignation: "+id+" = ";
            } else {
                label = "Declaration: "+type+" "+id+" = ";
            }
        }
        DOT.writeNode(nodeNumber, label);
        if (e != null) DOT.writeEdge(nodeNumber, e.getNodeNumber());
    }

    @Override
    public void semanticCheck() throws FatalError{
        if (type == null){
            // x = ...;
            // comprobar que x existe y la expresion devuelve el mismo tipo
            if (e == null) {
                InfoDump.reportSemanticError("Missing expression in assignation of "+id);
                return;
            }   
            
            Description td = ts.get(id);
            if (td.getDescriptionType() != DescriptionType.D_VAR){
                InfoDump.reportSemanticError("Id of an assignation must be a variable ("+id+")");
                return;
            }
            
            VarDescription vd = (VarDescription) td;
            td = ts.get(vd.type);
            if (td == null){
                InfoDump.reportSemanticError("Type "+vd.type+" is not defined");
                return;
            }
            
            
            TypeDescription t = (TypeDescription) ts.get(vd.type);
            if (!t.getAtomicType().equals(e.getAtomicType())){
                InfoDump.reportSemanticError("The expression type ("+ e.getAtomicType().getDType()+
                        ") must be consistent with id ("+id+","+vd.type+")");
            }
            
        } else {
            if (e == null){
                // int x;
                // insertar x en la TS;
                Description dtype = ts.get(type);
                if (dtype.getDescriptionType() != DescriptionType.D_TYPE){
                    InfoDump.reportError(type+" must be a valid type",ErrorType.SEMANTIC);
                }
                
                boolean exists = !ts.insert(id, new VarDescription(id,type));
            } else {
                // int x = ...;
                // insertar x en la TS
                // comprobar que la expresion y x son tipos compatibles
                // o realizar castings semanticos
                Description dtype = ts.get(type);
                if (dtype.getDescriptionType() != DescriptionType.D_TYPE){
                    InfoDump.reportError(type+" must be a valid type",ErrorType.SEMANTIC);
                }
                
                boolean exists = !ts.insert(id, new VarDescription(id,type));
                if (exists) return;
                
                /* PLACEHOLDER */
                if (e.getAtomicType() == null) return;
                
                TypeDescription td = (TypeDescription) dtype;
                if (!td.getAtomicType().equals(e.getAtomicType())){
                    InfoDump.reportError("ID \""+id+"\" ("+type+") doesn't match expression type ("
                            +this.e.getAtomicType().getDType()+")"
                            ,ErrorType.SEMANTIC);
                }
            }
        }
        
    }
    
    
    
}
