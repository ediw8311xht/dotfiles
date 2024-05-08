#!/bin/bash

print_x() {
    printf "%${1}.s\n" | tr ' ' "${2}"
}

help_func() {
    local DESCRIPTION=""
    local WIDTH=70
    local HELP=(
        "   Description: ${DESCRIPTION}"
        ""
        "   -h/--help: print help for this program"
    )
    print_x "${WIDTH}" '-'
    for i in "${HELP[@]}" ; do
        printf "\t%s\n" "${i}"
    done
    print_x "${WIDTH}" '-'
}

handle_arguments() {
    case "${1,,}" in
        -h|--help) help_func; exit
    ;;         -*) echo "invalid argument"
    ;;          *) return
    ;; esac
    handle_arguments "${@:2}"
}

main() {
    handle_arguments "${@}"
    return 0
}

main "${@}"
