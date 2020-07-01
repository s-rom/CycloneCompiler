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
    M68K_set_text_properties(255, 255, 255);
}