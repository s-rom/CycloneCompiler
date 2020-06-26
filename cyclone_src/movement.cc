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
func void cyclone()
{

    M68K_set_text_properties(255, 255, 255, 14, 6, 0);
    const int WIDTH = 640;
    const int HEIGHT = WIDTH;
    const int side = 10;

    M68K_set_screen_size(WIDTH, HEIGHT);
    M68K_enable_double_buffer();

    int y = HEIGHT / 2;
    int x = 0;
    int v = 5;
   
    M68K_set_stroke(0,0,0);
    while (true)
    {
        // Clear back buffer
        M68K_set_fill(34,32,52);
        M68K_draw_rect(0,0, WIDTH, HEIGHT);        

        // Paint spaceship
        M68K_set_fill(95, 205, 225);
        M68K_draw_rect(x - side, y, side, side);   
        M68K_set_fill(118, 66, 138);
        M68K_draw_rect(x, y, side, side);   
        M68K_draw_rect(x - side, y - side, side, side);     
        M68K_draw_rect(x - side, y + side, side, side);     
        M68K_draw_rect(x - (2 * side), y - (2 * side), side, side);     
        M68K_draw_rect(x - (2 * side), y + (2 * side), side, side);     

        // Update spaceship position
        x = (x + v) % WIDTH; 
        
        // Swap buffers and sleep
        M68K_show_double_buffer();
        M68K_sleep(33);
    }

}