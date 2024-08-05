#!/usr/bin/env bash

# Terminate existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash

# Current Rice
read -r RICE <"$HOME"/.config/bspwm/.rice

# Vars config for Cynthia Rice
# Bspwm border		# Fade windows true|false	# Shadows true|false	# Corner radius
BORDER_WIDTH="0" P_FADE="true" P_SHADOWS="true" P_CORNER_R="6"

# (Kanagawa Dragon) colorscheme
bg="#181616" fg="#c5c9c5"

black="#0d0c0c" red="#c4746e" green="#8a9a7b" yellow="#c4b28a"
blackb="#a6a69c" redb="#E46876" greenb="#87a987" yellowb="#E6C384"

blue="#8ba4b0" magenta="#a292a3" cyan="#8ea4a2" white="#C8C093"
blueb="#7FB4CA" magentab="#938AA9" cyanb="#7AA89F" whiteb="#c5c9c5"

set_bspwm_config() {
  bspc config border_width ${BORDER_WIDTH}
  bspc config top_padding 48
  bspc config bottom_padding 48
  bspc config left_padding 2
  bspc config right_padding 2
  bspc config normal_border_color "${black}"
  bspc config active_border_color "${blue}"
  bspc config focused_border_color "${magentab}"
  bspc config presel_feedback_color "${green}"
}

set_term_config() {
  cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# Default colors
[colors.primary]
background = "${bg}"
foreground = "${fg}"

# Cursor colors
[colors.cursor]
cursor = "${green}"
text = "${bg}"

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
selection_background    ${bg}

# Cursor colors
cursor                  ${fg}
cursor_text_color       ${bg}

# URL underline color when hovering with mouse
url_color               ${blue}

# Kitty window border colors
active_border_color     ${magentab}
inactive_border_color   ${blackb}
bell_border_color       ${yellowb}

# Tab bar colors
active_tab_foreground   ${bg}
active_tab_background   ${magentab}
inactive_tab_foreground ${fg}
inactive_tab_background ${black}
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
    -e "s/shadow-color = .*/shadow-color = \"${black}\"/g" \
    -e "s/corner-radius = .*/corner-radius = ${P_CORNER_R}/g" \
    -e "s/\".*:class_g = 'Alacritty'\"/\"99:class_g = 'Alacritty'\"/g" \
    -e "s/\".*:class_g = 'kitty'\"/\"99:class_g = 'kitty'\"/g" \
    -e "s/\".*:class_g = 'FloaTerm'\"/\"99:class_g = 'FloaTerm'\"/g"
}

set_dunst_config() {
  sed -i "$HOME"/.config/bspwm/dunstrc \
    -e "s/transparency = .*/transparency = 4/g" \
    -e "s/frame_color = .*/frame_color = \"${bg}\"/g" \
    -e "s/separator_color = .*/separator_color = \"${greenb}\"/g" \
    -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
    -e "s/foreground='.*'/foreground='${magentab}'/g"

  sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
  cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "${bg}"
		foreground = "${green}"

		[urgency_normal]
		timeout = 5
		background = "${bg}"
		foreground = "${fg}"

		[urgency_critical]
		timeout = 0
		background = "${bg}"
		foreground = "${redb}"
	_EOF_
}

set_eww_colors() {
  cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
\$bg: ${bg};
\$bg-alt: #1c1a1a;
\$fg: ${fg};
\$black: ${blackb};
\$red: ${red};
\$green: ${green};
\$yellow: ${yellowb};
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
    -e "s/color_sel_bg = .*/color_sel_bg = ${green}/" \
    -e "s/color_sel_fg = .*/color_sel_fg = ${bg}/" \
    -e "s/color_sep_fg = .*/color_sep_fg = ${green}/"

  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Cynthia

* {
    font: "Terminess Nerd Font Mono Bold 10";
    background: ${bg};
    background-alt: ${bg}E0;
    foreground: ${fg};
    selected: ${blue};
    active: ${green};
    urgent: ${red};

    img-background: url("~/.config/bspwm/rices/${RICE}/rofi.webp", width);
}
EOF
}

launch_theme() {
  for mon in $(polybar --list-monitors | cut -d":" -f1); do
    (MONITOR=$mon polybar -q cyn-bar -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini) &
    (MONITOR=$mon polybar -q cyn-bar2 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini) &
  done
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
