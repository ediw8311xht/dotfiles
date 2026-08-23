#!/bin/bash

with_error() {
  local err_color="${COLOR_ERROR:-'\e[31m'}"
  echo -en "${err_color}"
  {
    printf "error:\t%s\n" "${1}"
    [[ "${#}" -gt 1 ]] &&
      printf "\t%s\n" "${@:2}"
  } #> >(column --table)
  echo -en '\e[0m'
}

md_to_html() {
  local md
  md="${1:-"$(xclip -o)"}"
  if [[ -z "${md}" ]]; then
    echo "Nothing passed or in clipboard"
    return 1
  fi
  pandoc -f markdown -t html -o /dev/stdout <<<"${md}" | xclip -selection "clipboard"
}

list_files_pac() {
  if yay -Qi "${1}" &>/dev/null; then
    yay -Ql "${1}"
  elif yay -Si "${1}" &>/dev/null; then
    if ! pkgfile -sl "${1}"; then
      echo "Package in AUR and not installed. Can't list files." >&2
      return 1
    fi
  else
    echo "Package: '${1}' not in AUR/AOR." >&2
    return 1
  fi
  return 0
  #if yay -Qi "${1}"
}

pkgfile_lib_info() {
  pkg-config --cflags --libs "${1}"
}

mps() {
  # local h1='\[\e[00;01;07;34m\]'  h2='\[\e[00;01m\]'  h3='\[\e[00;01;34m\]'   h4='\[\e[00;01;33m\]'
  local h1='\[\e[00;07;34m\]' h2='\[\e[0m\]'
  local h3='\[\e[00;034m\]' h4='\[\e[00;33m\]'

  local d1='\D{%F}' d2='\D{%T}'
  local d3='\D{%s}' d4='\D{%d-%m-%y}'
  local d5='\D{%H%M}' d6='\D{%Y%m%d}'

  local s1=':\w/:>' s2='-\$'
  local s3=':\W/:>'
  local spec_ssh=''
  local guix_env=''
  [[ -n "${GUIX_ENVIRONMENT}" ]] &&
    guix_env="[guix env]"
  [[ -n "${SSH_CLIENT}" ]] || [[ -n "${SSH_TTY}" ]] &&
    spec_ssh='\[\e[01m\]\[\e[37m\][\[\e[32m\]SSH\[\e[37m\]]'
  if [[ "${1,,}" =~ ^[0-9]+$ ]]; then
    PROMPT_DIRTRIM="${1}"
    { [[ -n "${2}" ]] && shift 1; } || return
  fi
  #- INITIALIZE -#
  case "${1,,}" in
  l)
    PS1="${spec_ssh}${guix_env}$h1 $d1 | $d2 $h2 $s1 "
    ;;
  r)
    PS1="${spec_ssh}${guix_env}${h4} :\w:$ ${h2}"
    ;;
  m)
    PS1="${spec_ssh}${guix_env}$h1 $d4 $d5 $h2 $s3 "
    ;;
  s)
    PS1="${spec_ssh}${guix_env} $d3 $s2 "
    #PS0="${h1} ${PWD} | ${d1} | ${d2} \n"'\e[0 q\[\e[0m\]'
    ;;
  x)
    PS1="${spec_ssh}${guix_env}${h3} |${d6}|\w:$ "
    ;;
  *) return 2 ;;
  esac
  PS1+='\[\e[0m\]'
}

cd_from_lf() {
  #lf -log="${MY_LOGS}/LF_LOGS/$(date +'%s')_LF_LOG.txt"
  local dir tmp_file
  tmp_file="$(mktemp "/tmp/tmp_lf.XXXXXXXX")"
  lf -last-dir-path="${tmp_file}" "${@}"

  dir="$(cat "${tmp_file}")"
  trash-put "${tmp_file}"

  if [[ -d "${dir}" ]] && [[ "${PWD}" != "${dir}" ]]; then
    cd "${dir}" || return 1
  fi
}

open_mpv() {
  # local AUD
  local CLOSE FILE_FZF
  while [[ "${1,,}" =~ ^-[-?].*$ ]]; do
    # [[ "${1,,}" =~ ^-m(ono)?      ]] && AUD="mono"
    [[ "${1,,}" =~ ^(-c|--close)$ ]] && CLOSE="close"
    [[ "${1,,}" =~ ^(-f|--fzf)$ ]] &&
      FILE_FZF="$(fd -H "[.](mp4|mkv|avi|mpeg|mpeg4|mpv|mpv4|m4v|mpg|m4p|mov|wmv|webm)$" | fzf --preview="ctpv {}")"
    [[ ! -f "${FILE_FZF}" ]] && return 1
    shift 1
  done

  if [[ -n "${FILE_FZF}" ]]; then
    # mpv --audio-channels="${AUD:-"auto"}" "${FILE_FZF}" --input-ipc-server=/tmp/mpvsocket & disown
    mpv "${FILE_FZF}" --input-ipc-server=/tmp/mpvsocket &
    disown
  else
    # mpv --audio-channels="${AUD:-"auto"}" "${@:-.}" --input-ipc-server=/tmp/mpvsocket & disown
    mpv "${@:-.}" --input-ipc-server=/tmp/mpvsocket &
    disown
  fi
  [[ "${CLOSE}" = 'close' ]] && exit
}

alias_conflict() {
  local cvm wcl
  cvm="$(compgen -c)"
  while read -r -d$'\n' i; do
    wcl="$(grep -c -x "${i}" <<<"${cvm}")"
    if [[ "${wcl}" -gt 1 ]]; then
      echo "---------${wcl} - ${i}"
      [[ "${1::2}" = '-f' ]] && type -a "${i}" | sed -E "s/(.*[\`]|^)/\t/"
    fi
  done < <(alias -p | grep -Pio '^[ \t]*alias[ \t]*\K[^=]*')
}

bash_history_grab() {
  grep -Pi --color="always" "${1}" "${HISTFILE}" | tail -n "${2:-50}"
}

stream_ytdl_mpv() {
  yt-dlp "${1}" -f "bestvideo[height<=?1080]+bestaudio/best" -o - | mpv --input-ipc-server=/tmp/mpvsocket -
}

rg_with_p() {
  rg "${@}" | "${PAGER}"
}

man_all_pages() {
  $MANPAGER < <(MAN_KEEP_FORMATTING=1 man -a "${@}" 2>/dev/null)
}

markdown_view_w3m() {
  w3m -T text/html < <(pandoc -s "${1}" 2>/dev/null)
}

size_of_dir() {
  local tdir="${1:-.}"
  if ! [[ -d "${tdir}" ]]; then
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
  if [[ "${1,,}" = -d ]] && [[ -d "${2}" ]]; then
    { cd "${2}" && shift 2; } || return 1
  fi
  local OPTIONS=(
    --preview="${LS_PREVIEW[*]:-ls} {}"
  )

  out_dir="$(fd "${@}" -td | fzf "${OPTIONS[@]}")"
  [[ -d "${out_dir}" ]] && cd "${out_dir}" || return 1
}

fzf_edit() {
  local FZF=(--preview="highlight -O ansi -l {} 2>/dev/null"
    --bind="enter:become(${EDITOR:-vim} -o {}; echo {})")
  local SEARCH_PATH="${PWD}"
  [[ -n "${1}" ]] && [[ -d "${1}" ]] &&
    {
      SEARCH_PATH="${1}"
      shift 1
    }

  if [[ -f "${LOCATE_DATABASE}" ]]; then
    plocate "${SEARCH_PATH}/*" -d "${LOCATE_DATABASE}"
  else
    fd . -tf "${SEARCH_PATH}"
  fi | fzf "${FZF[@]}"
}

fzf_open() {
  local FZF=(--preview="highlight -O ansi -l {} 2>/dev/null"
    --bind="enter:become(xdg-open {}; echo {})")
  if [[ -d "${1}" ]]; then
    cd "${1}" ||
      {
        echo "Error cding into '${1}'" >&2
        return 1
      }
    shift 1
  fi
  # shellcheck disable=SC2164
  fd -tf -tl -u "${@}" | fzf "${FZF[@]}" || cd -
}

myfzf() {
  local VALID_COMMANDS=('cd' 'xdg-open' 'nvim' 'vim')
  local command='cd'
  local OPTIONS=(
    '--type' 'directory'
  )
  while [[ "${#}" -gt 0 ]]; do
    if [[ "${1,,}" = 'g' ]]; then
      OPTIONS+=('--search-path' '/')
    elif [[ "${1,,}" = 'h' ]]; then
      OPTIONS+=('--hidden')
    elif [[ "${1,,}" = 'u' ]]; then
      OPTIONS+=('--unrestricted')
    elif [[ "${1,,}" = 'c' ]]; then
      if ! in_array "${2}" "${VALID_COMMANDS[@]}"; then
        echo "Invliad Command: not in '${VALID_COMMANDS[*]}'" >&2
        return 1
      fi
      command="${2}"
      shift 1
    elif [[ "${1,,}" =~ ^[0-9]+$ ]]; then
      OPTIONS+=('--max-depth' "${1#-}")
    else
      echo "invalid option"
      return 1
    fi
    shift 1
  done
  "${command}" "$(fd "${OPTIONS[@]}" | fzf --preview="${LS_PREVIEW:-"ls -l"} {}")" || return 1
}

_alias() {
  # local com="${2%% *}"
  if [[ "${1,,}" =~ ^[-]?-c(heck)?$ ]]; then
    shift 1
    if [[ "${#}" -lt 2 ]]; then
      printf 'Usage:\n\t%s\n' "make_completions alias_name definition" >/dev/stderr
      return 1
    elif grep -Pqv '^[a-zA-Z0-9_-]+$' <<<"${1}"; then
      printf 'Error:\n\t%s\n' "invalid alias name: '${1}'" >/dev/stderr
      return 1
    elif grep -Fqx "${1}" <<<"$(compgen -b)"; then
      printf 'Error:\n\t%s\n' "Alias conflicts with bash builtin: '${1}'" >/dev/stderr
      return 1
    fi
  fi
  # shellcheck disable=SC2139,SC2086
  alias ${1}="${*:2}"
  complete -F _complete_alias "${1}"
}

find_one() {
  local m="${2}"
  for i in "${@:2}"; do
    # shellcheck disable=SC2003
    m="$(expr "(" "(" "${m}" "${1}" "${i}" ")" "*" "${m}" ")" "|" "${i}")"
  done
  echo "${m}"
}

min_of() {
  find_one "<" "${@}"
}

max_of() {
  find_one ">" "${@}"
}

show_help() {
  local command="${1}"
  local type
  show_help_file() {
    local fullpath="$(which "${command}")"
    if ! file -b --mime-encoding "${fullpath}" | grep -qi 'binary'; then
      cat "${fullpath}"
    else
      # man "${command}" || info "${command}" || whatis "${command}" || echo "${command}: '${fullpath}'"
      man "${command}"
    fi
  }
  type="$(type -t "${command}")" || {
    echo "'${1}' not found."
    return 1
  }
  echo -e "Type: ${type}\n"
  case "${type,,}" in
  # shellharden takes input from stdin if ended with ''
  alias)
    alias "${command}" |
      sed -E -e 's/^[ ]*alias[^=]*[=].[ ]*(.*).$/\1/' -e 's/[ ][ ]+/ /g'
    ;;
  function)
    declare -f "${command}"
    ;;
  builtin)
    help "${command}"
    ;;
  file)
    show_help_file
    return 0
    ;;
  *)
    echo "no clue"
    ;;
  esac | shellharden --syntax '' | sed 's/^/    /'
  echo ""
}

find_function() {
  while read -r -d$'\0' func; do
    grep -Piq "${1}" <<<"$(declare -f "${func}")" &&
      declare -f "${func}"
  done < <(declare -F | grep -ZPo '^declare\s+[-]f\s+\K[^_].*$')
}

in_array() {
  if [[ "${#}" -le 1 ]]; then
    return 1
  elif [[ "${1}" = "${2}" ]]; then
    return 0
  else in_array "${1}" "${@:3}"; fi
} #; readonly -f in_array

# -------------------------------------------------- #
# -------------------------------------------------- #
# -------------------------------------------------- #
new_md_note() {
  local notes_dir="${DESKTOP}/SCHOOL/NOTES/"
  local file_name="${1}.md"
  if ! [[ -d "${notes_dir}" ]] || ! cd "${notes_dir}"; then
    echo "Error: Directory, '${notes_dir}' not found."
  elif [[ -z "${1}" ]]; then
    echo "Must provide argument for file name."
  elif [[ -f "${file_name}" ]]; then
    echo "That file already exists"
  else
    cp "$XDG_CONFIG_HOME/nvim/language_specific/templates/template_note.md" "${file_name}"
    # +$ to open file at end
    nv "${file_name}" +$
    return 0
  fi
  return 1
}

addally() {
  if type "${1}" &>/dev/null; then
    echo "CONFLICTS WITH DEFINED COMMAND"
    type "${1}"
  elif whatis "${1}" &>/dev/null; then
    echo "CONFLICTS WITH OTHER"
    whatis "${1}"
  else
    # shellcheck disable=SC2086,SC2139
    if [[ "${1,,}" =~ ^[a-z][a-z0-9_-]*$ ]]; then
      alias ${1}="cd \"${PWD/$HOME/\$\{HOME\}}\""
      alias ${1} >>"${HOME}/bashrc_files/personal_aliases.sh"
    else
      echo "invalid name"
    fi
  fi
  #printf "alias %s='\''cd "%s"'\''\n'  "${1}"  >> "${HOME}/bashrc_files/personal_aliases"
}

mix_decompile() {
  mix decompile "${1}" --to expanded
}

test_quick() {
  local testdir="${HOME}/TEST/QUICK"
  local testfile
  [[ -d "${testdir}" ]] || {
    echo "Testdir: '${testdir}' not found." >&2
    return 1
  }

  call_back() {
    testfile="${2}/$(date +'%Y_%m_%d')__quick.${1}"
    nvim "${testfile}"
  }
  if [[ -n "${1}" ]]; then
    call_back "${1}" "${testdir}"
    return
  fi
  fd -u -tf --exact-depth 1 'quick[.].*' "${testdir}" |
    fzf --bind="enter:become(${EDITOR:-vim} -o {}; echo {})"
  # [[ -f "${testfile}" ]] && nvim "${testfile}"
}

doc_view() {
  local doc_dir='/usr/share/doc'
  local l
  cd "${doc_dir}" || return 1
  l="$(fd -u -td --max-depth 7 |
    fzf --scheme="path" --info='right' --info-command='ls -l' --preview="${LS_PREVIEW:-"ls -l"} {}")"
  if [[ -d "${l}" ]]; then
    cd "${l}" || {
      echo -e "\e[1;31mCan't cd into: '${l}'" >/dev/stderr
      return 1
    }
  fi
}

ez_perm() {
  chown "${USER}":"${USER}" "${1}"
  chmod 600 "${1}"
}

binary_files() {
  local search_dir="${1-"${PWD}"}"
  local limit=1000
  while ((--limit)) && read -r -d $'\0' file; do
    if file --mime-encoding --brief "${file}" | grep --invert-match -qFx 'binary'; then
      printf '%s\0' "${file}"
    fi
  done < <(fd -H -tf --print0 . "${search_dir}")
}

chattr_edit() {
  sudo chattr -i "${1}" || return 1
  nvim "${1}"
  sudo chattr +i "${1}"
}

gif_animated_towebp() {
  [[ "${1}" =~ -d ]] && {
    local delete=true
    shift 1
  }
  local base_file="${1%.*}"
  local outfile="${base_file}.webp"
  if [[ ! -f "${1}" ]]; then
    echo "file, '${1}', doesn't exist"
  elif [[ -f "${outfile}" ]]; then
    echo "outfile, '${outfile}', already exists"
  else
    ffmpeg -i "${base_file}" \
      -vf "scale=180:-1" \
      -vcodec webp \
      -loop 0 \
      -pix_fmt yuva420p \
      "${outfile}" &&
      {
        [[ "${delete}" ]] && trash-put "${1}"
      }
  fi
}

ssh_correct() {
  local old_term="${TERM}"
  export TERM="vt100"
  ssh "${@}"
  export TERM="${old_term}"
}
# {{{ removed
# fpend() {
#     if [[ "$1" =~ ^-[dD](ate)? ]] ; then shift 1; local MDATE; MDATE="#$(date)"; fi
#     if [[ -f "${1}"            ]] ; then
#         for i in "${@:2}" "${MDATE:-"_"}"; do
#             echo "${i}" '  |---|  ' "${1}"
#             echo "${i}" >> "${1}"
#         done
#         return "$?"
#     fi
#     echo "INCORRECT ARGUMENTS"; return 1
# }
# get_outdated_pip() {
#    local zfile
#    local IFS=$'\n'
#    zfile="$(mktemp /tmp/get_outdated_pip_XXXXXXXX.txt)"
#    trap "trash-put '${zfile}'" SIGINT SIGHUP EXIT RETURN
#    pip list --outdated > "${zfile}"
#    nvim "${zfile}"
#}
# }}}
