

let g:paredit_leader     = '['          "[
let g:slimv_impl         = 'sbcl'       "sbcl
let g:slimv_leader       = '\'         "\
let g:slimv_menu         = 1            "enable slimv menu
let g:slimv_repl_name    = 'cl-repl'    "repl buffer name
let g:slimv_repl_split   = 3            "split left
let g:slimv_repl_syntax  = 1            "enable syntax highlighting in repl
let g:slimv_swank_path   = expand('~/quicklisp/slime-helper.el')

"fu! SetReplMappings() 
"    echo "HI"
"endfu
"
"autocmd Filetype commonlisp call SetReplMappings()
"let g:slimv_swank_cmd = '! kitty -e sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &'

" ------------------------------------------- INFO -------------------------------- "
"                                                             *g:slimv_repl_split*  "
"  Open the Lisp REPL buffer in a split window or in a separate buffer in Vim.      "
"  The default is to use split window. If you prefer having REPL being in a hidden  "
"  buffer then set this option to zero. This way the REPL buffer will be opened     "
"  at the first evaluation, but any subsequent evaluation will be performed         "
"  silently, with the REPL buffer kept hidden.                                      "
"                                                                                   "
"  It is also possible to define the desired split direction. The following         "
"  values may be used for |g:slimv_repl_split|:                                     "
"                                                                                   "
"      0: no split                                                                  "
"      1: horizontal split above (default)                                          "
"      2: horizontal split below                                                    "
"      3: vertical split left                                                       "
"      4: vertical split right                                                      "
"                                                                                   "
" --------------------------------------------------------------------------------- "
