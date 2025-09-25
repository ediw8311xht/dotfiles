
"-------------------- vlime --------------------------"
"let g:vlime_leader   = "~"
let g:paredit_leader='['
let g:vlime_leader   = "\\"
let g:vlime_window_settings = {
            \ "sdlb": { "pos": "belowleft", "size": 20, "vertical": v:false },
            \ "repl": { "pos": "topleft",   "size": 20, "vertical": v:false },
\ }
let g:vlime_contribs = ['SWANK-ASDF', 'SWANK-PACKAGE-FU',
                      \ 'SWANK-PRESENTATIONS', 'SWANK-FANCY-INSPECTOR',
                      \ 'SWANK-C-P-C', 'SWANK-ARGLISTS', 'SWANK-REPL',
                      \ 'SWANK-FUZZY', 'SWANK-TRACE-DIALOG']
"let g:vlime_cl_impl  = "ros"
"function! VlimeBuildServerCommandFor_ros(vlime_loader, vlime_eval)
"    return ["ros", "run",
"                \ "--load", a:vlime_loader,
"                \ "--eval", a:vlime_eval]
"endfunction
