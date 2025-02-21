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
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'



