_internal void M68K_set_text_color(int r, int g, int b) 
    -> "SETTXTCL";

_internal void M68K_set_text_properties
    (int red, int green, int blue, int size, int font, int style)
    -> "SETTXTPR";


func void print_n_spaces(int n)
{
    string space = " ";
    int spc = 0;
    while (spc < n)
    {
        output(" ");
        spc = spc + 1;
    }
}


func void pyramid(int base)
{
    int row = 0;
    int col;
    int left_spaces = 0;
    int spc;
    string symbol = "o ";
    const int CONSOLAS = 6;
    int r = 0; int g = 0; int b = 255;
    while (row <= base)
    {
       
        left_spaces = base - row;
        print_n_spaces(left_spaces + 2);

        col = 0;
        while (col < row)
        {
            if ((row % 2) == (col % 2)) { r = 160; g = 54; b = 210; }
            else { r = 215; g = 155; b = 235; }

            M68K_set_text_properties(r, g, b, 14,CONSOLAS,0);
            output(symbol);
            col = col + 1;
        }

        row = row + 1;
        outputln("");
    }
}


func void cyclone()
{
    const int CONSOLAS = 6;
    M68K_set_text_properties(255, 255, 255, 14, CONSOLAS, 0);

    out("Introduce un entero entre 1 y 16: ");
    int levels = read_int();
    if ((levels <= 0) || (levels > 16))
    {
        out("Número inválido : ",levels,". Por defecto n = 8");
        outln("");
        levels = 8;
    }

    out("Pirámide de ",levels," niveles");
    outln("");
    pyramid(levels);
}








