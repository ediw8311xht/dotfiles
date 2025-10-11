#!/usr/bin/env bash

# vi: ft=bash
# shellcheck disable=SC2120

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
set_prop() {
    local out=""
    if out="$(xinput set-prop "${@}")" ; then
        notify-send -t 3000 --category="success" "$0" "${*/#/$'\n'}"
    else
        notify-send -t 3000 --category="error" "$0" "Error: ${out} ${*/#/$'\n'}"
    fi

}

set_mouse_sensitivity() {
    # local DEFAULT_SENS='-0.5'
    local prop='libinput Accel Speed'
    local vs
    local current
    current="$(get_prop "${prop}")"
    if  [[ "${#}" -le 0 ]] ; then
        return
    elif  [[ "$(bc <<< "${current} == ${1}" 2>/dev/null)" = "1" ]] && [[ "${2}" =~ ^[-]?[0-9.]+$ ]] ; then
        set_mouse_sensitivity "${2}"
        return
    elif [[ "$(bc <<< "-1 <= ${1,,} && ${1,,} <= 1" 2>/dev/null)" = "1" ]] ; then 
        vs="${1,,}"
    else 
        echo "Invalid number must be float between -1 and +1." >&2
        return 1
    fi
    # echo "${vs}"

    set_prop "${MY_MOUSE}" "${prop}" "${vs}"
}

keyboard_set() {
    #set_mouse_sensitivity
    # xset -dpms
    xmodmap     "$HOME/.Xmodmap"

    if xmodmap -pm | grep -iq 'Mod1.*Alt_R' ; then
        xmodmap -e 'remove Mod1 = Alt_R'
    fi

    xmodmap -e 'remove Mod1 = Super_R'
    xmodmap -e 'remove Mod1 = Meta_R'
    xmodmap -e 'remove Mod4 = asciitilde'
    xmodmap -e 'add Mod1 = Alt_L'
}

add_fonts() {
    fc-cache "${HOME}/.local/share/fonts/"
    xset +fp /usr/share/fonts/misc          2>/dev/null
    xset +fp /usr/share/fonts/*             2>/dev/null
    xset +fp "${HOME}/.local/share/fonts/"* 2>/dev/null
}
main() {
    while [[ "${#}" -ge 1 ]] ; do
        case "${1,,}" in
             --r|-r) toggle_r_rate "${@:2}"
         ;;  --m|-m) set_mouse_sensitivity "${@:2}"
         ;;  --y|-y) add_fonts "${@:2}"
         ;;  --k|-k) keyboard_set "${@:2}"
         ;; esac ; shift 1
        
    done
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
