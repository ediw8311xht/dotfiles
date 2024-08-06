
source ${HOME}/.config/nvim/functions.vim

"----------------------------------
"-- Leader Bindings              --
"----------------------------------

"\[ 'zaf' ,    'gg/<C-r>0<esc>jVnkzf' ]
let g:bindings_l_noremap = [
\]

"\[ 'vf'  ,    '?<C-r>"<enter>'                                                                                                                                  ],
"\[ 'tcc' ,    ':tabclose<esc>'                                                                                                                                  ],
"\[ 'tf'  ,    ':tabfirst<esc>'                                                                                                                                  ],
"\[ 'tl'  ,    ':tablast<esc>'                                                                                                                                   ],
"\[ 'tm'  ,    ':tabmove'                                                                                                                                        ],
"\[ 'WC'  ,    ':BraceyStop<esc>'                                                                                                                                ],
"\[ 'WW'  ,    ':Bracey<esc>'                                                                                                                                    ],
let g:bindings_l_nnoremap = [
    \[ '<leader>' , '<C-^>'                                                                                                                                         ],
    \[ ','   ,    '<C-^>'                                                                                                                                           ],
    \[ ']'   ,    ':bnext<CR>:noh<esc><C-L>'                                                                                                                        ],
    \[ '['   ,    ':bprevious<CR>:noh<esc><C-L>'                                                                                                                    ],
    \[ '/'   ,    ':Explore<CR>'                                                                                                                                    ],
    \[ '-'   ,    '20<c-w><'                                                                                                                                        ],
    \[ '='   ,    '20<c-w>>'                                                                                                                                        ],
    \[ 'A'   ,    ':LspStart()<CR>'                                                                                                                                 ],
    \[ 'a'   ,    ':LspStop()<CR>'                                                                                                                                  ],
    \[ 'B'   ,    ':ls<CR>:b<Space>'                                                                                                                                ],
    \[ 'b'   ,    ':Buffers<esc>'                                                                                                                                   ],
    \[ 'cC'  ,    ':call Toggle(&colorcolumn, 0, "set colorcolumn=80", "set colorcolumn=0")<esc>', "toggles color column (Line length indicator)"                   ],
    \[ 'cc'  ,    ':set nocursorline!<esc>'                                                                                                                         ],
    \[ 'CH'  ,    ':checkhealth<esc>'                                                                                                                               ],
    \[ 'D'   ,    ':bdelete<esc><enter>'                                                                                                                            ],
    \[ 'df'  ,    ':%s/\s\+\ze$//gc<esc>'                                                        , "finds and optionally deletes extra space at end of line"        ],
    \[ 'e'   ,    ':set cursorcolumn!<esc>'                                                                                                                         ],
    \[ 'f'   ,    ':set wrap!<esc>'                                                                                                                                 ],
    \[ 'g'   ,    ':enew<esc>'                                                                                                                                      ],
    \[ 'Gm'  ,    ':call GetMappings()<CR>'                                                                                                                         ],
    \[ 'h'   ,    ':call Toggle(&ls, 0, "set ru \| set ls=2", "set noru \| set ls=0")<esc><C-L>'                                                                    ],
    \[ 'H'   ,    ':vert helpgrep '                                                                                                                                 ],
    \[ 'i'   ,    ':lua vim.diagnostic.open_float(nil, {focus=true, scope="cursor"})<CR>'                                                                           ],
    \[ 'I'   ,    ':lua require("lsp_lines").toggle()<CR>'                                                                                                          ],
    \[ 'j'   ,    ':call CycleColor(+1)<CR>'                                                     , "cycles color scheme (next)"                                     ],
    \[ 'J'   ,    ':call CycleColor(-1)<CR>'                                                     , "cycles color scheme (prev)"                                     ],
    \[ 'k'   ,    ':call CorrectColors()<CR>'                                                                                                                       ],
    \[ 'l'   ,    ':call CycleBackground(+1)<CR>'                                                                                                                   ],
    \[ 'L'   ,    ':call CycleBackground(-1)<CR>'                                                                                                                   ],
    \[ 'M'   ,    ':messages<esc>'                                                                                                                                  ],
    \[ 'N'   ,    ':cnext<esc>'                                                                                                                                     ],
    \[ 'n'   ,    ':next<esc>'                                                                                                                                      ],
    \[ 'ob'  ,    ':silent !${BROWSER}  %<CR>'                                                                                                                      ],
    \[ 'oq'  ,    ':silent !qutebrowser %<CR>'                                                                                                                      ],
    \[ 'q'   ,    ':bd'                                                                                                                                             ],
    \[ 's'   ,    ':source ~/.config/nvim/init.vim<esc>'                                                                                                            ],
    \[ 'tb'  ,    ':tabmove -1<esc>'                                                                                                                                ],
    \[ 'tn'  ,    ':tabmove +1<esc>'                                                                                                                                ],
    \[ 'T'   ,    ':term<esc>'                                                                                                                                      ],
    \[ 'tt'  ,    ':tabnew<esc>'                                                                                                                                    ],
    \[ 'u'   ,    ':Lf<esc>'                                                                                                                                        ],
    \[ 'vv'  ,    ':call Cycle(["none", "all", "block"], &ve, ["set ve=all \| echo &ve", "set ve=block \| echo &ve", "set ve=none \| echo &ve"], 0)<CR>'            ],
    \[ 'W'   ,    ':call Web("f")<esc>i'                                                                                                                            ],
    \[ 'w'   ,    ':w<esc>'                                                                                                                                         ],
    \[ 'X'   ,    ':!%:p '                                                                                                                                         ],
    \[ 'x'   ,    ':!%:p<esc>'                                                                                                                                      ],
    \[ 'y'   ,    ':hi Normal guibg=Transparent<esc>'                                                                                                               ],
    \[ 'ZC'  ,    ':bd<esc>'                                                                                                                                        ],
    \[ 'z'   ,    'z'                                                                                                                                               ],
\]
"\[ 'II'   ,    ':lua require("lsp_lines").toggle()<CR>'                                                                                                          ],
"\[ ';'   ,    ':ls<CR>:b<Space>'                                                                                                                                ],
"\[ 'X'   ,    ':w<esc>:!%:p '                                                                                                                                   ],
"\[ 'x'   ,    ':w<esc>:!%:p<esc>'                                                                                                                               ],

let g:bindings_l_vnoremap = [
    \[ 'm'   ,    ':!bc<esc>'            ],
    \[ 'M'   ,    ':!dc<esc>'            ],
    \[ 'vc'  ,    ':!column -o " " -t<enter>'   ],
    \[ 'vs'  ,    ':!sort -n<enter>'     ],
\]

call M_Map( "nnoremap" , g:bindings_l_nnoremap, 1)
call M_Map( "noremap"  , g:bindings_l_noremap,  1)
call M_Map( "vnoremap" , g:bindings_l_vnoremap, 1)


"    \[ 'oc'  ,    'q:iput=execute("")<esc>A<C-c>'                                                                                                                   ],
"    \[ 'op'  ,    'q:<C-p><esc>Iput =execute("<esc>A")<esc>A<C-c>'                                                                                                  ],
"    \[ 'ox'  ,    ':put =execute("<C-r>0")<esc>'                                                                                                                    ],
"    \[ 'vm'  ,    ':put =eval("<C-r>0")'                                                                                                                            ],
"    \[ 'vq'  ,    ':put =eval("<C-r>0")<esc>'                                                                                                                       ],
"    \[ 'out' ,    'q:iput =execute("<C-r>0")<esc>A<C-c>'                                                                                                            ],
"    \[ 'ZG'  ,    ':bd!<esc>'                                                                                                                                       ],

