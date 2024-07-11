#!/usr/bin/bash
set -euxo pipefail

echo "this is a thing" > ~/misc/tmp/wtf.txt

WALLPAPER=$(fd --base-directory ~/media/wallpapers/ --maxdepth 1 --type file | shuf -n 1)
[[ -L ~/media/wallpapers/.active/random-wallpaper.png ]] && unlink ~/media/wallpapers/.active/random-wallpaper.png
ln -s "../$WALLPAPER" ~/media/wallpapers/.active/random-wallpaper.png
