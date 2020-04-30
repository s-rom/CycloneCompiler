package AST;

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
    
    public Function(String type, String id, Args args, Block b) throws FatalError{
        this.type = type;
        this.id = id;
        this.args = args;
        this.b = b;
        semanticCheck();
        toDot();
    }
    
    @Override
    public void toDot() {
        DOT.writeNode(nodeNumber, "{Function | {Type: "+type+" | ID: "+id+" "
                + "| <a>Args | <b>Block}}","record");

        if (args != null)  DOT.writeEdge(nodeNumber,"a", args.getNodeNumber());
        if (b != null) DOT.writeEdge(nodeNumber, "b",b.getNodeNumber());
    }

    @Override
    public void semanticCheck() throws FatalError {
        FuncDescription fd = 
                new FuncDescription(this.id, this.type);
        
        Args a = this.args;
        while (a != null && a.getA() != null){
            fd.addParam(a.getA());
            a = a.getNextArgs();
        }
        
        
        fd.linkScope(Main.ts.getLastLevel1Scope());
        System.out.println("Function "+this.id);
        System.out.println("--- LINKED SCOPE ---\n" + fd.getScope());
        
        
        
        Main.ts.insert(this.id, fd);
    }

    @Override
    public void generateIntermediateCode() {
        // TODO: Generate args
        
        FuncDescription fd = (FuncDescription) Main.ts.getForward(id);
        Main.ts.setCurrentFuncID(fd);
        
        
        Tag funcTag = new Tag();
        Main.gen.generateCommentary("----------- FUNC: "+ this.id +" ----------- ");
        Main.gen.generateSkip(funcTag);
        if (b != null){
            System.out.println("Function genera Block");
            b.generateIntermediateCode();
        }
        Main.gen.generateReturn(funcTag);
        Main.gen.generateCommentary("-------------- END ------------- ");
    }
    
}
