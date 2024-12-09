# (Hack The box) colorscheme
bg="#0c1018"
fg="#1947e0"

black="#4A9801"
red="#6DDE00"
green="#00fa5c"
yellow="#76EA00"
blue="#578a29"
magenta="#9cf542"
cyan="#539e06"
white="#00ff59"
blackb="#03198a"
redb="#0800ff"
greenb="#4145b0"
yellowb="#025dd4"
blueb="#7eb3f7"
magentab="#220991"
cyanb="#3a11f0"
whiteb="#3b5eed"

# bspwm options
BORDER_WIDTH="0"     # bspwm border
NORMAL_BC="#4A9801"  # normal border color
FOCUSED_BC="#76EA00" # focused border color

# terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# picom options
P_FADE="false"       # fade true|false
P_SHADOWS="false"    # shadows true|false
SHADOW_C="#000000"   # shadow color
P_CORNER_R="0"       # corner radius (0 = disabled)
P_BLUR="false"       # blur true|false
P_ANIMATIONS="#"     # (@ = enable) (# = disable)
P_TERM_OPACITY="1.0" # terminal transparency. range: 0.1 - 1.0 (1.0 = disabled)

# dunst
dunst_offset='(0, 60)'
dunst_origin='top-center'
dunst_transparency='0'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='2'

# gtk theme vars
gtk_theme="h4ck3r-zk"
gtk_icons="Hack"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-HackTheBox"

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
