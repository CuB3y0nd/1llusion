# colorscheme
bg="#FDF0ED"
fg="#151515"

black="#151515"
red="#DA103F"
green="#1EB980"
yellow="#FFCC57"
blue="#67d4f1"
magenta="#b0a5ed"
cyan="#2eccca"
white="#ededed"
blackb="#F0E9E2"
redb="#F43E5C"
greenb="#07DA8C"
yellowb="#F77D26"
blueb="#3FC6DE"
magentab="#F075B7"
cyanb="#1EAEAE"
whiteb="#16161C"

# bspwm options
BORDER_WIDTH="0"     # bspwm border
NORMAL_BC="#16161C"  # normal border color
FOCUSED_BC="#b0a5ed" # focused border color

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
dunst_offset='20x30'
dunst_origin='bottom-right'
dunst_transparency='1'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='1'

# gtk theme vars
gtk_theme="Andrea-zk"
gtk_icons="Luv-Folders"
gtk_cursor="Qogirr"
geany_theme="z0mbi3-Andrea"

# wallpaper engine
# Available methods:
# - Theme (Set a random wallpaper from rice directory)
# - CustomDir (Set a random wallpaper from the directory you specified)
# - CustomImage (Sets a specific image as wallpaper)
ENGINE="Theme" # Theme | CustomDir | CustomImage
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"