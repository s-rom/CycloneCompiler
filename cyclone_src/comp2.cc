// _internal void M68K_set_text_color(int r, int g, int b) -> "SETTXTCL";
// _internal void M68K_set_text_properties 
//     (int red, int green, int blue, int size, int font, int style) -> "SETTXTPR";

// func bool isSumZero(int a, int b)
// {
//     return (a + b) == 0;
// }

func void cyclone()
{
    // const int CONSOLAS = 6;
    // M68K_set_text_properties(255, 255, 255, 14, CONSOLAS, 0);
    
    // out("resultado de isSumZero(3,-3): ", isSumZero(3,-3));
    // outln("");
    // out("resultado de isSumZero(7, 9): ", isSumZero(7,9));


    /* INPUT */
    // Método 1: Que sea una una funcion _internal
    // Método 2: Construcción del lenguaje
    

    // Para read_string
    /*
        D0.L <- 2
        A1 <- @STR
        TRAP #15
    */

    outln("Introduce un número: ");
    int x = read_int();
    output("Introducido: ", x);
}