#!/bin/bash

script_main() (
    local S DESCRIPTION OPTIONS HELP ARGUMENT_LIST
    S="$(printf "\n%$(tput cols || echo 20)s\n" | tr ' ' '-')"
    ARGUMENT_LIST=()
    DESCRIPTION=(
        "$(basename "$0")"
    )
    OPTIONS=(
        "-h/--help: print help for this program"
    )
    ARGUMENTS=(
        "None"
    )
    HELP=(
        "Description:${S}" "${DESCRIPTION[@]/#/$'\t'}"
          "Arguments:${S}"   "${ARGUMENTS[@]/#/$'\t'}"
            "Options:${S}"     "${OPTIONS[@]/#/$'\t'}"
    )

    help_func()  { echo; printf -- "%s\n" "${HELP[@]}" ; exit 0; }
    error_func() { echo -e "Invalid Option: '${1}'\nUse -h/--help for list of options" >&2 ; exit 1; }
    handle_arguments() {
        while [[ "${#}" -gt 0 ]] ; do
            if   [[ "${1,,}" =~ ^(-h|--help)$ ]] ; then help_func "${@:2}"
            elif [[ "${1,,}" =~ ^-.*$ ]]         ; then error_func "${1}"
            else ARGUMENT_LIST+=( "${1}" )
            fi
            shift 1
        done
    }

    handle_arguments "${@}"
)

script_main "${@}"


