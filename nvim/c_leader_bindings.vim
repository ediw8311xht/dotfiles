
source ${HOME}/.config/nvim/c_functions.vim

"----------------------------------
"-- Leader Bindings              --
"----------------------------------

let g:bindings_l_noremap = [
    \[ 'zaf' ,    'gg/<C-r>0<esc>jVnkzf' ]
\]

let g:bindings_l_nnoremap = [
    \[ '<leader>' , '<C-^>' ],
    \[ 'a'   ,    ':call Toggle(g:coc_enabled, 0, ":CocEnable", ":call coc#float#close_all() \| :CocDisable")<esc>'                                                 ],
    \[ 'B'   ,    ':Buffers<esc>'                                                                                                                                   ],
    \[ 'b'   ,    ':ls<CR>:b<Space>'                                                                                                                                ],
    \[ ']'   ,    ':bnext<CR>:noh<esc><C-L>'                                                                                                                        ],
    \[ '['   ,    ':bprevious<CR>:noh<esc><C-L>'                                                                                                                    ],
    \[ ','   ,    '<C-^>'                                                                                                                                           ],
    \[ 'CH'  ,    ':checkhealth<esc>'                                                                                                                               ],
    \[ 'cc'  ,    ':set nocursorline!<esc>'                                                                                                                         ],
    \[ 'cC'  ,    ':call Toggle(&colorcolumn, 0, "set colorcolumn=80", "set colorcolumn=0")<esc>', "toggles color column (Line length indicator)"                   ],
    \[ 'D'   ,    ':bdelete<esc><enter>'                                                                                                                            ],
    \[ 'df'  ,    ':%s/\s\+\ze$//gc<esc>'                                                        , "finds and optionally deletes extra space at end of line"        ],
    \[ 'dm'  ,    ':delmark'                                                                                                                                        ],
    \[ 'e'   ,    ':set cursorcolumn!<esc>'                                                                                                                         ],
    \[ '/'   ,    ':Explore<CR>'                                                                                                                                    ],
    \[ 'f'   ,    ':set wrap!<esc>'                                                                                                                                 ],
    \[ 'g'   ,    ':enew<esc>'                                                                                                                                      ],
    \[ 'Gm'  ,    ':call GetMappings()<CR>'                                                                                                                         ],
    \[ 'h'   ,    ':call Toggle(&ls, 0, "set ru \| set ls=2", "set noru \| set ls=0")<esc><C-L>'                                                                    ],
    \[ 'H'   ,    ':vert helpgrep '                                                                                                                                 ],
    \[ 'j'   ,    ':call CycleColor(+1)<CR>'                                                     , "cycles color scheme (next)"                                     ],
    \[ 'J'   ,    ':call CycleColor(-1)<CR>'                                                     , "cycles color scheme (prev)"                                     ],
    \[ 'k'   ,    ':call CorrectColors()<CR>'                                                                                                                       ],
    \[ 'l'   ,    ':call CycleBackground(+1)<CR>'                                                                                                                   ],
    \[ 'L'   ,    ':call CycleBackground(-1)<CR>'                                                                                                                   ],
    \[ ';'   ,    ':ls<CR>:b<Space>'                                                                                                                                ],
    \[ 'M'   ,    ':messages<esc>'                                                                                                                                  ],
    \[ 'N'   ,    ':cnext<esc>'                                                                                                                                     ],
    \[ 'n'   ,    ':next<esc>'                                                                                                                                      ],
    \[ 'q'   ,    ':bd'                                                                                                                                             ],
    \[ 's'   ,    ':source ~/.config/nvim/init.vim<esc>'                                                                                                            ],
    \[ 'tb'  ,    ':tabmove -1<esc>'                                                                                                                                ],
    \[ 'tB'  ,    ':tabmove -1<esc>'                                                                                                                                ],
    \[ 'tcc' ,    ':tabclose<esc>'                                                                                                                                  ],
    \[ 'tf'  ,    ':tabfirst<esc>'                                                                                                                                  ],
    \[ 'tl'  ,    ':tablast<esc>'                                                                                                                                   ],
    \[ 'tm'  ,    ':tabmove'                                                                                                                                        ],
    \[ 'tn'  ,    ':tabmove +1<esc>'                                                                                                                                ],
    \[ 'tN'  ,    ':tabmove +1<esc>'                                                                                                                                ],
    \[ 'tp'  ,    ':tabmove -1<esc>'                                                                                                                                ],
    \[ 'T'   ,    ':term<esc>'                                                                                                                                      ],
    \[ 'tt'  ,    ':tabnew<esc>'                                                                                                                                    ],
    \[ 'u'   ,    ':Lf<esc>'                                                                                                                                        ],
    \[ 'vf'  ,    '?<C-r>"<enter>'                                                                                                                                  ],
    \[ 'vv'  ,    ':call Cycle(["none", "all", "block"], &ve, ["set ve=all \| echo &ve", "set ve=block \| echo &ve", "set ve=none \| echo &ve"], 0)<CR>'            ],
    \[ 'W'   ,    ':call Web("f")<esc>i'                                                                                                                            ],
    \[ 'WC'  ,    ':BraceyStop<esc>'                                                                                                                                ],
    \[ 'WW'  ,    ':Bracey<esc>'                                                                                                                                    ],
    \[ 'w'   ,    ':w<esc>'                                                                                                                                         ],
    \[ 'X'   ,    ':w<esc>:!%:p '                                                                                                                                   ],
    \[ 'x'   ,    ':w<esc>:!%:p<esc>'                                                                                                                               ],
    \[ 'y'   ,    ':hi Normal guibg=Transparent<esc>'                                                                                                               ],
    \[ 'ZC'  ,    ':bd<esc>'                                                                                                                                        ],
    \[ 'z'   ,    'z'                                                                                                                                               ],
\]

let g:bindings_l_vnoremap = [
    \[ 'm'   ,    ':!bc<esc>'            ],
    \[ 'M'   ,    ':!dc<esc>'            ],
    \[ 'vc'  ,    ':!column -t<enter>'   ],
    \[ 'vs'  ,    ':!sort -n<enter>'     ],
\]

call MyMap( "nnoremap" , g:bindings_l_nnoremap, 1)
call MyMap( "noremap"  , g:bindings_l_noremap,  1)
call MyMap( "vnoremap" , g:bindings_l_vnoremap, 1)


"    \[ 'oc'  ,    'q:iput=execute("")<esc>A<C-c>'                                                                                                                   ],
"    \[ 'op'  ,    'q:<C-p><esc>Iput =execute("<esc>A")<esc>A<C-c>'                                                                                                  ],
"    \[ 'ox'  ,    ':put =execute("<C-r>0")<esc>'                                                                                                                    ],
"    \[ 'vm'  ,    ':put =eval("<C-r>0")'                                                                                                                            ],
"    \[ 'vq'  ,    ':put =eval("<C-r>0")<esc>'                                                                                                                       ],
"    \[ 'out' ,    'q:iput =execute("<C-r>0")<esc>A<C-c>'                                                                                                            ],
"    \[ 'ZG'  ,    ':bd!<esc>'                                                                                                                                       ],

