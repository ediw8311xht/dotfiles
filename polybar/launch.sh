#!/bin/bash


function monitor_getter() {
    START='^[ \t]*[0-9]+[:][ \t]*[+]'
    MIDDLE='.*[ ]\K'
    END='[^ \t]+(?=[ \t]*)$'
    if   [[ "${1,,}" =  'primary'   ]] ; then MIDDLE='[*].*[ ]\K'
    elif [[ "${1,,}" =  'secondary' ]] ; then MIDDLE='[^*].*[ ]\K'
    elif [[ "${1,,}" != 'all'       ]] ; then END='[^ \t]*('"${@}"')[^ \t]*'
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
    MARR=()
    insert_config=''

    killall --quiet 'polybar'
    handle_args "${@}"
    echo "${MARR[@]}"
    for item in ${MARR[@]:-$(monitor_getter 'all')}
    do
        MONITOR="${item}" polybar ${insert_config} --reload basicbar & disown
    done
}

launch_main "${@}"

