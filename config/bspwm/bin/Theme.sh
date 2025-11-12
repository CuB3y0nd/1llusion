#!/bin/sh

# Current Rice
read -r RICE <"$HOME"/.config/bspwm/.rice
# Load theme configuration
. "$HOME"/.config/bspwm/rices/"$RICE"/theme-config.bash
# Path to modules dir
MODULE_DIR="$HOME/.config/bspwm/config/modules"

# Load all the files in dir
for module in "$MODULE_DIR"/*.sh; do
  . "$module"
done
