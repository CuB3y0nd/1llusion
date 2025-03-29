# (Catppuccin Mocha) colorscheme
bg="#181825"
fg="#CDD6F4"

black="#45475A"
red="#F38BA8"
green="#A6E3A1"
yellow="#F9E2AF"
blue="#89B4FA"
magenta="#F5C2E7"
cyan="#94E2D5"
white="#BAC2DE"
blackb="#585B70"
redb="#F38BA8"
greenb="#A6E3A1"
yellowb="#F9E2AF"
blueb="#89B4FA"
magentab="#F5C2E7"
cyanb="#94E2D5"
whiteb="#A6ADC8"

accent_color="#1e1e2e"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0" # bspwm border
TOP_PADDING="46"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"
NORMAL_BC="#45475A"  # normal border color
FOCUSED_BC="#94E2D5" # focused border color

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
dunst_offset='(20, 60)'
dunst_origin='top-right'
dunst_transparency='0'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'
dunst_frame_color="$whiteb"
dunst_icon_theme="Catppuccin-Mocha"

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
jg_sep="$black"

# Rofi menu font and colors
rofi_font="JetBrainsMono NF Bold 9"
rofi_background="$bg"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$magenta"
rofi_active="$green"
rofi_urgent="$red"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${fg:1}"
sl_ring="${magenta:1}"
sl_wrong="${red:1}"
sl_date="${fg:1}"
sl_verify="${green:1}"

# GTK theme
gtk_theme="CatppuccinMocha-zk"
gtk_icons="Catppuccin-Mocha"
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
