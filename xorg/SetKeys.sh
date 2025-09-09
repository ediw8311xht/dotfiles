#!/usr/bin/env bash

# shellcheck disable=SC2120
# vi: ft=bash

toggle_r_rate() {
    local status='On'
    if [[ "${1,,}" != 'on' ]] &&
       { xset q | grep -q -Pi 'auto[ ]*repeat[:][ ]*on'; }
    then xset r off; status='Off'
    else xset r rate 350 40
    fi
    notify-send -t 3000 "Keyboard Repeat Toggled" "${status}"
}

get_prop() {
    xinput list-props "${MY_MOUSE}" | grep -Pxio "[\t ]*${prop}[ \t]*\([0-9]*\)[:][ \t]*\K(.*)[ \t]*$"
}

set_mouse_sensitivity() {
    local prop='libinput Accel Speed'
    local vs
    local current
    current="$(get_prop "${prop}")"
    if  [[ "${#}" -le 0 ]] ; then
        return
    elif  [[ "$(bc <<< "${current} == ${1}" 2>/dev/null)" = "1" ]]; then
        set_mouse_sensitivity "${@:2}"
        return
    elif [[ "$(bc <<< "-1 <= ${1,,} && ${1,,} <= 1" 2>/dev/null)" = "1" ]] ; then 
        vs="${1,,}"
    else 
        echo "Invalid number must be float between -1 and +1." >&2
        return 1
    fi
    # echo "${vs}"

    xinput set-prop "${MY_MOUSE}" "${prop}" "${vs}"
}

main() {
    if [[ "${1,,}" = "-r" ]] ; then
        toggle_r_rate "${@:2}"
    elif [[ "${1,,}" = "-m" ]] ; then
        set_mouse_sensitivity "${@:2}"
    else
        if [[ ! "${1,,}" = '--y' ]] ; then
            xset +fp /usr/share/fonts/misc          2>/dev/null
            xset +fp /usr/share/fonts/*             2>/dev/null
            xset +fp "${HOME}/.local/share/fonts/"* 2>/dev/null
        fi
        #set_mouse_sensitivity
        xset -dpms
        toggle_r_rate "on"
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
