
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
    let l:bufn = bufnr("previewmark")

    if a:flag == "q" | bdelete! l:bufn | return | endif

    let l:temp_file = WritePreview()
    if l:bufn != -1
        call chansend(l:bufn, "\<C-r>")
    else
        vsplit
        execute ":terminal lynx " . l:temp_file
        file previewmark
        execute ":norm \<c-w>h"
    endif
endfu

nnoremap <leader>x  :%!pandoc -t commonmark_x<CR>
"nnoremap <leader>o  :vsplit +file g:bufname_preview<esc>:terminal(pandoc % \| lynx -stdin)<esc><c-W>h
nnoremap <leader>o  :silent call PreviewMarkdown()<esc>
"nnoremap <leader>O  :!qutebrowser expand(
"nnoremap <leader>O
