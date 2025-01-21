#!/bin/bash

#export  SHELLCHECK_OPTS='--exclude=SC1091'
export  PROMPT_COMMAND='history -n; history -a'
#export  HISTTIMEFORMAT='%D %T '
export  HISTSIZE=25000
export  HISTFILE="${HOME}/.bash_history"
export  HISTCONTROL=ignoreboth
export  TMPDIR="/tmp/"
export  XDG_CONFIG_HOME="${HOME}/.config"
export  XDG_CACHE_HOME="${HOME}/.cache"
export  XDG_DATA_HOME="${HOME}/.local/share"
export  XDG_STATE_HOME="${HOME}/.local/state"
#------------------XDG-----------------#
#---------------RIPGREP-(RG)-----------#
export  RIPGREP_CONFIG_PATH="${HOME}/.config/rg/ripgreprc"
#------------------FZF-----------------#
export  HTML_TIDY="${XDG_CONFIG_HOME}/tidy/tidy.conf"
export  FZF_DEFAULT_COMMAND='fd -H'
export  FZF_DEFAULT_OPTS='
    --bind ctrl-a:first
    --bind ctrl-e:last
    --bind ctrl-u:half-page-up
    --bind ctrl-d:half-page-down
    --bind ctrl-g:preview-half-page-down
    --bind ctrl-h:preview-half-page-up
    --bind ctrl-K:clear-query
    --bind ctrl-t:toggle-preview'
export  LS_PREVIEW='lsd   \
    --color=always        \
    --group-dirs="first"  \
    --timesort            \
    --reverse             \
    --icon="never"        \
    --permission="octal"  \
    --date=+"%y%m%_d"     \
    --blocks="permission,user,date,name"'
#------------------BEMENU--------------#
export  BEMENU_OPTS=''
#------------------SYSTEM--------------#
export  EMACS_SOCKET_NAME="${USER}_emacs_daemon"
export  DOOMDIR="${HOME}/.config/doom"
export  SUDO_EDITOR='nvim'
export  EDITOR='nvim'
export  TERM='kitty'
export  TERMINAL='/usr/bin/kitty'
export  ERL_AFLAGS="-kernel shell_history enabled"
#------------------MINE----------------#
export  STANDARD_IFS=$' \t\n'
export  BACKUP="${HOME}/BACKUP_FILES"
export  BIN="${HOME}/bin"
export  BROWSER="/usr/bin/brave"
export  DESKTOP="${HOME}/Desktop/"
export  DOCUMENTS="${HOME}/Documents/"
export  DOWNLOADS="${HOME}/Downloads/"
export  MY_LIBRARY="${HOME}/MyLibrary/"
export  CURRENTLY_READING="$MY_LIBRARY/Z_CURRENTLY_READING/"
export  MY_LOCAL="${HOME}/.local/"
export  MY_LOCAL_BIN="${MY_LOCAL}/bin/" # By default this is in path (set by os, not by me) (just so i remember)
export  MY_LOCAL_SHARE="${MY_LOCAL}/share/"
export  MY_LOCAL_LIB="${MY_LOCAL}/lib/"
export  PICTURES="${HOME}/Pictures/"
export  VIDEOS="${HOME}/Videos/"
export  NVIMSWAP="${HOME}/.local/share/nvim/swap/"
export  WHEN_CONFIG_HOME="${XDG_CONFIG_HOME}/when"
export  W3M_DIR="${XDG_CONFIG_HOME}/w3m/"
#------------------PAGER---------------#
export  MOST_INITFILE="${HOME}/.mostrc"
export  MOST_EDITOR='nvim'
export  PAGER='most'
export  LESSOPEN='|pygmentize -g %s'
export  LESS='-R'
export  DMENU_SCRIPT="${HOME}/bin/my_dmenu.sh"
#------------------MULTI-LEVEL---------#
export  PYTHONPATH="${PYTHONPATH}:/usr/bin/python3"
#####################   Fixes colored man pages when using `most`, for some reason, TY https://stackoverflow.com/users/26449/bill                 #
export  GROFF_NO_SGR=1 ### https://stackoverflow.com/a/32456403                                                                                   #
#####################   https://stackoverflow.com/questions/32384644/color-setting-works-for-only-for-help-tab-in-man-page-dosent-work-for-the-en #
#------------------APPLICATIONS--------#
export  NO_AT_BRIDGE=1
export  QT_QPA_PLATFORMTHEME="qt6ct"
export  npm_config_prefix="${HOME}/.local"
export  GTK2_RC_FILES="/usr/share/themes/Midnight/gtk-2.0/gtkrc"
#------------------------------------------------------------------------------------------------------------------------------------------------ #



