# Colorscheme
bg="#f5eee6"
fg="#151515"

black="#5c595e"
red="#DA103F"
green="#1EB980"
yellow="#ffc338"
blue="#67d4f1"
magenta="#b0a5ed"
cyan="#2eccca"
white="#e1e2e7"
blackb="#5c595e"
redb="#F43E5C"
greenb="#07DA8C"
yellowb="#ffcc57"
blueb="#3FC6DE"
magentab="#F075B7"
cyanb="#1EAEAE"
whiteb="#e1e2e7"

accent_color="#e5ded6"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0" # bspwm border
TOP_PADDING="69"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"
NORMAL_BC="#16161C"  # normal border color
FOCUSED_BC="#b0a5ed" # focused border color

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
dunst_offset='(20, 30)'
dunst_origin='bottom-right'
dunst_transparency='1'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='1'
dunst_frame_color="$whiteb"
dunst_icon_theme="Gruvbox-Plus-Dark"

# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="down"
dunst_open_preset="fly-in"
dunst_open_direction="down"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$white"
jg_sel_fg="$black"
jg_sep="$whiteb"

# Rofi menu font and colors
rofi_font="JetBrainsMono NF Bold 9"
rofi_background="$bg"
rofi_bg_alt="$blackb"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$blue"
rofi_active="$greenb"
rofi_urgent="$redb"

# Screenlocker
sl_bg="${fg}"
sl_fg="${fg}"
sl_ring="${cyan}"
sl_wrong="${red}"
sl_date="${fg}"
sl_verify="${magenta}"

# GTK theme
gtk_theme="Andrea-zk"
gtk_icons="Luv-Folders"
gtk_cursor="Qogirr"

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
