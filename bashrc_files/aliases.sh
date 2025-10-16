#!/bin/bash

#--------------------------------------------------commands------------------------------#
alias_with_completion cp        'cp'        '-i'                                                                     
alias_with_completion free      'free'      '-h'                                                                     
alias_with_completion grep      'grep'      '--colour="auto" --group-separator="===================================" '
alias_with_completion info      'info'      '--vi-keys'                                                              
alias_with_completion ls        'ls'        '--color="auto"'                                                         
alias_with_completion mv        'mv'        '-i'                                                                     
alias_with_completion pacman    'pacman'    '--color="auto"'                                                         
alias_with_completion snv       'sudoedit'                                                                           
alias_with_completion systemctl 'systemctl' '--no-pager'                                                             
alias_with_completion yay       'yay'       '--color="auto"'                                                         
alias sudo='sudo -v; sudo '
#--------------------------------------------------quick---------------------------------#
# lower
alias b=' cd         "${BIN}"'
alias c=' myfzf'
alias d=' \df -h     | ccze -m ansi'
alias h=' cd         "${HOME}"'
alias l=' cd_from_lf' # my lf, so it cd's shell after exiting lf
# alias n=' lsd        --group-directories-first -t  -r --icon="never" --permission="octal" --date=+" %l:%M%P %y %m %_d " --blocks="permission,user,date,size,name"'
alias_with_completion rm 'rm' '-i'
alias_with_completion p 'ps'        'ax | grep -Pi'
alias_with_completion r '\rg'       '--pcre2 -i'
alias_with_completion s 'sad'       '--pager never'
alias_with_completion t 'trash-put'
alias_with_completion v 'kitty'     'icat' # view image in terminal
alias_with_completion y 'rlwrap'    'sbcl'
# upper
alias C=' cd         ..'
alias D=' \df -h     | grep -Po "^[ ]*[/]dev[/].*" | ccze -m ansi'
alias H=' show_help'
# alias L=' ls++'
alias_with_completion B 'bat'
alias_with_completion F 'readlink'   '-f'
alias_with_completion G 'grep'      '-Pi'
alias_with_completion L 'ls++'
alias_with_completion P 'pacman'    '--color="auto"'
alias_with_completion S 'systemctl' '--no-pager'
alias_with_completion T 'task'
alias_with_completion V 'viu' # view fitted image in terminal
alias_with_completion Y 'yay'       '--color="auto"'
#--------------------------------------------------utilities-----------------------------#
# alias ally='      my_alias_function'
# alias g='         g -l --time-style=+"%-2m  %-2d | %Y" --dir-first --table --table-style=unicode'
alias_with_completion g   'g'       '-l --time-style=+"%-2m  %-2d | %Y" --dir-first --table --table-style=unicode'
alias_with_completion ll  'lsd'     ' --group-directories-first --icon="never" -rt --permission="octal"  --date=+" [ %_H:%M:%S | %a | %D ]" --blocks="permission,user,date,name"'
alias_with_completion ren 'renamer'
alias_with_completion sap 'apropos'
#shellcheck disable=SC2016
alias_with_completion se 'plocate' '--database="${LOCATE_DATABASE}" --regex'
alias_with_completion tracenet 'strace'
alias_with_completion gg 'g' ' --sort="time-descend"'
alias_with_completion g_s 'g' ' --sort=size'
alias ac='        compgen -c  | grep -x'
alias ac_full='   alias_conflict --full'
alias ac_part='   alias_conflict'
alias_with_completion key 'showkey' ' -k'
alias_with_completion nsx 'nsxiv' ' -a -0'
alias_with_completion pgr "${PAGER}"
alias ysb='       source "${HOME}/.bashrc"' # reload config
# alias pgs='       pgrep'
#--------------------------------------------------expac---------------------------------#
alias ex_space='   expac -HM "%m %n" | sort -n'           # Size of packages pacman
alias ex_last='    expac --timefmt="%Y %m %d %R" "%l -- %n" | sort | grep'
alias ex_opt='     expac -Qv -l "\n\t" "%n:\n\t%O"'
alias ex_dep='     expac -Qv -l "\n\t" "%n:\n\t%D"'
alias ex_pacdep='  expac -l "\n" "%D"'
alias ex_pacopt='  expac -l "\n" "%o"'
#--------------------------------------------------yay-----------------------------------#
#alias Y_search='       yay     -Ss'
#alias Y_info='         yay     -Si'
#alias Y_stats='        yay     -P --stats'
#alias Y_local='        yay     -Qi'
#alias Y_search_local=' yay     -Qs'
#alias Y_from='         yay     -Qo'
#alias Y_list_files='   yay     -Qql'
#alias Y_aur_list='     yay     -Sl aur | grep "Installed"'
#alias Y_all='          yay     -Sl | grep -Pio         ".*(?=\[installed\])"'
#--------------------------------------------------pacman--------------------------------#
alias_with_completion pac_tree 'pactree' '--color'          #Pacman Dependencies
alias_with_completion pacse    'pacman'  '-Ss'              #Search
alias_with_completion paci     'pacman'  '-Si'              #Package Info
alias_with_completion pacdep   'pacman'  '-T'               #Dependencies
alias_with_completion pacneed  'pacman'  '-Qet'
alias_with_completion pacprog  'pacman'  '-F'
alias_with_completion paclocal 'pacman'  '-Qm'
alias_with_completion pacsel   'pacman'  '-Qs'
alias_with_completion pacil    'pacman'  '-Qi'
alias_with_completion pacfrom  'pacman'  '-Qo'
alias_with_completion pacf     'pacman'  '-Fl'
alias pac_all='   expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <({ pacman -Qqg xorg; expac -l "\n" "%E" base; } | sort -u)) | sort -n'
alias pacool='    pacman -Sl | grep -Fi  "[installed]" | grep -i'
alias pacnot='    pacman -Sl | grep -vFi "[installed]" | grep -i'
alias pacfiles='  list_files_pac'
#--------------------------------------------------cd------------------------------------#
# quick #
alias cu='          myfzf u'
alias desk='        cd     "${DESKTOP}"'
alias docs='        cd     "${DOCUMENTS}"'
alias down='        cd     "${DOWNLOADS}"'
alias pics='        cd     "${PICTURES}"'
alias vids='        cd     "${VIDEOS}"'
# rest  #
alias c_back='      cd     "${HOME}/BACKUP_FILES"'
alias c_clone='     fzf_cd -d                           "${CLONED}"          -u -d1'
alias c_code='      fzf_cd -d                           "${CODING}"          -u -d4'
alias c_conf='      fzf_cd -d                           "${XDG_CONFIG_HOME}" -u -d1'
alias c_inf='       fzf_cd -d                           "${MY_INFORMATION}"  -u -d1'
alias c_nvimc='     cd     "${HOME}/.config/nvim"'
alias c_nvimlocal=' cd     "${HOME}/.local/share/nvim"'
alias c_walls='     cd     "${WALLPAPERS}"'
#--------------------------------------------------edit----------------------------------#
alias E_code='    fzf_open "${CODING}"'
alias E_conf='    fzf_open "${XDG_CONFIG_HOME}"'
#--------------------------------------------------copy----------------------------------#
alias copy_text='     xclip -selection "clipboard" -i -r <<<'
alias copy_file='     xclip -selection "clipboard" -i -r'
alias copy_cwd='      printf "%s" "${PWD}" | xclip -selection "clipboard"'
alias copy_img='      clipboard_copy_image.sh'
alias copy_fimg='     clipboard_copy_image.sh --fzf'
# alias copy_command_output=' '
#--------------------------------------------------config-edit---------------------------#
# alias e_xrec='    echo ""; nvim "${HOME}/.Xresources"; xrdb -override "${HOME}/.Xresources"'
#--------------------------------------------------find----------------------------------#
alias gf='        fd --search-path "/" -u --mount'
#--------------------------------------------------Python--------------------------------#
alias py_heredoc=' python <<EOF'
alias_with_completion py      'python'  
alias_with_completion py_i    'ipython' 
alias_with_completion py_venv 'source   .venv/bin/activate'
#--------------------------------------------------ps------------------------------------#
alias pse='       ps -eo comm=, | grep --ignore-case'
alias pso='       ps -eo cmd=, | grep --ignore-case'
alias_with_completion tret 'ps' ' -ejH'
alias_with_completion tres 'ps' ' -eHo euser,ruser,suser,fuser,f,comm,label'
alias trev='      ps axjf'
#--------------------------------------------------man-----------------------------------#
alias_with_completion man_search_for 'man'  '-f'
alias_with_completion man_search_in  'man'  '-K --regex'
#--------------------------------------------------nvim----------------------------------#
alias nv='      nvim'
alias nv_chad=' NVIM_APPNAME="NVIM_CHAD" nvim'
alias nv_cwd_files='    fd . --exact-depth 1 --exclude "*.o" -tf -0 -X nvim -c "Buffers"'
alias nv_s='    nvim +"AutoSession search"'
alias nv_cpp='    fd . --case-sensitive --exact-depth 1 -e C -e cpp -e h -tf -0 -X nvim -c "Buffers"'
#--------------------------------------------------lisp----------------------------------#
# alias vlime_start='        rlwrap sbcl   --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp'
# alias vlime_start_dspace=' rlwrap sbcl   --dynamic-space-size 4096 --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp'
# alias vlime_stop='         pkill  vlime'
alias slimv_start=' rlwrap sbcl --load "${XDG_DATA_HOME}/nvim/plugged/slimv/slime/start-swank.lisp"'
alias rlsp=' sbcl --script'
#--------------------------------------------------yt-dlp--------------------------------#
alias yda='       yt-dlp --extract-audio --audio-format "mp3"'
alias ydt='       yt-dlp --ignore-config --skip-download --write-subs --write-auto-subs --sub-lang en --output "$VIDEOS/transcripts/%(title)s%(ext)s"'
alias yd='        yt-dlp'
#--------------------------------------------------fzf-openers---------------------------#
alias o_nv='        fzf_edit'
alias o_xdg='     xdg-open "$(fzf --preview="ctpv {}")"'
alias o_rg='      source "${HOME}/bin/rg_fzf.sh"'
#--------------------------------------------------size----------------------------------#
alias szof='      du -axhc --time --max-depth=1 | sort -h'
alias szofall='   du -ahc  --time --max-depth=1'
#--------------------------------------------------search-in-----------------------------#
alias s_bash='    grep --file="-" -Pin "${HOME}/.bashrc" "${HOME}/.profile" "${HOME}/.bash_profile" "${HOME}/bashrc_files/"*.sh <<<'
alias s_bashf='   grep --file="-" -Fin "${HOME}/.bashrc" "${HOME}/bashrc_files/"* <<<'
alias s_i3='      grep --file="-" -Pri "${HOME}/.config/i3/"   <<< '
alias s_nv='    fd . -tf "${XDG_CONFIG_HOME}/nvim/" -x rg -H -u --color="always" -Pi'
#--------------------------------------------------ifs-----------------------------------#
alias ifs_print=' printf "\n_%q_\n\n" "${IFS}"'
alias ifs_reset=" IFS=$' \t\n'"
#--------------------------------------------------TaskWarrior---------------------------#
alias t_l='        task list'
alias tw='        taskwarrior-tui'
alias t_cal="task calendar"
alias t_proj="task projects"
alias t_=""
#----------------------------------------------------------------------------------------#
alias vid='       open_mpv'
alias alas_np='   alias -p | grep -Pio "^[ \t]*alias[ \t]*\K[^=]*" | column'
alias bgsz='      szof | grep -P "^[^ ]*G"'
alias font_get='   fc-list -v | grep -i '
alias font_get_latex=' fc-list :outline -f "%{family}\n"' # https://tex.stackexchange.com/questions/12881/how-to-get-a-list-of-all-available-ttf-fonts-with-xetex
alias mdview='    markdown_view_w3m "$( fd -tf ".*[.]md" | fzf)"'
alias pkg_inf='   pkgfile_lib_info'
alias rml='       rmlint --algorithm="blake2bp" --types="duplicates" --rank-by="D" --no-crossdev --keep-all-tagged --no-followlinks --progress'
alias ystream='   stream_ytdl_mpv'
#--------------------------------------------------temp-removed--------------------------#
# alias fvid='      open_mpv --fzf'
# alias pips='      poetry search'
# alias pipf='      pip freeze'
# alias pipsl='     pip list | grep -i'
# alias pip3sl='    pip3 list | grep -i'
#--------------------------------------------------removed-------------------------------#
#--------------------------------------------------df------------------------------------#
#--------------------------------------------------lf------------------------------------#
# #--------------------------------------------------elixir--------------------------------#
# # alias i='         iex' # elixir
# alias iexm='      iex -S mix'
# alias dial='      mix dialyzer'
# alias iexp='      iex -S mix phx.server'
# alias mixf='      mix format'
# alias mixc='      mix compile'
# alias iexm='      MIX_ENV=test iex -S mix'

# #--------------------------------------------------other---------------------------------#

# alias sctl='      journalctl | ccze -m ansi'
# alias wh='        whereis'
# alias upfonts='   fc-cache -f -v; echo $?'
# alias list_coms=' compgen -c'
# alias gport='     netstat -lntu | grep -Pi'
# alias gitig='     git status --ignored'
# alias gital='     git log --source --all -S'
# alias git_mt='    git log --pretty=format:"%h %s" --graph'
# alias getmonospacefonts='fc-list :spacing=100 | grep -i '
# alias getkeysall='xmodmap -pke'
# alias e='         manage_emacs.sh -n'
# alias quickren="  perl-rename -v 's/[^0-9a-zA-Z.]/_/g'"
# alias htmlcheck=' xmllint --html'
# alias ldi='       fdisk -l -o +uuid'
# alias ncde='      cd "${CODING}"; nf'
# alias nsbwp='     cd "${HOME}/.mynvim/"'
#alias listaudio=' fd . -tf -e mp3 -e flac'
#alias listpics='  fd . -tf -e jpg -e jpeg -e png -e tiff -e webp -e bmp -e avif -e ico -e gif -e gifv'
#alias listvids='  fd . -tf -e mov -e m4v -e mkv -e mpeg -e mp4 -e mpv -e webm -e avi -e amv'
#alias listmedia=" listaudio; listpics; listvids"
    #alias djs='       python manage.py runserver'
    #alias tjs='       python manage.py test'
    #alias py='        clear; python3'
    #alias pe='        ps -eo comm=,'
    #alias po='        ps -eo cmd=,'
#alias z='         zathura --fork'
#alias kld='       kalker --angle-unit deg'
#alias klr='       kalker --angle-unit rad'
# alias cz='        ccze -m ansi'
# alias decl='      declare -f'
# alias doren='     perl-rename -v'
# alias pad='       perl -pe '
# alias pp='        procs'
# alias rml='       rmlint --no-followlinks --keep-all-tagged --no-crossdev --paranoid --progress --types="duplicates"'
# alias v='         sc-im'
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

