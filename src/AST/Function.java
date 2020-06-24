package AST;

import IntermediateCode.FuncTag;
import IntermediateCode.Tag;
import SymbolTable.FuncDescription;
import cyclonecompiler.DOT;
import cyclonecompiler.FatalError;
import cyclonecompiler.Main;


public class Function extends Node{
    
    private String type;
    private String id;
    private Args args;
    private Block b;
    private String subroutine;
    
    public Function(String type, String id, Args args, Block b) throws FatalError{
        this.type = type;
        this.id = id;
        this.args = args;
        this.b = b;
        this.subroutine = null;
        semanticCheck();
        toDot();
    }
    
    public Function(String type, String id, Args args, String subroutine) throws FatalError{
        this.type = type;
        this.id = id;
        this.args = args;
        this.b = null;
        this.subroutine = subroutine;
        if (this.subroutine.length()>0 && this.subroutine.charAt(0) == '"')
            this.subroutine = subroutine.substring(1, subroutine.length()-1);
        semanticCheck();
        toDot();
    }
    
    @Override
    public void toDot() {
        if (b != null){
            DOT.writeNode(nodeNumber, "{Function | {Type: "+type+" | ID: "+id+" "
                + "| <a>Args | <b>Block}}", "record");
            DOT.writeEdge(nodeNumber, "b",b.getNodeNumber());
        }
        
        if (subroutine != null){
            int n = DOT.nextNode();
            DOT.writeNode(n, "Internal subroutine: "+subroutine);
            
            DOT.writeNode(nodeNumber, "{Function | {Type: "+type+" | ID: "+id+" "
                + "| <a>Args | <b> Call }}", "record");
            DOT.writeEdge(nodeNumber,"b", n);
        }
        
        if (args != null)  DOT.writeEdge(nodeNumber,"a", args.getNodeNumber());
    }

    @Override
    public void semanticCheck() throws FatalError {
        FuncDescription fd = 
                new FuncDescription(this.id, this.type);
        
                fd.setTag(new FuncTag(fd.getID()));

        
        Args a = this.args;
        while (a != null && a.getA() != null){
            fd.addParam(a.getA());
            a = a.getNextArgs();
        }
        
        fd.linkScope(Main.ts.getLastLevel1Scope());
        Main.ts.insert(this.id, fd);
    }

    @Override
    public void generateIntermediateCode() {
//        Tag funcTag;
//        
//        funcTag = subroutine == null ? new Tag() : new Tag(subroutine);

        /* -- TS -- */
        FuncDescription fd = (FuncDescription) Main.ts.getForward(id);
        Main.ts.setCurrentFunc(fd);
        /* -------- */
        
        IntermediateCode.Function icFunc = 
                new IntermediateCode.Function(fd.getID(), id, fd.getTag());
        
        
        // User defined function
        if (subroutine == null && b != null) {
            Main.gen.addCurrentFunction(icFunc);
            Main.gen.generateCommentary("----------- FUNC: "+ this.id +" ----------- ");
            Main.gen.generateSkip(icFunc.getTag());
            Main.gen.generatePmb();
            if (b != null){
                b.generateIntermediateCode();
            }
            Main.gen.generateReturn(null);
            Main.gen.generateCommentary("-------------- END ------------- ");
        // Internal API function
        } else {
            // ASSUMPTION: INTERNAL API ONLY ACCEPTS BOOL AND INT
            int paramBytes = fd.getParamList().size() * 4;
            icFunc.setOccupationInternalAPI(0, paramBytes);
            icFunc.setSubroutine(subroutine);
            Main.gen.addFunction(icFunc);
            
            
        }
    }
    
}
