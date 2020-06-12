func void cyclone()
{
    string x = "Hola que tal";
    //string x = x + y; // "Hola que tal" -> no puede exceder
    output(x);


    string msg;
    int i;
    bool cond;


    string y = string_alloc(15); // 16 '\0'
    y = input_string();  // Hará truncado

    i = input_int();     // bien, ya se ha reservado 4B para i
    cond = input_bool(); // bien, igual que input_int

    // OPCION 1 - Reservar un tamaño fijo para Strings. 
    /*
        -> alloc_string(15); o string s<15>;
            
            Devuelve un string de 15+1(para que sea par) '\0'
            Se puede resolver en tiempo de ejecución

        --- inicialización --- 
            string s = "bla"; //3 + 1 bytes = b  l  a  \0
            string s(3); // 3 + 1 bytes     = \0 \0 \0 \0
            string s(4); // 4 bytes         = \0 \0 \0 \0
            string s;    // no debería estar permitido
            string s = ""; // 2 bytes       = \0 \0


        --- operaciones ---

        OBLIGATORIAMENTE:

            string s(15);
            s = "hola que tal";

            string s2(24);
            s2 = s;

            size
            length


        OPCIONAL:
            concatenación
            truncado
            acceso a carácter

        Problemas: 
            - No muere hasta que no termina el scope
            - Hará falta una función copy_string en 68k
            - Asegurarse que el número de bytes sea par
    
    POSIBILIDADES:

        -> get_char(string s, int i)
            Devuelve una string de dos bytes, comenzando en 0

        -> set_char(string s, int i, string n)

    */
}
