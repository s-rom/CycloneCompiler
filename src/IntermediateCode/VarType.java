package IntermediateCode;

public enum VarType {
    BOOL, INT, STRING, UNKNOWN;
    
    public static VarType stringToVarType(String type){
        if (type == null) return VarType.UNKNOWN;
        
        VarType vt = type.equals("int") ? VarType.INT : 
                     type.equals("string") ? VarType.STRING : 
                     type.equals("bool") ? VarType.BOOL :
                     VarType.UNKNOWN;
        
        return vt;
    }
}
