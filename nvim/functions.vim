
fu! CorrectColors()
    if ! empty($DISPLAY)
        "hi Comment      gui=NONE guibg=#444444 guifg=#000000
        hi Comment          gui=italic guifg=#005FEF guibg=NONE
    else
        hi Comment          gui=italic guifg=#005FEF guibg=NONE
    endif
    hi ColorColumn          gui=NONE    guibg=#222222   guifg=NONE
    hi CursorLine           gui=bold    guibg=#111111   guifg=NONE
    hi CursorLineNr         gui=NONE    guibg=NONE      guifg=#FFFF00
    hi DiagnosticError                  guifg=#000000   guibg=#990000 
    hi DiagnosticHint                   guifg=#000000   guibg=#888888 
    hi DiagnosticInfo                   guifg=#000000   guibg=#AAAAAA 
    hi DiagnosticWarn                   guifg=#000000   guibg=#AA8500 
    hi EndOfBuffer          gui=NONE    guifg=#333333   guibg=NONE
    hi ExtraWhiteSpace      gui=NONE    guibg=#0099FF   
    hi FoldColumn           gui=italic  guibg=NONE      guifg=#00FF00
    hi Folded               gui=italic  guibg=NONE      guifg=#777777
    hi GitSignsAdd                      guifg=#00DD00                 
    hi IncSearch            gui=NONE    guibg=#FF0000   guifg=#000000
    hi lCursor              gui=NONE    guibg=NONE      guifg=NONE
    hi LineNrAbove          gui=NONE    guibg=#000000   guifg=#00AAFF
    hi LineNr               gui=NONE    guibg=#000000   guifg=#CCCCCC
    hi MarkSignNumHL        gui=NONE    guibg=NONE      guifg=NONE
    hi MarkSignVirtTextHL   gui=NONE    guibg=NONE      guifg=#00FF00
    "hi ModeMsg              gui=NONE    guibg=#00ff00   guifg=#000087 
    "hi MoreMsg              gui=NONE    guibg=NONE      guifg=#5fffff 
    "hi NonText              gui=NONE    guibg=NONE      guifg=#00FF00 
    "hi Normal               gui=NONE    guibg=NONE      guifg=#D0D0D0
    hi Search               gui=NONE    guibg=#FF00FF   guifg=#000000
    hi StatusLine           gui=NONE    guibg=NONE      guifg=#229922
    hi StatusLineNC         gui=NONE    guibg=NONE      guifg=#999999
    hi TabLine              gui=NONE    guibg=NONE      guifg=#999999
    hi TabLineSel           gui=NONE    guibg=NONE      guifg=#00FF00
    hi TermCursor                       guibg=NONE      guifg=#00AA00 
    hi HLspStatus           gui=NONE    guibg=NONE      guifg=#00FF00
    hi HStatusFullFile      gui=NONE    guibg=NONE      guifg=#999999
    hi WinSeparator         gui=NONE    guibg=NONE      guifg=#009900
    "------------------------SPELLING---------------------------#
    hi SpellBad gui=undercurl guisp=#FF0000 guibg=NONE guifg=#AAAAAA
    hi ModeMsg guifg=#000000 guibg=#009900 gui=NONE cterm=NONE
    "hi MoreMsg guifg=#5fffff guibg=NONE gui=NONE cterm=NONE
    "hi NonText guifg=#d787d7 guibg=NONE gui=NONE cterm=NONE
    "hi StatusLine guifg=#000087 guibg=#5fffff gui=NONE cterm=NONE
    "-----Sign Column-----"
        hi SignColumn       gui=NONE    guibg=NONE      guifg=NONE
        hi CursorLineSign   gui=NONE    guibg=#000022   guifg=#000000
    "-----Which Key-----"
        hi  WhichKey                    guibg=NONE      guifg=#22FF22 
        hi  WhichKeyNormal              guibg=NONE      guifg=#00FF00 
        hi  WhichKeyFloat               guibg=NONE      " guifg=#000000 
        hi  WhichKeyGroup               guibg=NONE      " guifg=#000000 
        hi  WhichKeySeparator           guibg=NONE      " guifg=#000000 
        hi  WhichKeyDesc                guibg=NONE      " guifg=#BBBBBB 
        "hi WhichKeyBorder              guibg=#999999   guifg=#777777 
        hi  WhichKeyValue   gui=italic guibg=NONE   guifg=#777777 
    "-----Floaterm-----"
        hi Floaterm                     guibg=#000000
        hi FloatermBorder               guibg=#000000   guifg=#000000
    "------------------------Tree-Sitter------------------------#
        "hi @module                                      guifg=#00FF00 
        "hi @keyword                                     guifg=#777777 
        "hi @keyword.function                            guifg=#009900
        "hi @function                                    guifg=#00AAAA
    "------------------------LSP-CPP----------------------------------"
        "hi @lsp.type.variable.cpp=NONE
        hi clear @lsp.mod
    "-----Markdown--------"
        "hi Title gui=bold guifg=green
        hi @markup.heading.1.markdown gui=bold,underdouble  guibg=#000000 guifg=#00FFFF guisp=#000000
        hi @markup.heading.2.markdown gui=bold,underline    guibg=#000000 guifg=#00DDDD
        hi @markup.heading.3.markdown gui=bold              guibg=#000000 guifg=#00AAAA
        hi @markup.heading.4.markdown gui=bold              guibg=#000000 guifg=#009999
        hi @markup.heading.5.markdown gui=bold              guibg=#000000 guifg=#009900
        hi @markup.heading.6.markdown gui=bold              guibg=#000000 guifg=#004400
        "hi @markup.heading.7.markdown gui=bold              guibg=#999900 guifg=#000000
        "
        "hi @markup.heading.markdown   gui=bold              guibg=#444444 guifg=#000000
        "
        "hi @markup.raw.markdown_inline gui=bold guibg=#111111   guifg=#00FF00
        "hi @conceal.markdown_inline    gui=NONE guibg=NONE      guifg=#009900
        "hi @markup.link.label.markdown_inline gui=NONE guifg=#009999
        "hi @markup.link.markdown_inline         gui=NONE
        "hi @markup.link.url.markdown_inline     gui=NONE
        "hi @_label.markdown_inline              gui=NONE
        "hi @_url gui=NONE
        "hi @_url.markdown_inline gui=NONE
        "hi @nospell.markdown_inline gui=NONE
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

fu! CyBack(nextprevious)
    let lenny = len(g:MyColorTable)
    let i = 0
    let current_background = synIDattr(hlID("Normal"), "bg")
    if current_background == ""
        "CATCH NO BACKGROUND (Transparency)
        let current_background="NONE"
    endif
    while i < lenny
        if current_background ==? g:MyColorTable[i][0]
            let j = (i + a:nextprevious + lenny) % lenny
            execute "highlight Normal guibg=" . g:MyColorTable[j][0]
            execute "highlight Normal guifg=" . g:MyColorTable[j][1]
            echo j . ' / ' . (lenny-1)
            syntax on
            return
        endif
        let i += 1
    endwhile
endfu

fu! SetScheme(scheme)
    execute "colorscheme " a:scheme[0]
    if a:scheme[1] != '.'
        execute a:scheme[1]
    endif
endfu

fu! SetColScheme(nextprevious)
    " current color scheme let g:colors_name
    let l:i = 0
    let l:length = len(g:MySchemes)
    for [l:color, l:specs] in g:MySchemes
        if g:colors_name ==? l:color
            let l:j = (l:i + (a:nextprevious)) % l:length
            echo g:MySchemes[ l:j ][0] . ' - ' . l:j '/' . (l:length - 1)
            call SetScheme(g:MySchemes[j])
            syntax on
            return
        endif
        let l:i += 1
    endfor
    call SetScheme(g:MySchemes[j])
endfu

fu! TogVE() 
    call Toggle(&ve, "none", "set ve=all \| echo &ve", "set ve=none \| echo &ve")
endfu
fu! TogSL()
    call Toggle(&ls, 0, "set ru \| set ls=2", "set noru \| set ls=0")
endfu
fu! TogCC()
    call Toggle(&cc, 0, "set cc=80", "set cc=0")
endfu

fu! Toggle(c1, c2, r1, r2)
    if a:c1 == a:c2
        execute a:r1
    else
        execute a:r2
    endif
endfu

fu! Cycle(checkarr, cvar, doarr, nextprevious)
    let l:lenny = len(a:checkarr)
    let l:i = 0
    while l:i < lenny
        if a:checkarr[i] ==? a:cvar
            let l:j = (l:i + (a:nextprevious)) % l:lenny
            execute a:doarr[l:j]
            return
        endif
        let l:i += 1
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

fu! GMaps()
    :redir! > /tmp/nvim_mappings.txt
    :silent imap
    :silent nmap
    :silent vmap
    :redir END
    :e /tmp/nvim_mappings.txt
endfunction

fu! ClipBoardExit()
    if executable("xclip")
        call system('xclip -selection clipboard -i -r <<< ', getreg('a'))
    endif
endfunction

fu! LspStatus() abort
    if luaeval('#vim.lsp.get_clients(bufnr) > 0')
        return luaeval("require('lsp-status').status()")
    endif
    return ""
endfu

fu! FilePathFull()
    " gonna add this later to make file argument get from current path
        "fu! FilePathFull(file_arg=v:false)
        "let l:file = a:file_arg == v:false ? expand("%:p:h") : a:file_arg
    return substitute(expand("%:p:h"), '\V' . $HOME, "~", "")
endfu

fu! GetHL()
    let l:synid = synID(line("."), col("."), 1)
    if l:synid != 0
        echo synIDattr(synIDtrans(l:synid), "name")
    else
        :Inspect
    end
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

