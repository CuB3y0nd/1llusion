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

accent_color="$blackb"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0" # bspwm border
TOP_PADDING="42"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"
NORMAL_BC="#ced4da"  # normal border color
FOCUSED_BC="#f8f9fa" # focused border color

# Terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# Picom options
P_FADE="true"        # fade true|false
P_SHADOWS="true"     # shadows true|false
SHADOW_C="#000000"   # shadow color
P_CORNER_R="6"       # corner radius (0 = disabled)
P_BLUR="false"       # blur true|false
P_ANIMATIONS="@"     # (@ = enable) (# = disable)
P_TERM_OPACITY="1.0" # terminal transparency. range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(0, 60)'
dunst_origin='top-center'
dunst_transparency='0'
dunst_corner_radius='6'
dunst_font='Maple Mono NF Bold Italic 9'
dunst_border='0'
dunst_frame_color="$fg"
dunst_icon_theme="Vimix-White"

# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="up"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$magenta"
jg_sel_fg="$bg"
jg_sep="$blackb"

# Rofi menu font and colors
rofi_font="Terminess Nerd Font Mono Bold 10"
rofi_background="$bg"
rofi_bg_alt="$blackb"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$magenta"
rofi_active="$green"
rofi_urgent="$red"

# Screenlocker
sl_bg="${bg}"
sl_fg="${fg}"
sl_ring="${blackb}"
sl_wrong="${red}"
sl_date="${fg}"
sl_verify="${green}"

# GTK theme
gtk_theme="MonochromeBlue-zk"
gtk_icons="Vimix-White"
gtk_cursor="Qogirr-Dark"

# Wallpaper engine
# Available engines:
# - Theme (Set a random wallpaper from rice directory)
# - CustomDir (Set a random wallpaper from the directory you specified)
# - CustomImage (Sets a specific image as wallpaper)
# - CustomAnimated (Set an animated wallpaper. "mp4, mkv, gif")
# - Slideshow (Change randomly every 15 minutes your wallpaper from Walls rice directory)
ENGINE="Theme"
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall.mp4"
