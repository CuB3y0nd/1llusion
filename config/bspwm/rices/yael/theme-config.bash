# (OxoCarbon) colorscheme
bg="#161616"
fg="#ffffff"

black="#262626"
red="#ee5396"
green="#42be65"
yellow="#ffe97b"
blue="#33b1ff"
magenta="#ff7eb6"
cyan="#3ddbd9"
white="#dde1e6"
blackb="#393939"
redb="#ee5396"
greenb="#42be65"
yellowb="#ffe97b"
blueb="#33b1ff"
magentab="#ff7eb6"
cyanb="#3ddbd9"
whiteb="#ffffff"

# bspwm options
BORDER_WIDTH="0"     # bspwm border
NORMAL_BC="#33b1ff"  # normal border color
FOCUSED_BC="#42be65" # focused border color

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
dunst_offset='(20, 20)'
dunst_origin='bottom-right'
dunst_transparency='0'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'

# gtk theme vars
gtk_theme="OxoCarbon-zk"
gtk_icons="Glassy"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-OxoCarbon"

# wallpaper engine
# Available engines:
# - Theme (Set a random wallpaper from rice directory)
# - CustomDir (Set a random wallpaper from the directory you specified)
# - CustomImage (Sets a specific image as wallpaper)
# - CustomAnimated (Set an animated wallpaper. "mp4, mkv, gif")
ENGINE="Theme" # Theme | CustomDir | CustomImage
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall.mp4"
