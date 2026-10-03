#!/bin/bash

wallpaper_dir=/home/zly/Pictures/wallpapers/
rofi_theme=/home/zly/.config/rofi/config-wallpaper.rasi

wallpaper_path=$(find $wallpaper_dir -maxdepth 1 -type f -iregex ".*\.\(jpg\|png\)$")
menu(){
	for file in $wallpaper_path;do
		pic_name=$(basename "$file")
		printf "%s\x00icon\x1f%s\n" "$pic_name" "$file"
	done
}

choice=$(menu|rofi -show -dmenu -show-icons -config "/home/zly/.config/rofi/config-wallpaper.rasi")

if [[ -z "$choice" ]]; then
	echo "none selected"
	exit 0
fi

wal -i "$wallpaper_dir$choice" 
rm $HOME/.config/swaylock/wall.png
ln -s -T "$wallpaper_dir$choice" $HOME/.config/swaylock/wall.png
awww img "$wallpaper_dir$choice"
if [[ "$XDG_SESSION_DESKTOP" == "niri" ]]; then
	awww img "$wallpaper_dir$choice" --namespace backdrop
fi
fcitx5 -r



