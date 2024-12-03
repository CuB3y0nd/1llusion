# (Monochrome) colorscheme
bg="#212529"
fg="#f8f9fa"

black="#2C3136"
red="#dee2e6"
green="#adb5bd"
yellow="#e9ecef"
blue="#495057"
magenta="#ced4da"
cyan="#6c757d"
white="#f8f9fa"
blackb="#343a40"
redb="#dee2e6"
greenb="#adb5bd"
yellowb="#e9ecef"
blueb="#495057"
magentab="#ced4da"
cyanb="#6c757d"
whiteb="#f8f9fa"

# bspwm options
BORDER_WIDTH="0"     # bspwm border
NORMAL_BC="#ced4da"  # normal border color
FOCUSED_BC="#f8f9fa" # focused border color

# terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# picom options
P_FADE="true"        # fade true|false
P_SHADOWS="true"     # shadows true|false
SHADOW_C="#000000"   # shadow color
P_CORNER_R="6"       # corner radius (0 = disabled)
P_BLUR="false"       # blur true|false
P_ANIMATIONS="@"     # (@ = enable) (# = disable)
P_TERM_OPACITY="1.0" # terminal transparency. range: 0.1 - 1.0 (1.0 = disabled)

# dunst
dunst_offset='0x60'
dunst_origin='top-center'
dunst_transparency='0'
dunst_corner_radius='6'
dunst_font='Maple Mono NF Bold Italic 9'
dunst_border='0'

# gtk theme vars
gtk_theme="MonochromeBlue-zk"
gtk_icons="Vimix-White"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-Monochromatic"

# wallpaper engine
# Available methods:
# - Theme (Set a random wallpaper from rice directory)
# - CustomDir (Set a random wallpaper from the directory you specified)
# - CustomImage (Sets a specific image as wallpaper)
ENGINE="Theme" # Theme | CustomDir | CustomImage
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
