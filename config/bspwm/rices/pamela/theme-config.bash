# (Lovelace) colorscheme from Elenapan
bg="#1D1F28"
fg="#FDFDFD"

black="#282A36"
red="#F37F97"
green="#5ADECD"
yellow="#F2A272"
blue="#8897F4"
magenta="#C574DD"
cyan="#79E6F3"
white="#FDFDFD"
blackb="#414458"
redb="#FF4971"
greenb="#18E3C8"
yellowb="#FF8037"
blueb="#556FFF"
magentab="#B043D1"
cyanb="#3FDCEE"
whiteb="#BEBEC1"

# bspwm options
BORDER_WIDTH="0"     # bspwm border
NORMAL_BC="#C574DD"  # normal border color
FOCUSED_BC="#8897F4" # focused border color

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
dunst_offset='28x65'
dunst_origin='top-right'
dunst_transparency='9'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'

# gtk theme vars
gtk_theme="LoveLace-zk"
gtk_icons="Luv-Folders"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-LoveLace"

# wallpaper engine
# Available methods:
# - Theme (Set a random wallpaper from rice directory)
# - CustomDir (Set a random wallpaper from the directory you specified)
# - CustomImage (Sets a specific image as wallpaper)
ENGINE="Theme" # Theme | CustomDir | CustomImage
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
