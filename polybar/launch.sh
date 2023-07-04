#!/bin/bash

#---------------DON'T-------USE
function handle_args() {
    while [[ -n "${1}" ]] ; do
        [[ "${1}" =~ -c=.* ]]           \
            && insert_config="${1}"     \
            || MONS+=("$(monitor_getter "${1}")")
        shift 1
    done
}
#---------------DON'T-------USE

function real_kill() {
    local i
    while [[ $((++i)) -le 10 ]] ; do
        killall --quiet "${1}" || break
    done
}

function monitor_getter() {
    START='^[ \t]*[0-9]+[:][ \t]*[+]'
    MIDDLE='.*[ ]\K'
    END='[^ \t]+(?=[ \t]*)$'
    if   [[ "${1,,}" =  'primary'   ]] ; then MIDDLE='[*].*[ ]\K'
    elif [[ "${1,,}" =  'secondary' ]] ; then MIDDLE='[^*].*[ ]\K'
    elif [[ "${1,,}" != 'all'       ]] ; then END='[^ \t]*('"${*}"')[^ \t]*'
    fi
    grep -PZo "${START}${MIDDLE}${END}" <<< "$(xrandr --listmonitors)"
}


function launch_main() {
    mapfile -t MONS < <(monitor_getter "${@:-all}")
    insert_config=''

    real_kill 'polybar'
    #handle_args "${@}"

    for item in "${MONS[@]}"
    do
        if [[ -f "${insert_config}" ]] ; then
            MONITOR="${item}" polybar "${insert_config}" --reload basicbar & disown
        else
            MONITOR="${item}" polybar --reload basicbar & disown
        fi
    done
}

launch_main "${@}"

