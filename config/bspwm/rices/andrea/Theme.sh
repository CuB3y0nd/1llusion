#!/usr/bin/env bash

# Terminate existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash

# Current Rice
read -r RICE <"$HOME"/.config/bspwm/.rice

# Vars config for Andrea Rice
# Bspwm border		# Fade windows true|false	# Shadows true|false	# Corner radius
BORDER_WIDTH="0" P_FADE="true" P_SHADOWS="true" P_CORNER_R="6"

# Colorscheme
bg="#FDF0ED" fg="#151515"

black="#151515" red="#DA103F" green="#1EB980" yellow="#FFCC57"
blackb="#F0E9E2" redb="#F43E5C" greenb="#07DA8C" yellowb="#F77D26"

blue="#67d4f1" magenta="#b0a5ed" cyan="#2eccca" white="#ededed"
blueb="#3FC6DE" magentab="#F075B7" cyanb="#1EAEAE" whiteb="#16161C"

set_bspwm_config() {
  bspc config border_width ${BORDER_WIDTH}
  bspc config top_padding 70
  bspc config bottom_padding 2
  bspc config left_padding 2
  bspc config right_padding 2
  bspc config normal_border_color "${whiteb}"
  bspc config active_border_color "${black}"
  bspc config focused_border_color "${magenta}"
  bspc config presel_feedback_color "${blue}"
}

set_term_config() {
  cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# Default colors
[colors.primary]
background = "${bg}"
foreground = "${fg}"

# Cursor colors
[colors.cursor]
cursor = "${magenta}"
text = "${white}"

# Normal colors
[colors.normal]
black = "${black}"
red = "${red}"
green = "${green}"
yellow = "${yellow}"
blue = "${blue}"
magenta = "${magenta}"
cyan = "${cyan}"
white = "${white}"

# Bright colors
[colors.bright]
black = "${blackb}"
red = "${redb}"
green = "${greenb}"
yellow = "${yellowb}"
blue = "${blueb}"
magenta = "${magentab}"
cyan = "${cyanb}"
white = "${whiteb}"
EOF

  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
# The basic colors
foreground              ${fg}
background              ${bg}
selection_foreground    ${fg}
selection_background    ${green}

# Cursor colors
cursor                  ${redb}
cursor_text_color       ${bg}

# URL underline color when hovering with mouse
url_color               ${blue}

# Kitty window border colors
active_border_color     ${magenta}
inactive_border_color   ${whiteb}
bell_border_color       ${yellow}

# Tab bar colors
active_tab_foreground   ${bg}
active_tab_background   ${magenta}
inactive_tab_foreground ${fg}
inactive_tab_background ${blue}
tab_bar_background      ${bg}

# The 16 terminal colors

# black
color0 ${black}
color8 ${blackb}

# red
color1 ${red}
color9 ${redb}

# green
color2  ${green}
color10 ${greenb}

# yellow
color3  ${yellow}
color11 ${yellowb}

# blue
color4  ${blue}
color12 ${blueb}

# magenta
color5  ${magenta}
color13 ${magentab}

# cyan
color6  ${cyan}
color14 ${cyanb}

# white
color7  ${white}
color15 ${whiteb}
EOF

  pidof -x kitty && killall -USR1 kitty
}

set_picom_config() {
  sed -i "$HOME"/.config/bspwm/picom.conf \
    -e "s/normal = .*/normal =  { fade = ${P_FADE}; shadow = ${P_SHADOWS}; }/g" \
    -e "s/dock = .*/dock = { fade = ${P_FADE}; }/g" \
    -e "s/shadow-color = .*/shadow-color = \"${black}\"/g" \
    -e "s/corner-radius = .*/corner-radius = ${P_CORNER_R}/g" \
    -e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
    -e "s/\".*:class_g = 'kitty'\"/\"100:class_g = 'kitty'\"/g" \
    -e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

set_dunst_config() {
  sed -i "$HOME"/.config/bspwm/dunstrc \
    -e "s/transparency = .*/transparency = 1/g" \
    -e "s/frame_color = .*/frame_color = \"${bg}\"/g" \
    -e "s/separator_color = .*/separator_color = \"${blue}\"/g" \
    -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
    -e "s/foreground='.*'/foreground='${magenta}'/g"

  sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
  cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "${bg}"
		foreground = "${greenb}"

		[urgency_normal]
		timeout = 5
		background = "${bg}"
		foreground = "${fg}"

		[urgency_critical]
		timeout = 0
		background = "${bg}"
		foreground = "${red}"
	_EOF_
}

set_eww_colors() {
  cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
\$bg: ${bg};
\$bg-alt: ${blackb};
\$fg: ${fg};
\$black: ${whiteb};
\$red: ${red};
\$green: ${greenb};
\$yellow: ${yellow};
\$blue: ${blue};
\$magenta: ${magenta};
\$cyan: ${cyan};
\$archicon: #0f94d2;
EOF
}

set_launchers() {
  sed -i "$HOME"/.config/bspwm/jgmenurc \
    -e "s/color_menu_bg = .*/color_menu_bg = ${bg}/" \
    -e "s/color_norm_fg = .*/color_norm_fg = ${fg}/" \
    -e "s/color_sel_bg = .*/color_sel_bg = ${blackb}/" \
    -e "s/color_sel_fg = .*/color_sel_fg = ${fg}/" \
    -e "s/color_sep_fg = .*/color_sep_fg = ${whiteb}/"

  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Andrea

* {
    font: "JetBrainsMono NF Bold 9";
    background: ${bg};
    background-alt: ${bg}E0;
    foreground: ${fg};
    selected: ${blue};
    active: ${greenb};
    urgent: ${redb};

    img-background: url("~/.config/bspwm/rices/${RICE}/rofi.webp", width);
}
EOF
}

launch_theme() {
  eww -c "${HOME}"/.config/bspwm/rices/"${RICE}"/andy open --toggle bar
  feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls
  dunst -config "${HOME}"/.config/bspwm/dunstrc &
}

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
launch_theme
set_eww_colors
set_launchers
