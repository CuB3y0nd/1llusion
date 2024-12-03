# (Dracula) colorscheme
bg="#282a36"
fg="#f8f8f2"

black="#21222c"
red="#ff5555"
green="#50fa7b"
yellow="#f1fa8c"
blue="#bd93f9"
magenta="#ff79c6"
cyan="#8be9fd"
white="#f8f8f2"
blackb="#6272a4"
redb="#ff6e6e"
greenb="#69ff94"
yellowb="#ffffa5"
blueb="#d6acff"
magentab="#ff92df"
cyanb="#a4ffff"
whiteb="#ffffff"

# bspwm options
BORDER_WIDTH="2"     # bspwm border
NORMAL_BC="#ff79c6"  # normal border color
FOCUSED_BC="#bd93f9" # focused border color

# terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# picom options
P_FADE="true"        # fade true|false
P_SHADOWS="false"    # shadows true|false
SHADOW_C="#000000"   # shadow color
P_CORNER_R="0"       # corner radius (0 = disabled)
P_BLUR="false"       # blur true|false
P_ANIMATIONS="@"     # (@ = enable) (# = disable)
P_TERM_OPACITY="1.0" # terminal transparency. range: 0.1 - 1.0 (1.0 = disabled)

# dunst
dunst_offset='20x60'
dunst_origin='top-right'
dunst_transparency='0'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='2'

# gtk theme vars
gtk_theme="Dracula-zk"
gtk_icons="Dracula"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-Dracula"

# wallpaper engine
# Available methods:
# - Theme (Set a random wallpaper from rice directory)
# - CustomDir (Set a random wallpaper from the directory you specified)
# - CustomImage (Sets a specific image as wallpaper)
ENGINE="Theme" # Theme | CustomDir | CustomImage
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
