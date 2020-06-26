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

func void draw_background(int w, int h)
{
    // Clear back buffer
    M68K_set_fill(34,32,52);
    M68K_draw_rect(0,0, w, h);   

    int side = 3;
    M68K_set_fill(196,194,100);

    M68K_draw_rect(513,67,5,5);
    M68K_draw_rect(176,232,5,5);
    M68K_draw_rect(420,133,4,4);
    M68K_draw_rect(196,203,2,2);
    M68K_draw_rect(136,78,5,5);
    M68K_draw_rect(458,116,4,4);
    M68K_draw_rect(221,26,5,5);
    M68K_draw_rect(587,330,5,5);
    M68K_draw_rect(20,75,4,4);
    M68K_draw_rect(578,492,2,2);
    M68K_draw_rect(85,140,3,3);
    M68K_draw_rect(71,517,4,4);
    M68K_draw_rect(252,52,3,3);
    M68K_draw_rect(438,46,4,4);
    M68K_draw_rect(135,107,4,4);
    M68K_draw_rect(283,137,5,5);
    M68K_draw_rect(162,112,2,2);
    M68K_draw_rect(414,478,5,5);
    M68K_draw_rect(564,42,3,3);
    M68K_draw_rect(596,369,5,5);
    M68K_draw_rect(452,0,5,5);
    M68K_draw_rect(171,65,3,3);
    M68K_draw_rect(226,213,2,2);
    M68K_draw_rect(333,160,5,5);
    M68K_draw_rect(96,294,4,4);
    M68K_draw_rect(96,430,5,5);
    M68K_draw_rect(486,180,4,4);
    M68K_draw_rect(7,476,4,4);
    M68K_draw_rect(537,507,4,4);
    M68K_draw_rect(51,208,2,2);       
    M68K_draw_rect(38,437,4,4);
    M68K_draw_rect(399,329,4,4);
    M68K_draw_rect(151,22,5,5);
    M68K_draw_rect(134,583,4,4);
    M68K_draw_rect(587,389,5,5);
    M68K_draw_rect(43,204,4,4);
    M68K_draw_rect(524,328,2,2);
    M68K_draw_rect(189,263,3,3);
    M68K_draw_rect(440,334,2,2);
    M68K_draw_rect(27,326,2,2);
    M68K_draw_rect(201,582,3,3);
    M68K_draw_rect(386,441,4,4);
    M68K_draw_rect(35,93,2,2);
    M68K_draw_rect(126,365,2,2);
    M68K_draw_rect(522,353,5,5);
    M68K_draw_rect(530,117,5,5);
    M68K_draw_rect(351,286,5,5);
    M68K_draw_rect(537,309,2,2);
    M68K_draw_rect(370,537,3,3);
    M68K_draw_rect(138,140,5,5);
    M68K_draw_rect(8,189,3,3);
    M68K_draw_rect(279,53,5,5);
    M68K_draw_rect(578,181,3,3);
    M68K_draw_rect(372,155,5,5);
    M68K_draw_rect(492,218,2,2);
    M68K_draw_rect(517,512,2,2);
    M68K_draw_rect(371,505,3,3);
    M68K_draw_rect(449,148,2,2);
    M68K_draw_rect(459,408,5,5);
    M68K_draw_rect(1,297,5,5);
        
}

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
             
        draw_background(WIDTH, HEIGHT);

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