#!/usr/bin/env bash

# Current Rice
read -r RICE <"$HOME"/.config/bspwm/.rice

# Terminate existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash

# Bspwm border # Normal border color # Focused border color
BORDER_WIDTH="0" NORMAL_BC="#9bced7" FOCUSED_BC="#c3a5e6"
# Fade true|false # Shadows true|false # Corner radius # Shadow color # Animations true|false
P_FADE="true" P_SHADOWS="true" P_CORNER_R="6" SHADOW_C="#000000" ANIMATIONS="true"

# (Rose-Pine Moon) colorschenme
bg="#232136" fg="#e0def4"

black="#393552" red="#ea6f91" green="#9bced7" yellow="#f1ca93"
blackb="#6e6a86" redb="#ea6f91" greenb="#9bced7" yellowb="#f1ca93"

blue="#34738e" magenta="#c3a5e6" cyan="#eabbb9" white="#faebd7"
blueb="#34738e" magentab="#c3a5e6" cyanb="#ebbcba" whiteb="#e0def4"

# Gtk theme vars
gtk_theme="RosePineMoon-zk" gtk_icons="Catppuccin-Mocha" gtk_cursor="Qogirr-Dark" geany_theme="z0mbi3-RosePineMoon"

set_bspwm_config() {
  bspc config border_width ${BORDER_WIDTH}
  bspc config top_padding 1
  bspc config bottom_padding 53
  bspc config left_padding 1
  bspc config right_padding 1
  bspc config normal_border_color "${NORMAL_BC}"
  bspc config focused_border_color "${FOCUSED_BC}"
  bspc config presel_feedback_color "${magenta}"
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
selection_background    ${cyan}

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
    -e "s/separator_color = .*/separator_color = \"${red}\"/g" \
    -e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
    -e "s/foreground='.*'/foreground='${green}'/g"

  sed -i '/urgency_low/Q' "$dunst_config_file"
  cat >>"$dunst_config_file" <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "${bg}"
		foreground = "${magenta}"

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
\$bg-alt: #2a2740;
\$fg: ${fg};
\$black: ${black};
\$red: ${red};
\$green: ${green};
\$yellow: ${yellow};
\$blue: ${blue};
\$magenta: ${magenta};
\$cyan: ${cyan};
\$archicon: #0f94d2;
EOF
}

set_launchers() {
  sed -i "$HOME"/.config/bspwm/src/config/jgmenurc \
    -e "s/color_menu_bg = .*/color_menu_bg = ${bg}/" \
    -e "s/color_norm_fg = .*/color_norm_fg = ${fg}/" \
    -e "s/color_sel_bg = .*/color_sel_bg = #2a2740/" \
    -e "s/color_sel_fg = .*/color_sel_fg = ${fg}/" \
    -e "s/color_sep_fg = .*/color_sep_fg = ${black}/"

  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Cristina

* {
    font: "JetBrainsMono NF Bold 9";
    background: ${bg};
    bg-alt: #2a2740;
    background-alt: ${bg}E0;
    foreground: ${fg};
    selected: ${magenta};
    active: ${green};
    urgent: ${red};

    img-background: url("~/.config/bspwm/rices/${RICE}/rofi.webp", width);
}
EOF

  sed -i "$HOME"/.config/bspwm/src/ScreenLocker \
    -e "s/bg=.*/bg=${bg:1}/" \
    -e "s/fg=.*/fg=${magenta:1}/" \
    -e "s/ring=.*/ring=${bg:1}/" \
    -e "s/wrong=.*/wrong=${red:1}/" \
    -e "s/date=.*/date=${magenta:1}/" \
    -e "s/verify=.*/verify=${green:1}/"
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
  dunst -config "${HOME}"/.config/bspwm/src/config/dunstrc &
  sleep 0.1
  for mon in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$mon polybar -q cristina-bar -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
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
