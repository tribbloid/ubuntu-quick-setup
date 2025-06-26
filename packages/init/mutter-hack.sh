#!/bin/bash

sleep 10

pkill -HUP mutter-x11-fram

/usr/bin/gnome-extensions disable ubuntu-appindicators@ubuntu.com
/usr/bin/gnome-extensions enable ubuntu-appindicators@ubuntu.com

flatpak update