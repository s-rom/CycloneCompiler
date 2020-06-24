_internal void M68K_set_text_properties
    (int red, int green, int blue, int size, int font, int style)
    -> "SETTXTPR";

func void cyclone()
{
    const int CONSOLAS = 6;
    M68K_set_text_properties(255, 255, 255, 14, CONSOLAS, 0);

    int x = 7;
    int y = 3;

    int r = x - y;
    output(" 7 - 3");
    output(" = ");
    outputln(r);

    r = x + y;
    output(" 7 + 3");
    output(" = ");
    outputln(r);

    y = -y;
    r = x - y;
    output(" 7 - (-3)");
    output(" = ");
    outputln(r);

    r = x + y;
    output(" 7 + (-3)");
    output(" = ");
    outputln(r);
  
}