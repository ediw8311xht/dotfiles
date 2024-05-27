
source ${HOME}/.config/nvim/functions.vim

let g:bindings_map=[
    \[ ',',        '<leader>'                   ],
    \[ '+',        'g_'                         ],
\]
let g:bindings_noremap=[
    \[ 'x',        '"xx'                        ],
    \[ ',;',       ','                          ],
\]
let g:bindings_vnoremap=[
    \[ 'im',       ':s/\%V[ \t]*//<esc>'        ],
    \[ '<Enter>',  'zf'                         ],
\]
let g:bindings_nnoremap=[
    \[ '<esc>',    ':noh<esc>:echon ""<enter>'  ],
    \[ '/',        '/\v\c'                      ],
    \[ '?',        '?\v\c'                      ],
    \[ '\',        '/\V\c'                      ],
    \[ '\|',       '?\V\c'                      ],
    \[ '<lt>',     ':tabprevious<esc>'          ],
    \[ '>',        ':tabnext<esc>'              ],
    \[ '<Enter>',  '@=(foldlevel('."'.')?'za':".'"\<Space>")<CR>'   ],
    \[ '<C-p>',    '<C-i>'                      ],
    \[ '<C-H>',    '<C-w>h'                     ],
    \[ '<C-J>',    '<C-w>j'                     ],
    \[ '<C-K>',    '<C-w>k'                     ],
    \[ '<C-L>',    '<C-w>l'                     ],
    \[ '<C-\>',    '/\V'                        ],
    \[ '<C-_>',    '/\v'                        ],
    \[ '<C-w>n',   ':new<esc><C-w>L'            ],
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
    \[ '<C-w>',    '<C-\><C-n>'             ],
\]

call MyMap( "map"       , g:bindings_map        )
call MyMap( "noremap"   , g:bindings_noremap    )
call MyMap( "vnoremap"  , g:bindings_vnoremap   )
call MyMap( "nnoremap"  , g:bindings_nnoremap   )
call MyMap( "inoremap"  , g:bindings_inoremap   )
call MyMap( "tmap"      , g:bindings_tmap       )

