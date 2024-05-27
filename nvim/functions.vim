
fu! CorrectColors()
    if ! empty($DISPLAY)
        hi Comment      gui=NONE guibg=#444444 guifg=#000000
    else
        hi Comment      cterm=ITALIC ctermbg=160 ctermfg=18 gui=ITALIC guifg=#0000FF guibg=NONE
    endif
    hi ColorColumn      cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=#222222 guifg=NONE
    hi ExtraWhiteSpace  cterm=NONE ctermbg=gray ctermfg=NONE    gui=NONE        guibg=#0099FF
    hi Normal                                   ctermbg=black   gui=NONE        guibg=NONE
    hi StatusLine       cterm=NONE ctermbg=NONE ctermfg=160     gui=NONE        guibg=#0077DD guifg=#000000
    hi StatusLineNC     cterm=NONE ctermbg=NONE ctermfg=160     gui=NONE        guibg=#555555 guifg=#000000
    hi FoldColumn       cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC      guibg=NONE    guifg=#00FF00
    hi Folded           cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC      guibg=NONE    guifg=#777777
    hi CursorLine       cterm=BOLD ctermfg=NONE ctermbg=18      gui=BOLD        guibg=#090909 guifg=NONE
    hi CursorLineNr     cterm=BOLD ctermfg=NONE ctermbg=18      gui=NONE        guibg=NONE    guifg=#FFFF00
    hi SignColumn       cterm=NONE ctermbg=NONE ctermfg=NONE    gui=ITALIC      guibg=NONE    guifg=#000000
    hi LineNr           cterm=NONE ctermbg=NONE ctermfg=NONE    gui=NONE        guibg=#000000 guifg=#AAAAAA
    hi LineNrAbove      cterm=NONE ctermbg=NONE ctermfg=NONE    gui=NONE        guibg=#000000 guifg=#00AAFF
    hi TabLine                                                  gui=NONE        guibg=#222222 guifg=#999999
    hi TabLineSel                                               gui=BOLD        guibg=#000000 guifg=#00FF00
    hi MarkSignNumHL                                            gui=NONE        guibg=NONE    guifg=NONE
    hi MarkSignVirtTextHL                                       gui=NONE        guibg=NONE    guifg=#00FF00
    hi IncSearch        cterm=NONE ctermbg=white ctermfg=black  gui=NONE        guibg=#FF0000 guifg=#000000
    hi Search           cterm=NONE ctermbg=white ctermfg=black  gui=BOLD        guibg=#FF00FF guifg=#000000
    hi TermCursor                                                               guibg=#000000 guifg=#00FF00
    "<--------------------------------COC----------------------------------->
    hi CocWarningHighlight      gui=UNDERLINE
    hi CocHintHighlight         gui=NONE        guibg=#00FFFF guifg=#000000
    hi CocInfoHighlight         gui=NONE        guibg=#00AA00 guifg=#000000
    hi CocDeprecatedHighlight   gui=NONE        guibg=#333333 guifg=#999900
    hi CocFadeOut               gui=NONE        guibg=#888888 guifg=#000000
endfu

fu! MyMap(maptype, keys, leader=0)
    for i in a:keys
        if a:leader == 1
            execute a:maptype.' <leader>'.i[0].' '.i[1]
        else
            execute a:maptype.' '.i[0].' '.i[1]
        endif
    endfor
endfu

fu! CycleBackground(nextprevious)
    let i = 0 | let current_background = synIDattr(hlID("Normal"), "bg")
    if current_background == ""
        let current_background="NONE"| "CATCH NO BACKGROUND (Transparency)
    endif
    let lenny = len(g:myBg)
    for _ in g:myBg
        if current_background ==? _
            let j = (i + (a:nextprevious)) % lenny
            execute "highlight Normal guibg=" . g:myBg[j]
            execute "highlight Normal guifg=" . g:myFg[j]
            echo j . ' / ' . lenny | syntax on | return
        endif
    let i += 1 | endfor
endfu

fu! CycleColor(nextprevious)
    let i = 0 | let current_scheme = g:colors_name
    let lenny = len(g:myScheme)
    for _ in g:myScheme
        if current_scheme ==? _
            let j = (i + (a:nextprevious)) % lenny
            echo g:myScheme[j] . ' - ' . j '/' . (lenny - 1)
            execute "colorscheme " g:myScheme[j]
            execute g:mySpec[j]
            syntax on
        return | endif
    let i += 1 | endfor
endfu

fu! Toggle(c1, c2, r1, r2)
    if a:c1 == a:c2
    execute a:r1 | return | endif
    execute a:r2
endfu

fu! Cycle(checkarr, cvar, doarr, nextprevious)
    let lenny = len(a:checkarr) | let i = 0
    while i < lenny
        if a:checkarr[i] ==? a:cvar
            let j = (i + (a:nextprevious)) % lenny
            execute a:doarr[j]
        return | endif
        let i += 1
    endwhile
endfu

fu! Web(url)
    enew
    call termopen('elinks "www.google.com"')
endfunction

fu! IndentHalfOrDouble(half_or_double)
    if a:half_or_double ==? "double"
        execute ':%s/  /    /g'
    else
        execute ':%s/    /  /g'
    endif
endfunction

fu! GetMappings()
    :redir! > /tmp/nvim_mappings.txt
    :silent imap
    :silent nmap
    :silent vmap
    :redir END
    :e /tmp/nvim_mappings.txt
endfunction

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ""
endfunction

