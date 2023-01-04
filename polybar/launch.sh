#!/bin/bash


function monitor_getter() {
    START='^[ \t]*[0-9]+[:][ \t]*[+]'
    MIDDLE='.*[ ]\K'
    END='[^ \t]+(?=[ \t]*)$'
    if   [[ "${1,,}" =  'primary'   ]] ; then MIDDLE='[*].*[ ]\K'
    elif [[ "${1,,}" =  'secondary' ]] ; then MIDDLE='[^*].*[ ]\K'
    elif [[ "${1,,}" != 'all'       ]] ; then END='[^ \t]*('"${*}"')[^ \t]*'
    fi
    grep -Po "${START}${MIDDLE}${END}" <<< "$(xrandr --listmonitors)" 
}

function handle_args() {
    while [[ -n "${1}" ]] ; do
        if [[ "${1}" =~ -c=.* ]] ; then
            insert_config="${1}"
        else
            MARR+=("$(monitor_getter "${1}")")
        fi
        shift 1
    done
}

function launch_main() {
    MARR=($(monitor_getter 'all'))
    insert_config=''

    killall --quiet 'polybar'
    handle_args "${@}"

    for item in "${MARR[@]}"
    do
        if [[ -f "${insert_config}" ]] ; then 
            MONITOR="${item}" polybar "${insert_config}" --reload basicbar & disown
        else
            MONITOR="${item}" polybar --reload basicbar & disown
        fi
    done
}

launch_main "${@}"

