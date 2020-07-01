// --- 68K API ---

_internal void M68K_set_text_color(int r, int g, int b) -> "SETTXTCL";
_internal void M68K_set_text_properties (int red, int green, int blue, int size, int font, int style) -> "SETTXTPR";
_internal void M68K_set_screen_size(int width, int height) -> "INITSCRN";
_internal void M68K_set_stroke(int r, int g, int b) -> "SETSTRK";
_internal void M68K_set_fill(int r, int g, int b) -> "SETFILL";
_internal void M68K_draw_rect(int x, int y, int width, int height) -> "DRAWRECT";
_internal bool M68K_pixel_not_black(int x, int y) -> "BLACKPIX";
_internal void M68K_set_pixel(int x, int y, int r, int g, int b) -> "SETPIXEL";
_internal void M68K_enable_double_buffer() -> "DBENABLE";
_internal void M68K_show_double_buffer() -> "DBDRAW";
_internal void M68K_sleep(int millis) -> "DELAY";

// ---------------

func void draw_board(int w, int h, int dim)
{
    int rows = dim;
    int cols = rows;
    int side = w / rows; // square side
    int aux = 255 / dim;

    int iteration = 0;
    int red; int green; int blue;
    while (true)
    {
        // clear
        M68K_set_stroke(0, 0, 0);
        M68K_set_fill(0, 0, 0);
        M68K_draw_rect(0, 0, w, h);
        M68K_set_stroke(255, 255, 255);

        int mod_iter = iteration % 3;

        int r = 0;
        while (r < rows)
        {
            int c = 0;
            while (c < cols)
            {
                if (mod_iter == 0) 
                    {M68K_set_fill(r * aux, c * aux, 255);}
                else { 
                    if (mod_iter == 1) 
                        {M68K_set_fill((dim - c) * aux, (dim - r) * aux, 255);}
                    else 
                        {M68K_set_fill(c * aux, r * aux, 255);}
                }

                M68K_draw_rect(c * side, r * side, side, side);

                c = c + 1;
            }
            r = r + 1;
        }

        M68K_show_double_buffer();
        M68K_sleep(500);
        iteration = iteration + 1;
    }
}

func void cyclone()
{
    const int W = 640;
    const int H = W;
    M68K_set_screen_size(W, H);
    M68K_enable_double_buffer();
    draw_board(W,H,16);    
}