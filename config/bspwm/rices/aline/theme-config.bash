# (Rose Pine Dawn) colorscheme
bg="#faf4ed"
fg="#575279"

black="#f2e9e1"
red="#b4637a"
green="#286983"
yellow="#ea9d34"
blue="#56949f"
magenta="#907aa9"
cyan="#d7827e"
white="#575279"
blackb="#9893a5"
redb="#b4637a"
greenb="#286983"
yellowb="#ea9d34"
blueb="#56949f"
magentab="#907aa9"
cyanb="#d7827e"
whiteb="#575279"

accent_color="$black"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0" # bspwm border
TOP_PADDING="51"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"
NORMAL_BC="#286983"  # normal border color
FOCUSED_BC="#907aa9" # focused border color

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
dunst_transparency='8'
dunst_corner_radius='6'
dunst_font='Inconsolata Semi Condensed Bold 9'
dunst_border='0'
dunst_frame_color="$white"
dunst_icon_theme="Gruvbox-Plus-Dark"

# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="right"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$black"
jg_sel_fg="$fg"
jg_sep="$magenta"

# Rofi menu font and colors
rofi_font="JetBrainsMono NF Bold 9"
rofi_background="$bg"
rofi_bg_alt="$black"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$cyan"
rofi_active="$green"
rofi_urgent="$yellow"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${black:1}"
sl_ring="${magenta:1}"
sl_wrong="${red:1}"
sl_date="${black:1}"
sl_verify="${green:1}"

# GTK theme
gtk_theme="RosePineDawn-zk"
gtk_icons="Luv-Folders"
gtk_cursor="Qogirr"

# Wallpaper engine
# Available engines:
# - Theme (Set a random wallpaper from rice directory)
# - CustomDir (Set a random wallpaper from the directory you specified)
# - CustomImage (Sets a specific image as wallpaper)
# - CustomAnimated (Set an animated wallpaper. "mp4, mkv, gif")
ENGINE="Theme" # Theme | CustomDir | CustomImage
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall.mp4"
