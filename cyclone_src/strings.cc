// --- 68K API ---
_internal void M68K_set_text_properties (int red, int green, int blue, int size, int font, int style) -> "SETTXTPR";
// ---------------

func void cyclone()
{
    const int CONSOLAS = 6;
    M68K_set_text_properties(255, 255, 255, 12, CONSOLAS, 0);
    
    string msg = "Hello, World!";
    string dst[5];
    
    outln("METODO 1 - asignación implícita: string msg = Hello, World!");
    outln("METODO 2 - asignación explícita: string msg[5]");
    outln("Operacion permitida: src = msg");
    outln("--------------------------------");
    dst = msg;
    outln("bytes(msg): 14, msg: ", msg);
    outln("bytes(dst): 5+1, dst: ",dst);
}