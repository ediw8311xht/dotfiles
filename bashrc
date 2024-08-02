#
#- ~/.bashrc
#
# shellcheck disable=SC2016,SC2064,SC1094

[[ $- == *i* ]] && source "${HOME}/.local/share/blesh/ble.sh" --noattach

# Add this line at the end of .bashrc:
#-If not running interactively, don't do anything
[[ $- != *i* ]] && return
stty -ixon  #- Prevent <Ctrl-s> from being binded by terminal -#
set  -o vi  #- Use VI Keys -#
umask 077   #- Default Permissions -#

#- Default PS0,PS1,PS3 if mps() doesn't run -#
PS0='\e[0 q\[\e[0m\]'
PS1=':\w/:> '
PS2=''

#export PROMPT_COMMAND='history -a'
source "${HOME}/bashrc_files/exports"
source "${HOME}/bashrc_files/functions"
source "${HOME}/bashrc_files/aliases"
source "${HOME}/.config/broot/launcher/bash/br"
mps 'xs' #setting PS1
#------------------BASH-HISTORY--------#
shopt -s histappend

[[ ${BLE_VERSION-} ]] && ble-attach
