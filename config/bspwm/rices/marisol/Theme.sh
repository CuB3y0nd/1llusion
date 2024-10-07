#!/usr/bin/env bash

# Terminate existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash

# Current Rice
read -r RICE <"$HOME"/.config/bspwm/.rice

# Bspwm border # Fade true|false # Shadows true|false # Corner radius # Shadow color # Animations true|false
BORDER_WIDTH="2" P_FADE="true" P_SHADOWS="false" P_CORNER_R="0" SHADOW_C="#000000" ANIMATIONS="true"

# (Dracula) colorscheme
bg="#282a36" fg="#f8f8f2"

black="#21222c" red="#ff5555" green="#50fa7b" yellow="#f1fa8c"
blackb="#6272a4" redb="#ff6e6e" greenb="#69ff94" yellowb="#ffffa5"

blue="#bd93f9" magenta="#ff79c6" cyan="#8be9fd" white="#f8f8f2"
blueb="#d6acff" magentab="#ff92df" cyanb="#a4ffff" whiteb="#ffffff"

# Gtk theme vars
gtk_theme="Dracula-zk" gtk_icons="Dracula" gtk_cursor="Qogirr-Dark" geany_theme="z0mbi3-Dracula"

set_bspwm_config() {
  bspc config border_width ${BORDER_WIDTH}
  bspc config top_padding 44
  bspc config bottom_padding 1
  bspc config left_padding 1
  bspc config right_padding 1
  bspc config normal_border_color "${magenta}"
  bspc config active_border_color "${green}"
  bspc config focused_border_color "${blue}"
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
selection_foreground    ${bg}
selection_background    ${magenta}

# Cursor colors
cursor                  ${magenta}
cursor_text_color       ${bg}

# URL underline color when hovering with mouse
url_color               ${blue}

# Kitty window border colors
active_border_color     ${magenta}
inactive_border_color   ${blackb}
bell_border_color       ${yellow}

# Tab bar colors
active_tab_foreground   ${bg}
active_tab_background   ${magenta}
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

  pidof -q kitty && killall -USR1 kitty
}

set_picom_config() {
  picom_conf_file="$HOME/.config/bspwm/src/config/picom.conf"
  picom_rules_file="$HOME/.config/bspwm/src/config/picom-rules.conf"

  sed -i "$picom_conf_file" \
    -e "s/shadow = .*/shadow = ${P_SHADOWS};/" \
    -e "s/shadow-color = .*/shadow-color = \"${SHADOW_C}\"/" \
    -e "s/fading = .*/fading = ${P_FADE};/" \
    -e "s/corner-radius = .*/corner-radius = ${P_CORNER_R}/"

  sed -i "$picom_rules_file" \
    -e "101s/	opacity = .*/	opacity = 1;/"

  if [[ "$ANIMATIONS" = "true" ]]; then
    sed -i "$picom_rules_file" \
      -e '/picom-animations/c\@include "picom-animations.conf"'

    sed -i "$picom_conf_file" \
      -e "s/no-fading-openclose = .*/no-fading-openclose = true/"
  else
    sed -i "$picom_rules_file" \
      -e '/picom-animations/c\#@include "picom-animations.conf"'

    sed -i "$picom_conf_file" \
      -e "s/no-fading-openclose = .*/no-fading-openclose = false/"
  fi
}

set_dunst_config() {
  dunst_config_file="$HOME/.config/bspwm/src/config/dunstrc"

  sed -i "$dunst_config_file" \
    -e "s/transparency = .*/transparency = 0/g" \
    -e "s/icon_theme = .*/icon_theme = \"${gtk_icons}, Adwaita\"/g" \
    -e "s/frame_color = .*/frame_color = \"${bg}\"/g" \
    -e "s/separator_color = .*/separator_color = \"${cyanb}\"/g" \
    -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
    -e "s/foreground='.*'/foreground='${cyanb}'/g"

  sed -i '/urgency_low/Q' "$dunst_config_file"
  cat >>"$dunst_config_file" <<-_EOF_
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
\$bg-alt: #2f3240;
\$fg: ${fg};
\$black: ${black};
\$red: ${red};
\$green: ${green};
\$yellow: ${yellow};
\$blue: ${blue};
\$magenta: ${magenta};
\$cyan: ${cyanb};
\$archicon: #0f94d2;
EOF
}

set_launchers() {
  sed -i "$HOME"/.config/bspwm/src/config/jgmenurc \
    -e "s/color_menu_bg = .*/color_menu_bg = ${bg}/" \
    -e "s/color_norm_fg = .*/color_norm_fg = ${fg}/" \
    -e "s/color_sel_bg = .*/color_sel_bg = #2f3240/" \
    -e "s/color_sel_fg = .*/color_sel_fg = ${fg}/" \
    -e "s/color_sep_fg = .*/color_sep_fg = ${blue}/"

  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Marisol

* {
    font: "JetBrainsMono NF Bold 9";
    background: ${bg};
    bg-alt: #2f3240;
    background-alt: ${bg}E0;
    foreground: ${fg};
    selected: ${blue};
    active: ${green};
    urgent: ${redb};

    img-background: url("~/.config/bspwm/rices/${RICE}/rofi.webp", width);
}
EOF
}

set_appearance() {
  if pidof -q xsettingsd; then
    sed -i "$HOME"/.config/bspwm/src/config/xsettingsd \
      -e "s|Net/ThemeName .*|Net/ThemeName \"$gtk_theme\"|" \
      -e "s|Net/IconThemeName .*|Net/IconThemeName \"$gtk_icons\"|" \
      -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"$gtk_cursor\"|"
  else
    sed -i "$HOME"/.config/gtk-3.0/settings.ini \
      -e "s/gtk-theme-name=.*/gtk-theme-name=$gtk_theme/" \
      -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=$gtk_icons/" \
      -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=$gtk_cursor/"

    sed -i "$HOME"/.gtkrc-2.0 \
      -e "s/gtk-theme-name=.*/gtk-theme-name=\"$gtk_theme\"/" \
      -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$gtk_icons\"/" \
      -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"$gtk_cursor\"/"
  fi

  sed -i -e "s/Inherits=.*/Inherits=$gtk_cursor/" "$HOME"/.icons/default/index.theme

  # Reload daemon and apply gtk theme
  pidof -q xsettingsd && killall -HUP xsettingsd
  xsetroot -cursor_name left_ptr
}

launch_theme() {
  feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls
  dunst -config "${HOME}"/.config/bspwm/src/config/dunstrc &
  sleep 0.1
  for mon in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$mon polybar -q marisol -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
  done
}

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
set_eww_colors
set_launchers
set_appearance
launch_theme
