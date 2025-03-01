#!/bin/bash

#--------------------------------------------------RESERVED------------------------------#
# b           RESERVED
# h           RESERVED
# w           RESERVED
# X           RESERVED
#--------------------------------------------------utilities-----------------------------#
alias ls='ls --color="auto" '
alias grep='grep --colour="auto" --group-separator="===================================" '
alias systemctl='systemctl --no-pager'
alias info='info --vi-keys'
alias sudo='sudo -v; sudo '
alias cp='cp -i'
alias free='free -h'
alias pacman='pacman --color="auto"'
alias yay='yay --color="auto"'
#--------------------------------------------------ls------------------------------------#
alias transcript_ytdlp=' yt-dlp --ignore-config --skip-download --write-subs --write-auto-subs --sub-lang en --output "$VIDEOS/transcripts/%(title)s%(ext)s"'
alias nd='        NVIM_APPNAME="NVIM_CHAD" nvim'
alias rgf='       source "${HOME}/bin/rg_fzf.sh"'
alias L='         ls++'
alias n='         lsd --group-directories-first -t -r --icon="never" --permission="octal"  --date=+" %l:%M%P %y %m %_d " --blocks="permission,user,date,size,name"'
alias lsn='       lsd --icon="never" -l'
alias lst='       lsd --icon="never" -ltrh'
alias lsz='       lsd --icon="never" -lSrh'
alias ll='        lsd --group-directories-first --icon="never" -rt --permission="octal"  --date=+" [ %_H:%M:%S | %a | %D ]" --blocks="permission,user,date,name"'
alias lla='       ll -a'
#--------------------------------------------------elixir--------------------------------#
alias i='         iex' # elixir
alias iexm='      iex -S mix'
alias dial='      mix dialyzer'
alias iexp='      iex -S mix phx.server'
alias mixf='      mix format'
alias mixc='      mix compile'
alias iexm='      MIX_ENV=test iex -S mix'
#--------------------------------------------------expac---------------------------------#
alias exspace='   expac -HM "%m %n" | sort -n'           # Size of packages pacman
alias exlast='    expac --timefmt="%Y    %m    %d    %R" "%l    --    %n" | sort | grep'
alias exopt='     expac -Qv -l "\n\t" "%n:\n\t%O"'
alias exdep='     expac -Qv -l "\n\t" "%n:\n\t%D"'
#--------------------------------------------------yay-----------------------------------#
alias yayse='     yay -Ss'
alias yayi='      yay -Si'
alias yayp='      yay -P --stats'
alias yayil='     yay -Qi'
alias yaysel='    yay -Qs'
alias yayfrom='   yay -Qo'
alias yayfiles='  yay -Qql'
alias yaycool='   yay -Sl aur | grep "Installed"'
alias yaysalt='   yay -Sl | grep -Pio ".*(?=\[installed\])"'
alias pacdep='    expac -l "\n" "%D"'
alias pacopt='    expac -l "\n" "%o"'
#--------------------------------------------------pacman--------------------------------#
alias ptc='       pactree --color' #Pacman Dependencies
alias pacse='     pacman -Ss'
alias paci='      pacman -Si'
alias pacdep='    pacman -T'
alias pacneed='   pacman -Qet'
alias pacprog='   pacman -F'
alias paclocal='  pacman -Qm'
alias pacsel='    pacman -Qs'
alias pacil='     pacman -Qi'
alias pacfrom='   pacman -Qo'
alias pacfiles='  list_files_pac'
alias pacf='      pacman -Fl'
alias pacool='    pacman -Sl | grep -Fi  "[installed]" | grep -i'
alias pacnot='    pacman -Sl | grep -vFi "[installed]" | grep -i'
#--------------------------------------------------cd------------------------------------#
alias b='         cd "${BIN}"'
alias h='         cd "${HOME}"'
alias vids='      cd "${VIDEOS}"'
alias down='      cd "${DOWNLOADS}"'
alias pics='      cd "${PICTURES}"'
alias docs='      cd "${DOCUMENTS}"'
alias desk='      cd "${DESKTOP}"'
alias infs='      cd "${MY_INFORMATION}"'
alias wallz='     cd "${WALLPAPERS}"'
alias nvimc='     cd "${HOME}/.config/nvim"'
alias nvimlocal=' cd "${HOME}/.local/share/nvim"'
alias back='      cd "${HOME}/BACKUP_FILES"'
alias ww='        cd "${MY_WEB}"'
alias inf='       fzf_cd -d "${MY_INFORMATION}"  -u -d1'
alias infx='      fzf_open "${MY_INFORMATION}"'
alias cnf='       fzf_cd -d "${XDG_CONFIG_HOME}" -u -d1'
alias conf='      cd "${XDG_CONFIG_HOME}"'
alias ncde='      cd "${CODING}"; nf'
alias nswp='      cd "${HOME}/.mynvim/swapfiles/"'
alias cde='       fzf_cd -d "${CODING}" -u -d3'
alias clne='      fzf_cd -d "${CLONED}" -u -d1'
#--------------------------------------------------find----------------------------------#
#alias listaudio=' fd . -tf -e mp3 -e flac'
#alias listpics='  fd . -tf -e jpg -e jpeg -e png -e tiff -e webp -e bmp -e avif -e ico -e gif -e gifv'
#alias listvids='  fd . -tf -e mov -e m4v -e mkv -e mpeg -e mp4 -e mpv -e webm -e avi -e amv'
#alias listmedia=" listaudio; listpics; listvids"
alias i3e='       fd . -d1 -0 -a -tf "${XDG_CONFIG_HOME}/i3/" | sort -z | xargs -0 nvim -c "Buffers"'
alias fi3e='      fd .     -0 -a -tf "${XDG_CONFIG_HOME}/i3/" | sort -z | xargs -0 nvim -c "Buffers"' 
alias gf='        fd --search-path "/" -u --mount'
#--------------------------------------------------Python--------------------------------#
alias p='         python'
alias px='        python <<EOF'
alias vid='       open_mpv'
alias fvid='      open_mpv --fzf'
alias ipy='       ipython'
alias pips='      poetry search'
alias pipf='      pip freeze'
alias pipsl='     pip list | grep -i'
alias pip3sl='    pip3 list | grep -i'
    #alias djs='       python manage.py runserver'
    #alias tjs='       python manage.py test'
    #alias py='        clear; python3'
#--------------------------------------------------ps------------------------------------#
alias psg='       ps ax | grep -Pi'
alias pgs='       pgrep'
alias pse='       ps -eo comm=, | grep --ignore-case'
alias pso='       ps -eo cmd=, | grep --ignore-case'
alias tret='      ps -ejH'
alias tres='      ps -eHo euser,ruser,suser,fuser,f,comm,label'
alias trev='      ps axjf'
    #alias pe='        ps -eo comm=,'
    #alias po='        ps -eo cmd=,'
#--------------------------------------------------man-----------------------------------#
alias manlist='   man -f'
alias men='       man_all_pages'
alias sman='      man -K --regex'
#--------------------------------------------------nvim----------------------------------#
alias fontgets_latex='fc-list :outline -f "%{family}\n"' # https://tex.stackexchange.com/questions/12881/how-to-get-a-list-of-all-available-ttf-fonts-with-xetex
alias nv='        nvim'
alias nvgr='      fd . -tf "${XDG_CONFIG_HOME}/nvim/" -x grep --color="always" -Pi'
alias fednv='     fd . -tf -0 "${HOME}/.config/nvim/" "${HOME}/.local/share/nvim/site/ftplugin/" -X nvim -c "Buffers"'
alias ednv='      nvim -c "Buffers" "${XDG_CONFIG_HOME}/nvim/lua/"*.lua "${XDG_CONFIG_HOME}/nvim/"*.vim'
alias echad='     cd "${XDG_CONFIG_HOME}/NVIM_CHAD/"; nd; cd -'
alias nva='       fd . --exact-depth 1 -tf -0 -X nvim -c "Buffers"'
alias nvc='       fd . --case-sensitive --exact-depth 1 -e C -e cpp -e h -tf -0 -X nvim -c "Buffers"'
#--------------------------------------------------zathura-------------------------------#
alias z='         zathura --fork'
alias eread='     fd "[.](pdf|epub|mobi|azw2|djvu)$" | fzf --print0 | xargs -0 -r -o zathura --fork; exit'
alias fread='     fd "[.](pdf|epub|mobi|azw2|djvu)$" | fzf --print0 | xargs -0 -r -o zathura --fork'
#--------------------------------------------------df------------------------------------#
alias d='           \df -h | ccze -m ansi'
alias D='           \df -h | grep -Po "^[ ]*[/]dev[/].*" | ccze -m ansi'
#--------------------------------------------------lf------------------------------------#
alias l='         cd_from_lf' # my lf, so it cd's shell after exiting lf
#--------------------------------------------------TaskWarrior---------------------------#
alias tl='        task list'
#--------------------------------------------------lisp----------------------------------#
alias vlime_start=' sbcl --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp'
alias stop_vlime='  pkill vlime'
#----------------------------------------------------------------------------------------#
#alias kld='       kalker --angle-unit deg'
#alias klr='       kalker --angle-unit rad'
alias B='         bat'
alias C='         cd ..'
alias P='         readlink -f'
alias ac='        compgen -c  | grep -x'
alias acc='       alias_conflict'
alias acf='       alias_conflict --full'
alias alas_np='   alias -p | grep -Pio "^[ \t]*alias[ \t]*\K[^=]*" | column'
alias betterkey=' showkey -k'
alias bgsz='      szof | grep -P "^[^ ]*G"'
alias chx='       chmod 700'
alias cop='       xclip -selection "clipboard" -i -r <<< '
alias cz='        ccze -m ansi'
alias decl='      declare -f'
alias doren='     perl-rename -v'
alias e='         manage_emacs.sh -n'
alias ebash='     nvim -c "Buffers" "${HOME}/bashrc_files/"* "${HOME}/.bashrc" "${HOME}/.bash_profile" ; source "${HOME}/.bashrc"'
alias emime='     nvim "${HOME}/.config/mimeapps.list"'
alias fontget='   fc-list -v | grep -i '
alias g='         grep -Pi'
alias gd='        printf "%s" "${PWD}" | xclip -selection "clipboard"'
alias getkeysall='xmodmap -pke'
alias getmonospacefonts='fc-list :spacing=100 | grep -i '
alias git_mt='    git log --pretty=format:"%h %s" --graph'
alias gital='     git log --source --all -S'
alias gitig='     git status --ignored'
alias gport='     netstat -lntu | grep -Pi'
alias gr='        grep --file="-" -Pin "${HOME}/.bashrc" "${HOME}/bashrc_files/"* <<<'
alias grf='       grep --file="-" -Fin "${HOME}/.bashrc" "${HOME}/bashrc_files/"* <<<'
alias htmlcheck=' xmllint --html'
alias i3gr='      grep --file="-" -Pri "${HOME}/.config/i3/"   <<< '
alias img='       nsxiv -0'
alias ldi='       fdisk -l -o +uuid'
alias list_coms=' compgen -c'
alias mdview='    markdown_view_w3m "$( fd -tf ".*[.]md" | fzf)"'
alias nf='        fzf_edit'
alias pad='       perl -pe '
alias pgr='       $PAGER'
alias pifs='      printf "\n_%q_\n\n" "${IFS}"'
alias pp='        procs'
alias quickren="  perl-rename -v 's/[^0-9a-zA-Z.]/_/g'"
alias r='         \rg --pcre2 -i'
alias ren='       renamer'
alias rifs="      IFS=$' \t\n'"
alias rml='       rmlint --no-followlinks --keep-all-tagged --no-crossdev --paranoid --progress --types="duplicates"'
alias sap='       apropos'
alias sctl='      journalctl | ccze -m ansi'
alias snv='       sudoedit'
alias szof='      du -axhc --time --max-depth=1 | sort -h'
alias szofall='   du -ahc  --time --max-depth=1'
alias t='         trash-put'
alias tracenet='  strace'
alias upfonts='   fc-cache -f -v; echo $?'
alias v='         sc-im'
alias wh='        whereis'
alias xf='        xdg-open "$(fzf --preview="ctpv {}")"'
alias xr='        echo ""; nvim "${HOME}/.Xresources"; xrdb "${HOME}/.Xresources"'
alias ydl='       yt-dlp'
alias ysb='       source "${HOME}/.bashrc"'
alias ystream='   stream_ytdl_mpv'
#-    q #
#-    u #
#alias m='         mimetype'
#alias x='         xdg-open'
#alias y='         source .venv/bin/activate'
#alias G='         grep -F'
#alias M='         ./manage.py'
#alias O='         open_prog'
#alias a='         get_alias_fzf'
#alias xprattach=' nohup /usr/bin/xpra attach :${XPRA_DISPLAY_NUMBER} &'
#alias key_spec='      evemu-describe'
#alias springmr='  mvn spring-boot:run'
#alias capkey='    xev | grep -Pio '\''(keysym [^)]*)'\'
#alias atspikill=' killall at-spi2-registryd; killall at-spi2-bus-launcher; killall at-spi-registryd; killall at-spi-bus-launcher'
#alias fnsc='      (read _z; $EDITOR <(xlsfonts | grep -F -- "--0-0-0-0-" | grep -Pi -- "${_z:-''}")) <<<'
#alias i3c='       i3 -C "$HOME/.config/i3/config"'
#alias isport='    (read _z; ss -lp "sport = :${_z}") <<< '
#alias gg='        grep -P -r -i'
#alias ic='        clear; imgcat'
