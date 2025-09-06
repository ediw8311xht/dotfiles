#!/bin/bash

md_to_html() {
    local md
    md="${1:-"$(xclip -o)"}"
    if [[ -z "${md}" ]] ; then echo "Nothing passed or in clipboard"; return 1; fi
    pandoc -f markdown -t html -o /dev/stdout <<< "${md}" | xclip -selection "clipboard"
}
list_files_pac() {
    if   yay -Qi "${1}" &>/dev/null ; then
        yay -Ql "${1}"
    elif yay -Si "${1}" &>/dev/null ; then
        if ! pkgfile -sl "${1}" ; then
            echo "Package in AUR and not installed. Can't list files." >&2; return 1
        fi
    else
        echo "Package: '${1}' not in AUR/AOR." >&2; return 1
    fi
    return 0
    #if yay -Qi "${1}" 
}
pkgfile_lib_info() {
    pkg-config --cflags --libs "${1}"
}
mps() {
    local h1='\[\e[00;01;07;34m\]'  h2='\[\e[00;01m\]'  h3='\[\e[00;01;34m\]'   h4='\[\e[00;01;33m\]'
    local d1='\D{%F}'               d2='\D{%T}'         d3='\D{%s}'
    local d4='\D{%d-%m-%y}'         d5='\D{%H%M}'       d6='\D{%Y%m%d}'
    local s1=':\w/:>'               s2='-\$'            s3=':\W/:>'
    local spec_ssh=''
    if [[ -n "${SSH_CLIENT}" ]] || [[ -n "${SSH_TTY}" ]] ; then
        local spec_ssh='\[\e[01m\]\[\e[37m\][\[\e[32m\]SSH\[\e[37m\]]'
    fi
    #- INITIALIZE -#
    PROMPT_DIRTRIM='0'
    case "${1,,}" in
             l) PROMPT_DIRTRIM='2'; PS1="${spec_ssh}$h1 $d1 | $d2 $h2 $s1 "
        ;;   r) PROMPT_DIRTRIM='5'; PS1="${spec_ssh}${h4} :\w:$ ${h2}"
        ;;   m) PROMPT_DIRTRIM='1'; PS1="${spec_ssh}$h1 $d4 $d5 $h2 $s3 "
        ;;   s) PROMPT_DIRTRIM='0'; PS1="${spec_ssh} $d3 $s2 "
                #PS0="${h1} ${PWD} | ${d1} | ${d2} \n"'\e[0 q\[\e[0m\]'
        ;;   x) PROMPT_DIRTRIM='5'; PS1="${spec_ssh}${h3} |${d6}|\w:$ "
        ;;   *) return 2
    esac
    PS1+='\[\e[0m\]'
}
cd_from_lf() {
    #lf -log="${MY_LOGS}/LF_LOGS/$(date +'%s')_LF_LOG.txt"
    local dir tmp_file
    tmp_file="$(mktemp "/tmp/tmp_lf.XXXXXXXX")"
    lf -last-dir-path="${tmp_file}"

    dir="$(cat "${tmp_file}")"
    trash-put "${tmp_file}"

    if [[ -d "${dir}" ]] && [[ "${PWD}" != "${dir}" ]] ; then
        cd "${dir}" || return 1
    fi
}
open_mpv() {
    local AUD CLOSE FILE_FZF
    while [[ "${1,,}" =~ ^-[-?].*$ ]] ; do
        [[ "${1,,}" =~ ^-m(ono)?      ]] && AUD="mono"
        [[ "${1,,}" =~ ^(-c|--close)$ ]] && CLOSE="close"
        [[ "${1,,}" =~ ^(-f|--fzf)$   ]] && \
            FILE_FZF="$(fd -H "[.](mp4|mkv|avi|mpeg|mpeg4|mpv|mpv4|m4v|mpg|m4p|mov|wmv|webm)$" | fzf --preview="ctpv {}")"
            [[ ! -f "${FILE_FZF}" ]] && return 1
        shift 1
    done

    if [[ -n "${FILE_FZF}" ]] ; then
        # mpv --audio-channels="${AUD:-"auto"}" "${FILE_FZF}" --input-ipc-server=/tmp/mpvsocket & disown
        mpv "${FILE_FZF}" --input-ipc-server=/tmp/mpvsocket & disown
    else
        # mpv --audio-channels="${AUD:-"auto"}" "${@:-.}" --input-ipc-server=/tmp/mpvsocket & disown
        mpv "${@:-.}" --input-ipc-server=/tmp/mpvsocket & disown
    fi
    [[ "${CLOSE}" = 'close' ]] && exit
}
open_prog() {
    xdg-open "${1}" & disown
}
fpend() {
    if [[ "$1" =~ ^-[dD](ate)? ]] ; then shift 1; local MDATE; MDATE="#$(date)"; fi
    if [[ -f "${1}"            ]] ; then
        for i in "${@:2}" "${MDATE:-"_"}"; do
            echo "${i}" '  |---|  ' "${1}"
            echo "${i}" >> "${1}"
        done
        return "$?"
    fi
    echo "INCORRECT ARGUMENTS"; return 1
}
alias_conflict() {
    local cvm wcl
    cvm="$(compgen -c)"
    while read -r -d$'\n' i ; do
        wcl="$(grep -c -x "${i}" <<< "${cvm}")"
        if [[ "${wcl}" -gt 1 ]] ; then
            echo "---------${wcl} - ${i}"
            [[ "${1::2}" = '-f' ]] && type -a "${i}" | sed -E "s/(.*[\`]|^)/\t/"
        fi
    done < <(alias -p | grep -Pio '^[ \t]*alias[ \t]*\K[^=]*')
}
bash_history_grab() {
    grep -Pi "${1}" "${HISTFILE}" | tail -n "${2:-50}"
}
stream_ytdl_mpv() {
    yt-dlp "${1}" -f "bestvideo[height<=?1080]+bestaudio/best" -o - | mpv --input-ipc-server=/tmp/mpvsocket -
}
rg_with_p()       {
    rg "${@}" | "${PAGER}"
}
man_all_pages() {
    MAN_KEEP_FORMATTING=1 man -a "${@}" 2>/dev/null | "${PAGER}"
}
markdown_view_w3m() {
    w3m -T text/html < <(pandoc -s "${1}" 2>/dev/null)
}
size_of_dir() {
    local tdir="${1:-.}"
    if ! [[ -d "${tdir}" ]] ; then
        echo "Directory: '${tdir}' not found." >&2
        return 1
    else
        du -axhc --time --max-depth=1 "${tdir}" | sort -h
    fi
}
# i have a few different fzf functions i have written for some reason, need to
# put into just one, also need to use plocate, since searching through
# filesystem is so dang slow. easily could do something like --bind :become
# instead of separate function calls for each command, will fix this when i get
# time.
fzf_cd() {
    local out_dir
    if [[ "${1,,}" = -d ]] && [[ -d "${2}" ]] ; then
        { cd "${2}" && shift 2; } || return 1
    fi
    local OPTIONS=(
        --preview="${LS_PREVIEW[*]:-ls} {}"
    )

    out_dir="$(fd "${@}" -td | fzf "${OPTIONS[@]}")"
    [[ -d "${out_dir}" ]] && cd "${out_dir}" || return 1
}

fzf_edit() {
    local FZF=( --preview="highlight -O ansi -l {} 2>/dev/null"
                --bind="enter:become(${EDITOR:-vim} -o {}; echo {})" )
    local SEARCH_PATH="${PWD}"
    [[ -n "${1}"  ]] && [[ -d "${1}"  ]] && \
        { SEARCH_PATH="${1}"; shift 1; }

    if [[ -f "${LOCATE_DATABASE}" ]] 
    then plocate "${SEARCH_PATH}/*" -d "${LOCATE_DATABASE}"
    else fd . -tf "${SEARCH_PATH}"
    fi | fzf "${FZF[@]}"
}
fzf_open() {
    local FZF=( --preview="highlight -O ansi -l {} 2>/dev/null"
                --bind="enter:become(xdg-open {}; echo {})" )
    if [[ -d "${1}" ]] ; then 
        cd "${1}" || { echo "Error cding into '${1}'" >&2; return 1; }
    fi
    # shellcheck disable=SC2164 
    fd -tf -tl -u | fzf "${FZF[@]}" || cd -
}
myfzf() {
    local VALID_COMMANDS=( 'cd' 'xdg-open' 'nvim' 'vim' )
    local command='cd'
    local OPTIONS=(
        '--type' 'directory'
    )
    while [[ "${#}" -gt 0 ]] ; do
        if   [[ "${1,,}" = 'g' ]] ; then OPTIONS+=( '--search-path' '/' )
        elif [[ "${1,,}" = 'h' ]] ; then OPTIONS+=( '--hidden' )
        elif [[ "${1,,}" = 'u' ]] ; then OPTIONS+=( '--unrestricted' )
        elif [[ "${1,,}" = 'c' ]] ; then
            if ! in_array "${2}" "${VALID_COMMANDS[@]}" ; then
                echo "Invliad Command: not in '${VALID_COMMANDS[*]}'" >&2
                return 1
            fi
            command="${2}";  shift 1
        elif [[ "${1,,}" =~ ^[0-9]+$ ]] ; then OPTIONS+=( '--max-depth' "${1#-}" )
        else echo "invalid option"; return 1; fi
        shift 1
    done
    "${command}" "$(fd "${OPTIONS[@]}" | fzf --preview="${LS_PREVIEW:-"ls -l"} {}")" || return 1
}

edit_make_path() {
    local d
    local i
    if d="$(dirname "${@: -1}")" && [[ ! -d "${d}" ]] ; then
        read -r -p "Create directory, ${d} ? [y|N] " i
        [[ ! "${i,,}" =~ ^y ]] && { echo "Not making dir....."; return 0; }
        mkdir -p "${d}" || { echo "Error making dir...." ; return 1; }
    fi
    if [[ ! "${*}" =~ ^(-n|--no-edit) ]] ; then
        "${EDITOR}" "${@: -1}"
    fi
}

alias_with_completion() {
    # local com="${2%% *}"
    [[ "${#}" -lt 2 ]] &&  \
        { printf 'Usage:\n\t%s\n' "make_completions alias_name definition" >/dev/stderr; return 1; }
    grep -Pqv '^[a-zA-Z0-9_-]+$' <<< "${1}" &&  \
        { printf 'Error:\n\t%s\n' "invalid alias name: '${1}'" >/dev/stderr; return 1; }
    grep -Fqx "${1}" <<< "$(compgen -b)" && \
        { printf 'Error:\n\t%s\n' "Alias conflicts with bash builtin: '${1}'" >/dev/stderr; return 1; }

    # shellcheck disable=SC2139,SC2086
    alias ${1}="${*: 2}"
    complete -F _complete_alias "${1}"
}



#get_outdated_pip() {
#    local zfile
#    local IFS=$'\n'
#    zfile="$(mktemp /tmp/get_outdated_pip_XXXXXXXX.txt)"
#    trap "trash-put '${zfile}'" SIGINT SIGHUP EXIT RETURN
#    pip list --outdated > "${zfile}"
#    nvim "${zfile}"
#}

