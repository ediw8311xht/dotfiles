
let g:loaded_mark_preview = 0

fu! MakeSafe(f)
    return substitute(a:f, '[/.]', '\\%', 'g')
endfu

fu! WritePreview()
    let l:temp_file = '/tmp/' . MakeSafe(expand('%:p')) . ".html"
    echo l:temp_file
    execute "!pandoc % > " . l:temp_file
    return l:temp_file
endfu

fu! PreviewMarkdown(flag = "")
    let l:temp_file = WritePreview()

    if a:flag == "q" 
        execute ":silent !qutebrowser " . l:temp_file
    elseif a:flag == "b" 
        execute ":silent !${BROWSER} " . l:temp_file
    elseif g:loaded_mark_preview == 0
        execute ":vertical:T lynx " . l:temp_file
        let g:loaded_mark_preview = 1
    else
        execute ":vertical:Topen"
        execute ":T \<c-r>"
    endif
endfu

nnoremap <leader>x  :%!pandoc -t commonmark_x<CR>
nnoremap <leader>oo :silent call PreviewMarkdown()<esc>
nnoremap <leader>oq :silent call PreviewMarkdown("q")<esc>
nnoremap <leader>ob :silent call PreviewMarkdown("b")<esc>
