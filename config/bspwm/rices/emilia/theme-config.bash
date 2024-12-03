# (Tokyo Night) colorscheme
bg="#1a1b26"
fg="#c0caf5"

black="#15161e"
red="#f7768e"
green="#9ece6a"
yellow="#e0af68"
blue="#7aa2f7"
magenta="#bb9af7"
cyan="#7dcfff"
white="#a9b1d6"
blackb="#414868"
redb="#f7768e"
greenb="#9ece6a"
yellowb="#e0af68"
blueb="#7aa2f7"
magentab="#bb9af7"
cyanb="#7dcfff"
whiteb="#c0caf5"

# bspwm options
BORDER_WIDTH="0"     # bspwm border
NORMAL_BC="#414868"  # normal border color
FOCUSED_BC="#bb9af7" # focused border color

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
dunst_offset='20x60'
dunst_origin='top-right'
dunst_transparency='0'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'

# gtk theme vars
gtk_theme="TokyoNight-zk"
gtk_icons="TokyoNight-SE"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-TokyoNight"

# wallpaper engine
# Available methods:
# - Theme (Set a random wallpaper from rice directory)
# - CustomDir (Set a random wallpaper from the directory you specified)
# - CustomImage (Sets a specific image as wallpaper)
ENGINE="Theme" # Theme | CustomDir | CustomImage
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
