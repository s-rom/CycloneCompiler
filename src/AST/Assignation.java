package AST;

import AST.Primary.PrimaryType;
import IntermediateCode.VarType;
import IntermediateCode.Variable;
import SymbolTable.ConstDescription;
import SymbolTable.Description;
import SymbolTable.DescriptionType;
import SymbolTable.Scope;
import SymbolTable.TypeDescription;
import SymbolTable.VarDescription;
import SymbolTable.VarDescription.VarSemantics;
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
            
            // comprobar que x sea variable y no constante
            Description td = ts.get(id);
            if (td == null)
            {
                 InfoDump.reportSemanticError("'"+id+"' not found in the current scope ("+
                        this.getLocationInfo()+")");
            }
            
            if (td.getDescriptionType() != DescriptionType.D_VAR){
                InfoDump.reportSemanticError("Id of an assignation must be a variable ("+id+")"+" in "+
                        this.getLocationInfo());
                return;
            }
            
            // comprobar que tenga un tipo definido en la ts
            VarDescription vd = (VarDescription) td;
            td = ts.get(vd.type);
            if (td == null){
                InfoDump.reportSemanticError("Type "+vd.type+" is not defined"+" in "+
                        this.getLocationInfo());
                return;
            }
            
            // comprobar que si x = src --> tipo(x) == tipo(src)
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
                
                if (type.equals("string")){
                    InfoDump.reportSemanticError("In "+getLocationInfo()+": 0 length strings are not allowed."
                            + " Use string "+id+"[size] instead.");
                }
                
                boolean exists = !ts.insert(id, 
                        new VarDescription(id, type, VarSemantics.LOCAL));
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
                
                Description nd = constant? new ConstDescription(id,type) : 
                        new VarDescription(id,type, VarSemantics.LOCAL);
               
                
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
                
                if (this.type.equals("string")){
                    if (this.e.ue.p.productionType != PrimaryType.STR_LIT){
                        InfoDump.reportSemanticError("In "+getLocationInfo()+": "
                                + "strings must be allocated first. Try string id[size] or string id = \"literal\" ");
                    }
                    
                    String str_lit = (String) this.e.ue.p.getValue();
                    if (constant){
                        // TODO
                    } else {
                        int len = str_lit.length();
                        VarDescription vd = (VarDescription) nd;
                        vd.setLength(str_lit.length());
                    }
                }
                
                
                boolean exists = !ts.insert(id, nd);
            }            
        }
    }

    @Override
    public void generateIntermediateCode() {

        if (e != null) {
            e.generateIntermediateCode();
        }
        
        //const Type ID = Expr;
        if (this.constant){
            
            if (Main.ts.getCurrentFunc() == null){
                System.err.println("Asignación fuera de una función (currentFunc == null)");
            }
            
            Scope funcScope = Main.ts.getCurrentFunc().getScope();
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
            Variable v = Main.gen.getVariable(cd.getConstNum());
            if (v == null){
                VarType vt = VarType.stringToVarType(type);
                v = new Variable(cd.getConstNum(), VarSemantics.LOCAL, vt, null);
            }
            Main.gen.generateAssignation(e.intermediateVar, v,
                    "const \'"+id+"\' = expr");
            
            return;
        }
        
        // ID = Expr; o TypeVar ID = Expr; o TypeVar ID;
        
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

        Variable thisVar = Main.gen.getVariable(vd.varNumber); 

        if (thisVar == null){
            int len = 4;
            if (type != null && type.equals("string")) len = vd.getLength() + 1;

            thisVar = new Variable(vd.varNumber, vd.getVarSemantics(), len,
                VarType.stringToVarType(type), id);
            
        }

        if (e != null)
            Main.gen.generateAssignation(e.intermediateVar, thisVar,
                "\'"+id+"\' = expr");
    }
}
