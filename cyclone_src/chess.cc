// --- 68K API ---

_internal void M68K_set_text_color(int r, int g, int b) -> "SETTXTCL";
_internal void M68K_set_text_properties 
    (int red, int green, int blue, int size, int font, int style) -> "SETTXTPR";
_internal void M68K_set_screen_size(int width, int height) -> "INITSCRN";
_internal void M68K_set_stroke(int r, int g, int b) -> "SETSTRK";
_internal void M68K_set_fill(int r, int g, int b) -> "SETFILL";
_internal void M68K_draw_rect(int x, int y, int width, int height) -> "DRAWRECT";

// ---------------


func void draw_chessboard(int w, int h, int dim)
{
    int rows = dim;
    int cols = rows;
    int side = w / rows; // square side
 
    M68K_set_fill(255, 255, 255);
    M68K_set_stroke(255, 255, 255);

    int r = 0;
    while (r < rows)
    {
        int c = 0;
        while (c < cols)
        {
            if ((c % 2) == (r % 2))
            {
                int x = c * side;
                int y = r * side;
                M68K_draw_rect(x, y, side, side);
            }
            c = c + 1;
        }
        r = r + 1;
    }
}

func void cyclone()
{
    const int W = 640;
    const int H = W;
    M68K_set_screen_size(W, H);
    draw_chessboard(W,H,8);    
}