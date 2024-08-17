
"source ${HOME}/.config/nvim/functions.vim

let g:bindings_map=[
    \[ ',',         '<leader>'                  ],
    \[ '+',         'g_'                        ],
\]
let g:bindings_noremap=[
    \[ 'x',        '"xx'                        ],
    \[ ',;',       ','                          ],
\]

let g:bindings_vnoremap=[
    \[ '~',        'zf'                         ],
    \[ '<C-s>',    ':s/\%V\v'                   ],
\]
"    \[ 'im',       ':s/\%v[ \t]*//<esc>'        ],

"    \[ '<lt>',     ':tabprevious<esc>'          ],
"    \[ '>',        ':tabnext<esc>'              ],
let g:bindings_nnoremap=[
    \[ 'ZG',       ':wqall<CR>'                 ],
    \[ '~',        '@=(foldlevel('."'.')?'za':".'"\<Space>")<CR>'   ],
    \[ '<esc>',    ':noh<esc>:echon ""<enter>'  ],
    \
    \[ '/',        '/\v\c'                      ],
    \[ '?',        '?\v\c'                      ],
    \[ '\',        '/\V\c'                      ],
    \[ '\|',       '?\V\c'                      ],
    \
    \[ '<C-p>',    '<C-i>'                      ],
    \
    \[ '<C-h>',    '<C-w>h'                     ],
    \[ '<C-j>',    '<C-w>j'                     ],
    \[ '<C-k>',    '<C-w>k'                     ],
    \[ '<C-l>',    '<C-w>l'                     ],
    \
    \[ '<C-S-h>',  '<C-w>h'                     ],
    \[ '<C-S-j>',  '<C-w>j'                     ],
    \[ '<C-S-k>',  '<C-w>k'                     ],
    \[ '<C-S-l>',  '<C-w>l'                     ],
    \
    \[ '<C-\>',    '/\V'                        ],
    \[ '<C-_>',    '/\v'                        ],
    \
    \[ '<C-w>n',   ':new<esc><C-w>L'            ],
    \[ '<C-s>',    ':%s/\v'                     ],
\]
let g:bindings_inoremap=[
    \[ 'jk',       '<esc>'                      ],
    \[ '<C-a>',    '<esc>I'                     ],
    \[ '<C-b>',    '<left>'                     ],
    \[ '<C-e>',    '<esc>A'                     ],
    \[ '<C-f>',    '<right>'                    ],
    \[ '<C-\>',    '<esc>ui'                    ],
    \[ '<C-K>',    '<esc>lC'                    ],
\]
    "\[ '<C-v>',    '<esc><C-r>i'                ],
let g:bindings_tmap=[
    \[ '<C-w>',    '<C-\><C-n>'                 ],
\]

call M_Map( "map"       , g:bindings_map        )
call M_Map( "noremap"   , g:bindings_noremap    )
call M_Map( "vnoremap"  , g:bindings_vnoremap   )
call M_Map( "nnoremap"  , g:bindings_nnoremap   )
call M_Map( "inoremap"  , g:bindings_inoremap   )
call M_Map( "tmap"      , g:bindings_tmap       )
