

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
            let j = (i + a:nextprevious) % lenny
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
    call SetScheme(g:MySchemes[0])
endfu

"let TogSL = {-> QuickToggle(&ls, 0, "set ru \| set ls=2", "set noru \| set ls=0") }
"let TogCC = {-> QuickToggle(&cc, 0, "set cc=80", "set cc=0") }
let TogVirtualEdit  = {-> QuickToggle(&virtualedit, "none", "set ve=all \| echo &ve", "set ve=none \| echo &ve") }
let TogLastStatus   = {-> VarToggle("laststatus"  , 2 , 0             ) }
let TogColorColumn  = {-> VarToggle("colorcolumn" , "0" , "80" , "window" ) }
let TogFoldColumn   = {-> VarToggle("foldcolumn"  , '0' , '2'  , "window" ) }

":setl[ocal] {option}<	Set the effective value of {option} to its global
"			value by copying the global value to the local value.
"let VarToggle = {var, v1, v2 -> execute("set ".."var="..v2) }
"" setbufvar(bufnr(), var, (var == v1 ? v1 : v2))  }

fu! VarToggle(var, v1, v2, type="global")
    if a:type == "window"
        let l:Get={svar->nvim_win_get_option(win_getid(), svar)}
        let l:Set={svar,sval->nvim_win_set_option(win_getid(), svar, sval)}
    else
        let l:Get={svar->nvim_get_option(svar)}
        let l:Set={svar,sval->nvim_set_option(svar, sval)}
    endif

    if l:Get(a:var) == a:v2
        call l:Set(a:var, a:v1)
    else
        call l:Set(a:var, a:v2)
    endif
    echo a:var.." = "..l:Get(a:var)
endfu

fu! QuickToggle(c1, c2, r1, r2)
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

