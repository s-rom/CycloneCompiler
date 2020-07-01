// --- 68K API ---

_internal void M68K_set_text_properties 
    (int red, int green, int blue, int size, int font, int style) -> "SETTXTPR";

// ---------------

func void cyclone()
{
    M68K_set_text_properties(255, 255, 255);
}


