#!/bin/bash

#---------------DON'T-------USE

real_kill() {
    local i
    while [[ $((++i)) -le 10 ]] ; do
        killall --quiet "${1}" || return 0
    done
    xmsg_quick.sh -b "okay" "polybar/launch.sh: Couldn't kill polybar" & disown
    exit 1
}

xrec_get() {
    xrdb -get "${1}"
}


launch_main() {
    local PRIMARY=''
    local OTHER=''
    local i='1'

    real_kill 'polybar'

    PRIMARY="$(xrec_get 'i3wm.primary_monitor')"

    if [[ -n "${PRIMARY}" ]] ; then
        MONITOR="${PRIMARY}" polybar --reload primarybar & disown
    fi

    while OTHER="$(xrec_get "i3wm.other_monitor_${i}")" && [[ -n "${OTHER}" ]] ; do
        MONITOR="${OTHER}" polybar --reload secondarybar & disown
        ((i++))
    done
}

launch_main "${@}"

