#!/usr/bin/env bash

# current rice
read -r RICE <"$HOME"/.config/bspwm/.rice

# load sources
. "${HOME}"/.config/bspwm/src/Process.bash
. "${HOME}"/.config/bspwm/rices/${RICE}/theme-config.bash
. "${HOME}"/.config/bspwm/src/WallEngine.bash

set_bspwm_config() {
  bspc config border_width ${BORDER_WIDTH}
  bspc config top_padding 44
  bspc config bottom_padding 1
  bspc config left_padding 1
  bspc config right_padding 1
  bspc config normal_border_color "${NORMAL_BC}"
  bspc config focused_border_color "${FOCUSED_BC}"
  bspc config presel_feedback_color "${blue}"
}

set_term_config() {
  sed -i "$HOME"/.config/alacritty/fonts.toml \
    -e "s/size = .*/size = $term_font_size/" \
    -e "s/family = .*/family = \"$term_font_name\"/"

  cat >"$HOME"/.config/alacritty/rice-colors.toml <<-EOF
		# default colors
		[colors.primary]
		background = "${bg}"
		foreground = "${fg}"

		# cursor colors
		[colors.cursor]
		cursor = "${magenta}"
		text = "${bg}"

		# normal colors
		[colors.normal]
		black = "${black}"
		red = "${red}"
		green = "${green}"
		yellow = "${yellow}"
		blue = "${blue}"
		magenta = "${magenta}"
		cyan = "${cyan}"
		white = "${white}"

		# bright colors
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

  cat >"$HOME"/.config/kitty/current-theme.conf <<-EOF
		# basic colors
		foreground              ${fg}
		background              ${bg}
		selection_foreground    ${bg}
		selection_background    ${magenta}

		# cursor colors
		cursor                  ${magenta}
		cursor_text_color       ${bg}

		# url underline color when hovering with mouse
		url_color               ${blue}

		# kitty window border colors
		active_border_color     ${magenta}
		inactive_border_color   ${blackb}
		bell_border_color       ${yellow}

		# tab bar colors
		active_tab_foreground   ${bg}
		active_tab_background   ${magenta}
		inactive_tab_foreground ${fg}
		inactive_tab_background ${black}
		tab_bar_background      ${bg}

		# the 16 terminal colors

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
  picom_animations_file="$HOME/.config/bspwm/src/config/picom-animations.conf"

  sed -i "$picom_conf_file" \
    -e "s/shadow-color = .*/shadow-color = \"${SHADOW_C}\"/" \
    -e "s/^corner-radius = .*/corner-radius = ${P_CORNER_R}/" \
    -e "/#-term-opacity-switch/s/.*#-/\t\topacity = $P_TERM_OPACITY;\t#-/" \
    -e "/#-shadow-switch/s/.*#-/\t\tshadow = ${P_SHADOWS};\t#-/" \
    -e "/#-fade-switch/s/.*#-/\t\tfade = ${P_FADE};\t#-/" \
    -e "/#-blur-switch/s/.*#-/\t\tblur-background = ${P_BLUR};\t#-/" \
    -e "/picom-animations/c\\${P_ANIMATIONS}include \"picom-animations.conf\""

  sed -i "$picom_animations_file" \
    -e "/#-dunst-close-preset/s/.*#-/\t\tpreset = \"fly-out\";\t#-/" \
    -e "/#-dunst-close-direction/s/.*#-/\t\tdirection = \"right\";\t#-/" \
    -e "/#-dunst-open-preset/s/.*#-/\t\tpreset = \"fly-in\";\t#-/" \
    -e "/#-dunst-open-direction/s/.*#-/\t\tdirection = \"right\";\t#-/"
}

set_dunst_config() {
  dunst_config_file="$HOME/.config/bspwm/src/config/dunstrc"

  sed -i "$dunst_config_file" \
    -e "s/origin = .*/origin = ${dunst_origin}/" \
    -e "s/offset = .*/offset = ${dunst_offset}/" \
    -e "s/transparency = .*/transparency = ${dunst_transparency}/" \
    -e "s/^corner_radius = .*/corner_radius = ${dunst_corner_radius}/" \
    -e "s/frame_width = .*/frame_width = ${dunst_border}/" \
    -e "s/frame_color = .*/frame_color = \"${blue}\"/" \
    -e "s/font = .*/font = ${dunst_font}/" \
    -e "s/foreground='.*'/foreground='${cyanb}'/" \
    -e "s/icon_theme = .*/icon_theme = \"${gtk_icons}, Adwaita\"/"

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

  dunstctl reload "$dunst_config_file"
}

set_eww_colors() {
  cat >"$HOME"/.config/bspwm/eww/colors.scss <<-EOF
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

  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<-EOF
		// rofi colors for marisol

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

  sed -i "$HOME"/.config/bspwm/src/ScreenLocker \
    -e "s/bg=.*/bg=${bg:1}/" \
    -e "s/fg=.*/fg=${fg:1}/" \
    -e "s/ring=.*/ring=${blue:1}/" \
    -e "s/wrong=.*/wrong=${red:1}/" \
    -e "s/date=.*/date=${fg:1}/" \
    -e "s/verify=.*/verify=${green:1}/"
}

set_appearance() {
  # set the gtk theme corresponding to rice
  sed -i "$HOME"/.config/bspwm/src/config/xsettingsd \
    -e "s|Net/ThemeName .*|Net/ThemeName \"$gtk_theme\"|" \
    -e "s|Net/IconThemeName .*|Net/IconThemeName \"$gtk_icons\"|" \
    -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"$gtk_cursor\"|"

  sed -i -e "s/Inherits=.*/Inherits=$gtk_cursor/" "$HOME"/.icons/default/index.theme

  # reload daemon and apply gtk theme
  pkill -1 xsettingsd
  xsetroot -cursor_name left_ptr
}

launch_theme() {
  for mon in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$mon polybar -q marisol -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
  done
}

set_bspwm_config
set_term_config
set_picom_config
set_appearance
set_dunst_config
set_eww_colors
set_launchers
launch_theme
