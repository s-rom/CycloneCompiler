_internal void M68K_set_text_color(int r, int g, int b) 
    -> "SETTXTCL";

_internal void M68K_set_text_properties
    (int red, int green, int blue, int size, int font, int style)
    -> "SETTXTPR";

func void cyclone()
{
    const int CONSOLAS = 6;
    M68K_set_text_properties(255, 255, 255, 14, CONSOLAS, 0);

    const int LEVELS = 8;
    output("Pirámide de ",LEVELS," niveles");
    outputln("CONSOLAS (",CONSOLAS,")");
  
}








