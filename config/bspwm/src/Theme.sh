#!/usr/bin/env bash

read -r RICE <"$HOME"/.config/bspwm/.rice

. "$HOME"/.config/bspwm/src/Process.bash
. "$HOME"/.config/bspwm/rices/"$RICE"/theme-config.bash
. "$HOME"/.config/bspwm/src/WallEngine.bash

set_bspwm_config() {
  bspc config border_width ${BORDER_WIDTH}
  bspc config top_padding ${TOP_PADDING}
  bspc config bottom_padding ${BOTTOM_PADDING}
  bspc config left_padding ${LEFT_PADDING}
  bspc config right_padding ${RIGHT_PADDING}
  bspc config normal_border_color "${NORMAL_BC}"
  bspc config focused_border_color "${FOCUSED_BC}"
  bspc config presel_feedback_color "${blue}"
}

set_term_config() {
  # Alacritty
  sed -i "$HOME"/.config/alacritty/fonts.toml \
    -e "s/size = .*/size = $term_font_size/" \
    -e "s/family = .*/family = \"$term_font_name\"/"

  cat >"$HOME"/.config/alacritty/rice-colors.toml <<-EOF
		# Default colors
		[colors.primary]
		background = "${bg}"
		foreground = "${fg}"

		# Cursor colors
		[colors.cursor]
		cursor = "${fg}"
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

  # Kitty
  kitten themes --reload-in=all ${RICE}
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
    -e "/#-dunst-close-preset/s/.*#-/\t\t\tpreset = \"${dunst_close_preset}\";\t#-/" \
    -e "/#-dunst-close-direction/s/.*#-/\t\t\tdirection = \"${dunst_close_direction}\";\t#-/" \
    -e "/#-dunst-open-preset/s/.*#-/\t\t\tpreset = \"${dunst_open_preset}\";\t#-/" \
    -e "/#-dunst-open-direction/s/.*#-/\t\t\tdirection = \"${dunst_open_direction}\";\t#-/"
}

set_dunst_config() {
  dunst_config_file="$HOME/.config/bspwm/src/config/dunstrc"

  sed -i "$dunst_config_file" \
    -e "s/origin = .*/origin = ${dunst_origin}/" \
    -e "s/offset = .*/offset = ${dunst_offset}/" \
    -e "s/transparency = .*/transparency = ${dunst_transparency}/" \
    -e "s/^corner_radius = .*/corner_radius = ${dunst_corner_radius}/" \
    -e "s/frame_width = .*/frame_width = ${dunst_border}/" \
    -e "s/frame_color = .*/frame_color = \"${dunst_frame_color}\"/" \
    -e "s/font = .*/font = ${dunst_font}/" \
    -e "s/foreground='.*'/foreground='${blue}'/" \
    -e "s/icon_theme = .*/icon_theme = \"${dunst_icon_theme}, Adwaita\"/"

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
		foreground = "${red}"
	_EOF_

  dunstctl reload "$dunst_config_file"
}

set_eww_colors() {
  cat >"$HOME"/.config/bspwm/eww/colors.scss <<-EOF
		\$bg: ${bg};
		\$bg-alt: ${accent_color};
		\$fg: ${fg};
		\$black: ${blackb};
		\$red: ${red};
		\$green: ${green};
		\$yellow: ${yellow};
		\$blue: ${blue};
		\$magenta: ${magenta};
		\$cyan: ${cyan};
		\$archicon: ${arch_icon};
	EOF
}

set_launchers() {
  # Jgmenu
  sed -i "$HOME"/.config/bspwm/src/config/jgmenurc \
    -e "s/color_menu_bg = .*/color_menu_bg = ${jg_bg}/" \
    -e "s/color_norm_fg = .*/color_norm_fg = ${jg_fg}/" \
    -e "s/color_sel_bg = .*/color_sel_bg = ${jg_sel_bg}/" \
    -e "s/color_sel_fg = .*/color_sel_fg = ${jg_sel_fg}/" \
    -e "s/color_sep_fg = .*/color_sep_fg = ${jg_sep}/"

  # Rofi launchers
  cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<-EOF
		* {
		    font: "${rofi_font}";
		    background: ${rofi_background};
		    bg-alt: ${rofi_bg_alt};
		    background-alt: ${rofi_background_alt};
		    foreground: ${rofi_fg};
		    selected: ${rofi_selected};
		    active: ${rofi_active};
		    urgent: ${rofi_urgent};

		    img-background: url("~/.config/bspwm/rices/${RICE}/rofi.webp", width);
		}
	EOF

  # Screenlock colors
  sed -i "$HOME"/.config/bspwm/src/ScreenLocker \
    -e "s/bg=.*/bg=${sl_bg}/" \
    -e "s/fg=.*/fg=${sl_fg}/" \
    -e "s/ring=.*/ring=${sl_ring}/" \
    -e "s/wrong=.*/wrong=${sl_wrong}/" \
    -e "s/date=.*/date=${sl_date}/" \
    -e "s/verify=.*/verify=${sl_verify}/"
}

set_appearance() {
  # Set the gtk theme corresponding to rice
  sed -i "$HOME"/.config/bspwm/src/config/xsettingsd \
    -e "s|Net/ThemeName .*|Net/ThemeName \"$gtk_theme\"|" \
    -e "s|Net/IconThemeName .*|Net/IconThemeName \"$gtk_icons\"|" \
    -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"$gtk_cursor\"|"

  sed -i -e "s/Inherits=.*/Inherits=$gtk_cursor/" "$HOME"/.icons/default/index.theme

  # Reload daemon and apply gtk theme
  pkill -1 xsettingsd
  xsetroot -cursor_name left_ptr
}

launch_theme() {
  . "$HOME"/.config/bspwm/rices/"$RICE"/Bar.bash
}

set_bspwm_config
set_term_config
set_picom_config
set_appearance
set_dunst_config
set_eww_colors
set_launchers
launch_theme