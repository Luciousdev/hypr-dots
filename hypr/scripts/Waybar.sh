#!/bin/bash

CONFIG="$HOME/.config/hypr/waybar/config"
CONFIGTOP="$HOME/.config/hypr/waybar/configtop"
STYLE="$HOME/.config/hypr/waybar/style.css"
STYLETOP="$HOME/.config/hypr/waybar/style.css"

if [[ ! $(pidof waybar) ]]; then
	waybar --bar main-bar --log-level error --config ${CONFIG} --style ${STYLE}
	waybar --bar main-bar --log-level error --config ${CONFIGTOP} --style ${STYLETOP}
fi