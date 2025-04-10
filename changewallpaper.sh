#!/bin/bash

userName=$1
userId=$2
pictureFolder=$3

newPicture="file://$pictureFolder/$(ls $pictureFolder | shuf -n 1)"

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <USERNAME> <USER_ID> <IMAGE_PATH>"
    exit 1
fi

export DISPLAY=:0
export XAUTHORITY=/home/$userName/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$userId/bus

gsettings set org.gnome.desktop.background picture-uri "$newPicture"
gsettings set org.gnome.desktop.background picture-uri-dark "$newPicture"
