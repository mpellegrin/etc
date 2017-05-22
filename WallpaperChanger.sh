#!/bin/bash
#
# WallpaperChanger.sh
# Copyright 2014 Michele Bonazza michele@michelebonazza.com
#
# A simple script to automatically change your wallpaper in Gnome.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

WALLPAPERS_FOLDER=/path/to/images
WALLPAPERS=`ls $WALLPAPERS_FOLDER/*.png`
REFRESH_INTERVAL=$((60 * 60)) # change every 60 minutes
MODE="zoom" # one between none, centered, wallpaper, scaled, stretched, zoom, spanned

function change_wallpaper() {
  gsettings set org.gnome.desktop.background picture-uri file://$1
  gsettings set org.gnome.desktop.background picture-options $MODE
}

cd $WALLPAPERS_FOLDER

while true; do
  for NEXT_WP in $WALLPAPERS; do
    echo "changing background to $NEXT_WP"
    change_wallpaper $NEXT_WP
    sleep $REFRESH_INTERVAL
  done
done
