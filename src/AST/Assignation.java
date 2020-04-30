package AST;

import IntermediateCode.Variable;
import SymbolTable.ConstDescription;
import SymbolTable.Description;
import SymbolTable.DescriptionType;
import SymbolTable.Scope;
import SymbolTable.TypeDescription;
import SymbolTable.VarDescription;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.InfoDump;
import cyclonecompiler.Main;
import static cyclonecompiler.Main.ts;

public class Assignation extends Node{

    private String type;
    private String id;
    private Expr e;
    private int line, column;
    private boolean constant; // Si el id de la asignacion es una constante
    
    public String getLocationInfo(){
        return "line "+(line+1)+", column "+(column+1);
    }
    
    /*
        type id;
        type id = expr;
        const type id = expr;
    */
    public Assignation(String type, String id, Expr e, boolean constant, int line, int column)  throws FatalError{
        this.e = e;
        this.id = id;
        this.type = type;
        this.line = line;
        this.column = column;
        this.constant = constant;
        semanticCheck();
        toDot();
    }
    
    /*
        id = expr;
    */
    public Assignation(String id, Expr e, int line, int column)  throws FatalError{
        this.type = null;
        this.e = e;
        this.id = id;
        this.line = line;
        this.column = column;
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
                
                label = "Declaration: "+(constant?"const":"")+type+" "+id+" = ";
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
                InfoDump.reportSemanticError("Missing expression in assignation of "+id+" in "+
                        this.getLocationInfo());
                return;
            }   
            
            Description td = ts.get(id);
            if (td.getDescriptionType() != DescriptionType.D_VAR){
                InfoDump.reportSemanticError("Id of an assignation must be a variable ("+id+")"+" in "+
                        this.getLocationInfo());
                return;
            }
            
            VarDescription vd = (VarDescription) td;
            td = ts.get(vd.type);
            if (td == null){
                InfoDump.reportSemanticError("Type "+vd.type+" is not defined"+" in "+
                        this.getLocationInfo());
                return;
            }
            
            
            TypeDescription t = (TypeDescription) ts.get(vd.type);
            if (!t.getAtomicType().equals(e.getAtomicType())){
                InfoDump.reportSemanticError("The expression type ("+ e.getAtomicType().getDType()+
                        ") must be consistent with id ("+id+","+vd.type+")"+" in "+
                        this.getLocationInfo());
            }
            
        } else {
            if (e == null){
                // int x;
                // insertar x en la TS;
                Description dtype = ts.get(type);
                if (dtype.getDescriptionType() != DescriptionType.D_TYPE){
                    InfoDump.reportSemanticError(type+" must be a valid type"+" in "+
                        this.getLocationInfo());
                }
                
                boolean exists = !ts.insert(id, new VarDescription(id,type));
            } else {
                // int x = ...;
                // insertar x en la TS
                // comprobar que la expresion y x son tipos compatibles
                // o realizar castings semanticos
                Description dtype = ts.get(type);
                if (dtype.getDescriptionType() != DescriptionType.D_TYPE){
                    InfoDump.reportSemanticError(type+" must be a valid type"+" in "+
                        this.getLocationInfo());
                }
                
                Description nd = constant? new ConstDescription(id,type) : new VarDescription(id,type);
                boolean exists = !ts.insert(id, nd);
                if (exists) return;
                
                if (e.getAtomicType() == null){
                    InfoDump.reportSemanticError("Unknown condition, expresion of assignation has null type"+" in "+
                        this.getLocationInfo());
                }
                
                TypeDescription td = (TypeDescription) dtype;
                if (!td.getAtomicType().equals(e.getAtomicType())){
                    InfoDump.reportSemanticError("ID \""+id+"\" ("+type+") doesn't match expression type ("
                            +this.e.getAtomicType().getDType()+")"+" in "+
                        this.getLocationInfo());
                }
            }
        }
        
    }

    @Override
    public void generateIntermediateCode() {

        if (e != null) {
            System.out.println("Assignation genera Expresion");
            e.generateIntermediateCode();
        }
        
        //const Type ID = Expr;
        if (this.constant){
            
            if (Main.ts.getCurrentFuncID() == null){
                System.err.println("Asignación fuera de una función (currentFunc == null)");
            }
            
            Scope funcScope = Main.ts.getCurrentFuncID().getScope();
            Description d = Main.ts.getForwardStartingFrom(id,funcScope);
            
            if (d == null){
                System.err.println("No ha encontrado "+id+" en la ts");
                return;
            }
            
            if (d.getDescriptionType() != DescriptionType.D_CONST){
                System.out.println("Error const bool pero no en la ts");
                return;
            }
            
            ConstDescription cd = (ConstDescription) d;
            Main.gen.generateAssignation(e.intermediateVar, new Variable(cd.getConstNum()),
                    "const \'"+id+"\' = expr");
            
            return;
        }
        
        // ID = Expr; o TypeVar ID = Expr;
        if (e != null){
            if (Main.ts.getCurrentFuncID() == null){
                System.err.println("Asignación fuera de una función (currentFunc == null)");
            }
            
            Scope funcScope = Main.ts.getCurrentFuncID().getScope();
            Description d = Main.ts.getForwardStartingFrom(id,funcScope);
            
            if (d == null){
                System.err.println("No ha encontrado "+id+" en la ts");
                return;
            }
            
            VarDescription vd = (VarDescription) d;
            
            Main.gen.generateAssignation(e.intermediateVar, new Variable(vd.varNumber),
                    "\'"+id+"\' = expr");
        }
        
        // Type ID;
        // Nada
    }
    
    
    
}
