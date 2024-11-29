
let s:slb=[
\ '####################',
\ '( #-START-SUBSHELL-#',
\ '####################',
\]

let s:sle=[
\ '####################',
\ ') #---END-SUBSHELL-#',
\ '####################',
\]

let g:subshell_begin=join(s:slb, "\n")
let g:subshell_end=join(s:sle, "\n")

nnoremap <buffer> <leader>Sb :put =g:subshell_begin<esc>
nnoremap <buffer> <leader>Se :put =g:subshell_end<esc>
