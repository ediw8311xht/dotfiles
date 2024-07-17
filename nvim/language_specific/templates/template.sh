#!/bin/bash

script_main() (
    local S DESCRIPTION OPTIONS HELP
    S="$(printf "\n%$(tput cols || echo 20)s\n" | tr ' ' '-')"
    DESCRIPTION=(
        "$(basename "$0")"
    )
    OPTIONS=(
        "-h/--help: print help for this program"
    )
    HELP=(
        "Description:${S}" "${DESCRIPTION[@]/#/$'\t'}"
            "Options:${S}"     "${OPTIONS[@]/#/$'\t'}"
    )

    help_func() { echo; printf -- "%s\n" "${HELP[@]}"; }
    handle_arguments() {
        local i; while [[ "${i:="1"}" -le "${#}" ]] ; do
            case "${@:i++:1}" in
                -h|--help) help_func; return 0
            ;;          *) echo "invalid argument"
            ;; esac
        done
    }

    handle_arguments "${@}"
)

script_main "${@}"
# remove function from environment
unset script_main
