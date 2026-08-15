#!/usr/bin/env bash

# vi: ft=bash
# shellcheck disable=SC2120
main() {
  toggle_r_rate() {
    local status
    if [[ "${1,,}" != 'on' ]] && xset q | grep -Piq 'auto(\s+)repeat[:](\s+)on'; then
      status='Off'
      xset r off
    else
      status="On"
      xset r rate 350 40
    fi
    notify-send -t 3000 "Keyboard Repeat Toggled" "${status}"
  }
  get_prop() {
    xinput list-props "${MY_MOUSE}" | grep -Pxio "[\t ]*${prop}[ \t]*\([0-9]*\)[:][ \t]*\K(.*)[ \t]*$"
  }
  set_prop() {
    local out=""
    if out="$(xinput set-prop "${@}")"; then
      notify-send -t 3000 --category="success" "$0" "${*/#/$'\n'}"
    else
      notify-send -t 3000 --category="error" "$0" "Error: ${out} ${*/#/$'\n'}"
    fi
  }
  set_mouse_sensitivity() {
    [[ "${#}" -le 0 ]] && return # no args = do nothing
    # local DEFAULT_SENS='-0.5'
    local prop='libinput Accel Speed'
    local current
    current="$(get_prop "${prop}")"
    if [[ "$(bc <<<"${current} == ${1}" 2>/dev/null)" = "1" ]] && [[ "${2}" =~ ^[-]?[0-9.]+$ ]]; then
      set_mouse_sensitivity "${2}"
    elif [[ "$(bc <<<"-1 <= ${1,,} && ${1,,} <= 1" 2>/dev/null)" = "1" ]]; then
      set_prop "${MY_MOUSE}" "${prop}" "${1,,}"
    else
      echo "Invalid number must be float between -1 and +1." >&2
      return 1
    fi
  }
  set_key_mods() {
    xmodmap -pm | grep -iq 'Mod1.*Alt_R' &&
      xmodmap -e 'remove Mod1 = Alt_R'
    xmodmap -e 'remove Mod1 = Super_R'
    xmodmap -e 'remove Mod1 = Meta_R'
    xmodmap -e 'remove Mod4 = asciitilde'
    xmodmap -e 'add Mod1 = Alt_L'
  }
  set_keyboard() {
    # set_mouse_sensitivity
    # xset -dpms
    xmodmap "$HOME/.Xmodmap" # my keybindings
    set_key_mods
    # $XMESSAGE_SCRIPT --kill
  }
  add_fonts() {
    fc-cache "${HOME}/.local/share/fonts/"
    {
      xset +fp /usr/share/fonts/misc
      xset +fp /usr/share/fonts/*
      xset +fp "${HOME}/.local/share/fonts/"*
    } 2>/dev/null
  }
  handle_args() {
    while [[ "${#}" -ge 1 ]]; do
      case "${1,,}" in
      --r | -r)
        toggle_r_rate "${@:2}"
        ;;
      --m | -m)
        set_mouse_sensitivity "${@:2}"
        ;;
      --y | -y)
        add_fonts "${@:2}"
        ;;
      --k | -k)
        set_keyboard "${@:2}"
        ;;
      --h | -h | --help )
        echo ""
        return
        ;;
      esac
      shift 1
    done
  }
  handle_args "${@}"
}

main "${@}"

