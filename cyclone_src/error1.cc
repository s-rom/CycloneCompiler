// --- 68K API ---

_internal void M68K_set_text_properties (int red, int green, int blue, int size, int font, int style) -> "SETTXTPR";


// ---------------

func void cyclone()
{
    const int CONSOLAS = 6;
    M68K_set_text_properties(255, 255, 255, 14, CONSOLAS, 0);

    string s;
    s = "hola";
    outln(s);
}