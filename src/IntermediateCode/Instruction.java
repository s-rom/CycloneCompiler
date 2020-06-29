package IntermediateCode;

public class Instruction {
    
    private Object src1;
    private Object src2;
    private Object dst;
    private Opcode op;
    
    
    public Instruction(Opcode op, Object src1, Object src2, Object dst){
        this.op = op;
        this.src1 = src1;
        this.src2 = src2;
        this.dst = dst;
    }  
    
    public Object getSrc1() {
        return src1;
    }

    public void setSrc1(Object src1) {
        this.src1 = src1;
    }

    public Object getSrc2() {
        return src2;
    }

    public void setSrc2(Object src2) {
        this.src2 = src2;
    }

    public Object getDst() {
        return dst;
    }

    public void setDst(Object dst) {
        this.dst = dst;
    }

    public Opcode getOp() {
        return op;
    }

    public void setOp(Opcode op) {
        this.op = op;
    }
    
    @Override
    public String toString() {
        String res = "<"+op.name();
        if (src1 != null)
            res += ", "+src1;
        if (src2 != null)
            res += ", "+src2;
        if (dst != null)
            res += ", "+dst;
        
        return res + ">";
    }
}
