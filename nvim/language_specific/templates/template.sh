#!/bin/bash

####################
( #-START-SUBSHELL-#
####################
ARGS=()

help_func() {
    local DESCRIPTION="Placeholder"
    local OPTIONS='''
------------------------------------------------
    -h/--help: print help for this program
------------------------------------------------
    '''
    printf "%s\n" '' "${DESCRIPTION}" "${OPTIONS}"
}

handle_arguments() {
    case "${1,,}" in
        -h|--help) help_func; exit
    ;;         -*) echo "invalid argument"
    ;;          *) ARGS=("${@}"); return
    ;; esac
    shift 1
    handle_arguments "${@}"
}

main() {
    handle_arguments "${@}"
    return 0
}

main "${@}"

####################
) #---END-SUBSHELL-#
####################

