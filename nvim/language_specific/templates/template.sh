#!/bin/bash

( #--------------START-SUBSHELL---------------#
FILENAME="$(basename "$0")"
DESCRIPTION=(
    "${FILENAME}"
)
OPTIONS=(
    "-h/--help: print help for this program"
)
SEP="-"
WIDTH="$(tput cols)"

repeat_string() { seq "${2}" | xargs printf -- "${1}%.0s";  }
psep()          { repeat_string "${SEP}" "${WIDTH}"; echo; }

help_func() {
    psep ; printf "%s\n"       "Description:"
    printf "\t%s\n"     "${DESCRIPTION[@]}"
    psep ; printf "%s\n"       "Options:"
    printf "\t%s\n"     "${OPTIONS[@]}"
    psep
}

handle_arguments() {
    local i; while [[ "${i:="1"}" -le "${#}" ]] ; do
        case "${@:i++:1}" in
            -h|--help) help_func; return 0
        ;;          *) echo "invalid argument"
        ;; esac
    done
}

main() {
    handle_arguments "${@}"
}

main "${@}"
) #----------------END-SUBSHELL---------------#


