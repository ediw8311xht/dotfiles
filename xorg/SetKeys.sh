#!/usr/bin/env bash

xset +fp /usr/share/fonts/misc        2>/dev/null
xset +fp /usr/share/fonts/*           2>/dev/null
xset +fp "${HOME}/.local/share/fonts/"* 2>/dev/null
xset -dpms
xset s off
xset r rate 200 40
#xset r off
##### This turns off mouse acceleration
##### xinput --set-prop 12   "libinput Accel Speed" -1
##### Increases mouse speed, neccesary to adjust this value if you do not want mouse acceleration.
##### xinput --set-prop 12   "Coordinate Transformation Matrix" 1, 0, 0, 0, 1, 0, 0, 0, 0.44
#xmodmap -e  "keycode 49  = 0x0000 0xffeb 0x0000 0xffeb"
#xmodmap -e  "keycode 108 = 0x007e 0x0060 0x007e 0x0060"
#xmodmap -e  "keycode 133 = 0x007e 0x0060 0x007e 0x0060"
xmodmap     "$HOME/.Xmodmap"
xmodmap -e 'remove Mod1 = Alt_R'
xmodmap -e 'remove Mod1 = Super_R'
xmodmap -e 'remove Mod1 = Meta_R'
xmodmap -e 'remove Mod4 = asciitilde'
xmodmap -e 'add Mod1 = Alt_L'
