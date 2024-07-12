
fu! CorrectColors()
    if ! empty($DISPLAY)
        "hi Comment      gui=NONE guibg=#444444 guifg=#000000
        hi Comment      cterm=ITALIC ctermbg=160 ctermfg=18 gui=ITALIC guifg=#005FEF guibg=NONE
    else
        hi Comment      cterm=ITALIC ctermbg=160 ctermfg=18 gui=ITALIC guifg=#005FEF guibg=NONE
    endif
    hi ColorColumn        cterm=NONE    ctermbg=NONE  ctermfg=NONE  gui=NONE   guibg=#222222 guifg=NONE
    hi CursorLine         cterm=BOLD    ctermfg=NONE  ctermbg=18    gui=BOLD   guibg=#090909 guifg=NONE
    hi CursorLineNr       cterm=BOLD    ctermfg=NONE  ctermbg=18    gui=NONE   guibg=NONE    guifg=#FFFF00
    hi ExtraWhiteSpace    cterm=NONE    ctermbg=gray  ctermfg=NONE  gui=NONE   guibg=#0099FF
    hi FoldColumn         cterm=NONE    ctermbg=NONE  ctermfg=NONE  gui=ITALIC guibg=NONE    guifg=#00FF00
    hi Folded             cterm=NONE    ctermbg=NONE  ctermfg=NONE  gui=ITALIC guibg=NONE    guifg=#777777
    hi IncSearch          cterm=NONE    ctermbg=white ctermfg=black gui=NONE   guibg=#FF0000 guifg=#000000
    hi LineNrAbove        cterm=NONE    ctermbg=NONE  ctermfg=NONE  gui=NONE   guibg=#000000 guifg=#00AAFF
    hi LineNr             cterm=NONE    ctermbg=NONE  ctermfg=NONE  gui=NONE   guibg=#000000 guifg=#AAAAAA
    hi MarkSignNumHL      gui=NONE      guibg=NONE    guifg=NONE
    hi MarkSignVirtTextHL gui=NONE      guibg=NONE    guifg=#00FF00
    hi Normal             ctermbg=black gui=NONE      guibg=NONE
    hi Search             cterm=NONE    ctermbg=white ctermfg=black gui=BOLD   guibg=#FF00FF guifg=#000000
    hi SignColumn         cterm=NONE    ctermbg=NONE  ctermfg=NONE  gui=ITALIC guibg=NONE    guifg=#000000
    hi StatusLine         cterm=NONE    ctermbg=NONE  ctermfg=160   gui=BOLD   guibg=#0099FF guifg=#000000
    hi StatusLineNC       cterm=NONE    ctermbg=NONE  ctermfg=160   gui=NONE   guibg=#555555 guifg=#000000
    hi TabLine            gui=NONE      guibg=#222222 guifg=#999999
    hi TabLineSel         gui=BOLD      guibg=#000000 guifg=#00FF00
    hi TermCursor         guibg=#000000 guifg=#00AA00
    hi DiagnosticError    guifg=#000000 guibg=#990000
    hi DiagnosticWarn     guifg=#000000 guibg=#AA8500
    hi DiagnosticInfo     guifg=#000000 guibg=#AAAAAA
    hi DiagnosticHint     guifg=#000000 guibg=#888888
    hi GitSignsAdd        guifg=#777777
    hi WhichKeyFloat      guifg=#000000 guibg=NONE
    hi WhichKey           guibg=NONE    guifg=#22FF22
    hi WhichKeyGroup      guifg=#000000 guibg=#555500
    hi WhichKeySeparator  guifg=#000000 guibg=#000000
    hi WhichKeyDesc       guifg=#BBBBBB guibg=#000000
    "hi WhichKeyBorder      guifg=#777777 guibg=#999999
    hi WhichKeyValue     guifg=#777777 guibg=#444400
    hi Floaterm guibg=#000000
    hi FloatermBorder guibg=#003377 guifg=#000000
    "------------------------Tree-Sitter------------------------#
    hi @module guifg=#00FF00
    hi @keyword guifg=#777777
    hi @keyword.function guifg=#009900 gui=BOLD
    hi @function guifg=#00AAAA gui=BOLD
    "hi @keyword.repeat guifg=#FF0000
endfu

fu! M_Map(maptype, keys, leader=0)
    for i in a:keys
        if a:leader == 1
            execute a:maptype.' <leader>'.i[0].' '.i[1]
        else
            execute a:maptype.' '.i[0].' '.i[1]
        endif
    endfor
endfu

fu! CycleBackground(nextprevious)
    let lenny = len(g:myBg)
    let i = 0
    let current_background = synIDattr(hlID("Normal"), "bg")
    if current_background == ""
        "CATCH NO BACKGROUND (Transparency)
        let current_background="NONE"
    endif
    for _ in g:myBg
        if current_background ==? _
            let j = (i + (a:nextprevious)) % lenny
            execute "highlight Normal guibg=" . g:myBg[j]
            execute "highlight Normal guifg=" . g:myFg[j]
            echo j . ' / ' . lenny
            syntax on
            return
        endif
        let i += 1
    endfor
endfu

fu! CycleColor(nextprevious)
    let i = 0
    let current_scheme = g:colors_name
    let lenny = len(g:myScheme)
    for _ in g:myScheme
        if current_scheme ==? _
            let j = (i + (a:nextprevious)) % lenny
            echo g:myScheme[j] . ' - ' . j '/' . (lenny - 1)
            execute "colorscheme " g:myScheme[j]
            execute g:mySpec[j]
            syntax on
            return
        endif
        let i += 1
    endfor
endfu

fu! Toggle(c1, c2, r1, r2)
    if a:c1 == a:c2
        execute a:r1
    else
        execute a:r2
    endif
endfu

"fu! M_LspState()
"    if luaeval('vim.inspect(vim.lsp.buf_get_clients()) == "{}"')
"        return 0
"    else
"        return 1
"    endif
"endfu
"
"fu! M_ToggleLsp()
"    if M_LspState() == 1
"        echo "Lsp Stopped"
"        LspStop()
"    else
"        echo "Lsp Starting"
"        LspStart()
"    endif
"endfun

fu! Cycle(checkarr, cvar, doarr, nextprevious)
    let lenny = len(a:checkarr)
    let i = 0
    while i < lenny
        if a:checkarr[i] ==? a:cvar
            let j = (i + (a:nextprevious)) % lenny
            execute a:doarr[j]
            return
        endif
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

