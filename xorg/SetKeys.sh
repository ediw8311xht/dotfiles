#!/usr/bin/env bash

# vi: ft=bash

toggle_r_rate() {
        if xset q | grep -q -Pi 'auto[ ]*repeat[:][ ]*on' ; then
            xset r off
            notify-send -t 3000 $'Keyboard Repeat: \nOff'
        else
            xset r rate 250 55
            notify-send -t 3000 $'Keyboard Repeat: \nOn'
        fi
}

main() {
    if [[ "${1,,}" = "-r" ]] ; then
        toggle_r_rate "${@:2}"
    else
        if [[ ! "${1,,}" = '--y' ]] ; then
            xset +fp /usr/share/fonts/misc        2>/dev/null
            xset +fp /usr/share/fonts/*           2>/dev/null
            xset +fp "${HOME}/.local/share/fonts/"* 2>/dev/null
            xset -dpms
            xset s off
            xset r rate 250 55
        fi
        #xset r off
        ##### This turns off mouse acceleration
        ##### xinput --set-prop 12   "libinput Accel Speed" -1
        ##### Increases mouse speed, neccesary to adjust this value if you do not want mouse acceleration.
        ##### xinput --set-prop 12   "Coordinate Transformation Matrix" 1, 0, 0, 0, 1, 0, 0, 0, 0.44
        #xmodmap -e  "keycode 49  = 0x0000 0xffeb 0x0000 0xffeb"
        #xmodmap -e  "keycode 108 = 0x007e 0x0060 0x007e 0x0060"
        #xmodmap -e  "keycode 133 = 0x007e 0x0060 0x007e 0x0060"
        #check_mod_map() {
        #    local a=(
        #        'Mod1 Alt_R'
        #        'Mod1 Meta_R'
        #        'Mod4 asciitilde'
        #    )
        #    for i in "${a[@]}"  ; do
        #        if xmodmap -pm | grep -qF "${i}" ; then
        #            xmodmap -e 'remove Mod1 = Alt_R'
        #        fi
        #    done
        #}
        xmodmap     "$HOME/.Xmodmap"

        if xmodmap -pm | grep -iq 'Mod1.*Alt_R' ; then
            xmodmap -e 'remove Mod1 = Alt_R'
        fi

        xmodmap -e 'remove Mod1 = Super_R'
        xmodmap -e 'remove Mod1 = Meta_R'
        xmodmap -e 'remove Mod4 = asciitilde'
        xmodmap -e 'add Mod1 = Alt_L'
    fi
}

main "${@}"
