#
#- ~/.bashrc
#
# shellcheck disable=SC2016,SC2064,SC1094,SC2089,SC2090

#[[ $- == *i* ]] && source "${HOME}/.local/share/blesh/ble.sh" --noattach

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
#source "${HOME}/bashrc_files/exports.sh"
source "${HOME}/bashrc_files/functions.sh"
source "${HOME}/bashrc_files/aliases.sh"
source "${HOME}/.config/broot/launcher/bash/br"
#source "${HOME}/bashrc_files/zoxide.sh"
mps 'r' #setting PS1
#------------------BASH-HISTORY--------#

shopt -s histappend

#[[ ${BLE_VERSION-} ]] && ble-attach

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT='--install_base "/$HOME/perl5"'; export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/$HOME/perl5"; export PERL_MM_OPT
export GEM_HOME="$HOME/.local/share/gem/ruby/3.3.0/"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
