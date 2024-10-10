#!/usr/bin/lua


if not table.unpack then
  table.unpack = unpack
end

local l = '<leader>'

local regular_mappings={
  { 'i', false, '', '<C-K>',    '<esc>lC'                                       },
  { 'i', false, '', '<C-\\>',   '<esc>ui'                                       },
  { 'i', false, '', '<C-a>',    '<esc>I'                                        },
  { 'i', false, '', '<C-b>',    '<left>'                                        },
  { 'i', false, '', '<C-e>',    '<esc>A'                                        },
  { 'i', false, '', '<C-f>',    '<right>'                                       },
  { 'i', false, '', 'jk',       '<esc>'                                         },
  { '',  true,  '', '+',        'g_'                                            },
  { '',  true,  '', ',',        '<leader>'                                      },
  { 'n', false, '', '/',        '/\\v\\c'                                       },
  { 'n', false, '', '<C-S-h>',  '<C-w>h'                                        },
  { 'n', false, '', '<C-S-j>',  '<C-w>j'                                        },
  { 'n', false, '', '<C-S-k>',  '<C-w>k'                                        },
  { 'n', false, '', '<C-S-l>',  '<C-w>l'                                        },
  { 'n', false, '', '<C-\\>',   '/\\V'                                          },
  { 'n', false, '', '<C-_>',    '/\\v'                                          },
  { 'n', false, '', '<C-h>',    '<C-w>h'                                        },
  { 'n', false, '', '<C-j>',    '<C-w>j'                                        },
  { 'n', false, '', '<C-k>',    '<C-w>k'                                        },
  { 'n', false, '', '<C-l>',    '<C-w>l'                                        },
  { 'n', false, '', '<C-p>',    '<C-i>'                                         },
  { 'n', false, '', '<C-s>',    ':%s/\\v'                                       },
  { 'n', false, '', '<C-w>n',   ':new<esc><C-w>L'                               },
  { 'n', false, '', '<esc>',    ':noh<esc>:echon ""<enter>'                     },
  { 'n', false, '', '?',        '?\\v\\c'                                       },
  { 'n', false, '', 'ZG',       ':wqall<CR>'                                    },
  { 'n', false, '', '\\',       '/\\V\\c'                                       },
  { 'n', false, '', '\\|',      '?\\V\\c'                                       },
  { 'n', false, '', '`',        '@=(foldlevel(\'.\')?\'za\':"<Space>")<CR>'     },
  { '',  false, '', ',;',       ','                                             },
  { '',  false, '', 'x',        '"xx'                                           },
  { 't', true,  '', '<C-w>',    '<C-\\><C-n>'                                   },
  { 'v', false, '', '<C-s>',    ':s/\\%V\\v'                                    },
  { 'v', false, '', '`',        'zf'                                            },
}
local leader_mappings={
  { 'n', false, 'Prev Tab',             'tb'  ,  ':tabmove -1<esc>'                                                         },
  { 'n', false, 'Next Tab',             'tn'  ,  ':tabmove +1<esc>'                                                         },
  { 'n', false, 'New Tab',              'tt'  ,  ':tabnew<esc>'                                                             },
  { 'n', false, '',                     ','   ,  '<C-^>'                                                                    },
  { 'n', false, 'Next Buffer',          ']'   ,  ':bnext<CR>'                                                               },
  { 'n', false, 'Prev Buffer',          '['   ,  ':bprevious<CR>'                                                           },
  { 'n', false, '',                     '-'   ,  '20<c-w><'                                                                 },
  { 'n', false, '',                     '='   ,  '20<c-w>>'                                                                 },
  { 'n', false, '',                     'A'   ,  ':LspStart()<CR>'                                                          },
  { 'n', false, '',                     'a'   ,  ':LspStop()<CR>'                                                           },
  { 'n', false, '',                     'B'   ,  ':ls<CR>:b<Space>'                                                         },
  { 'n', false, '',                     'b'   ,  ':Buffers<esc>'                                                            },
  { 'n', false, '+ Line Len Indicator', 'cc'  ,  ':call TogCC()<CR>'                                                        },
  { 'n', false, '+ CursorLine',         'cl'  ,  ':set nocul!<CR>'                                                          },
  { 'n', false, '+ Statusline',         'cs'  ,  ':call TogSL()<CR>'                                                        },
  { 'n', false, 'Delete Buffer',        'D'   ,  ':bd<esc><enter>'                                                          },
  { 'n', false, 'Find Space EOL',       'df'  ,  ':%s/\\s\\+\\ze$//gc<CR>'                                                  },
  { 'n', false, '+ CursorColumn',       'e'   ,  ':set cuc!<CR>'                                                            },
  { 'n', false, 'Edit File CWD',        'E'   ,  ':call feedkeys(":e " . FilePathFull() . "/")<CR>'                         },
  { 'n', false, '+ Wrap',               'f'   ,  ':set wrap!<esc>'                                                          },
  { 'n', false, 'New File',             'gn'  ,  ':enew<esc>'                                                               },
  { 'n', false, '',                     'gh'  ,  ':call GetHL()<ESC>'                                                       },
  { 'n', false, 'Print Mappings',       'gm'  ,  ':call GMaps()<CR>'                                                        },
  { 'n', false, 'Helpgrep',             'H'   ,  ':vert helpgrep '                                                          },
  { 'n', false, 'Open diagnostics',     'i'   ,  ':lua vim.diagnostic.open_float(nil, {focus=true, scope="cursor"})<CR>'    },
  { 'n', false, '+ lsp_lines',          'I'   ,  ':lua require("lsp_lines").toggle()<CR>'                                   },
  { 'n', false, 'Next Scheme',          'j'   ,  ':call SetColScheme(+1)<CR>'                                               },
  { 'n', false, 'Prev Scheme',          'J'   ,  ':call SetColScheme(-1)<CR>'                                               },
  { 'n', false, '',                     'k'   ,  ':call CorrectColors()<CR>'                                                },
  { 'n', false, '',                     'l'   ,  ':call CyBack(+1)<CR>'                                                     },
  { 'n', false, '',                     'L'   ,  ':call CyBack(-1)<CR>'                                                     },
  { 'n', false, 'Checkhealth',          'mh'  ,  ':checkhealth<CR>'                                                         },
  { 'n', false, '',                     'mm'  ,  ':messages<esc>'                                                           },
  { 'n', false, '',                     'N'   ,  ':cnext<esc>'                                                              },
  { 'n', false, '',                     'n'   ,  ':next<esc>'                                                               },
  { 'n', false, '',                     'ob'  ,  ':silent !"${BROWSER:-"brave"}"  %<CR>'                                    },
  { 'n', false, '',                     'oq'  ,  ':silent !"qutebrowser" %<CR>'                                             },
  { 'n', false, '',                     'q'   ,  ':bd'                                                                      },
  { 'n', false, '',                     's'   ,  ':source ~/.config/nvim/init.vim<esc>'                                     },
  { 'n', false, '',                     'T'   ,  ':term<esc>'                                                               },
  { 'n', false, '',                     'u'   ,  ':Lf<esc>'                                                                 },
  { 'n', false, '',                     'vv'  ,  ':call TogVE()<CR>'                                                        },
  { 'n', false, '',                     'W'   ,  '<Plug>VimwikiIndex'                                                       },
  { 'n', false, '',                     'w'   ,  ':w<esc>'                                                                  },
  { 'n', false, '',                     'X'   ,  ':!%:p '                                                                   },
  { 'n', false, '',                     'x'   ,  ':!%:p<esc>'                                                               },
  { 'n', false, '',                     'y'   ,  ':hi Normal guibg=Transparent<esc>'                                        },
  { 'n', false, '',                     'ZC'  ,  ':bd<esc>'                                                                 },
  { 'n', false, '',                     'z'   ,  'z'                                                                        },
  { 'v', false, '',                     'M'   ,  ':!dc<esc>'                                                                },
  { 'v', false, '',                     'm'   ,  ':!bc<esc>'                                                                },
  { 'v', false, '',                     'vc'  ,  ':!column -o " " -t<enter>'                                                },
  { 'v', false, '',                     'vs'  ,  ':sort<enter>'                                                             },
}

for _, map in ipairs(regular_mappings) do
  vim.keymap.set(map[1], map[4], map[5], {remap = map[2]})
end

for _, map in ipairs(leader_mappings) do
  vim.keymap.set(map[1], l .. map[4], map[5], {remap = map[2]})
end



-- { 'Start Vlime',          'mS'  ,  ':'                                                                        },
-- { '',                     'W'   ,  ':call Web("f")<esc>i'},


-- for _, map in ipairs(leader_vnoremap) do
--   vim.keymap.set('n', l .. map[2], map[3], {remap = false})
-- end

---- call M_Map( "map"       , g:bindings_map        )
--call M_Map( "noremap"   , g:bindings_noremap    )
--call M_Map( "vnoremap"  , g:bindings_vnoremap   )
--call M_Map( "nnoremap"  , g:bindings_nnoremap   )
--call M_Map( "inoremap"  , g:bindings_inoremap   )
--call M_Map( "tmap"      , g:bindings_tmap       )

-- local leader_vnoremap = {
--   { 'Copy Line w/o newline',    ','   ,  ''  },
-- }
-- local f(s, , , 

--    { 'im',       ':s/\%v[ \t}*//<esc>'        ],

--    { '<lt>',     ':tabprevious<esc>'          },
--    { '>',        ':tabnext<esc>'              },
-- { '<C-v>',    '<esc><C-r>i'                },

-- local function makemap (key, mode, map, desc, remap)
--   return { key = key, mode = mode, map = map, desc = desc, remap = remap }
-- end
-- { '',                     {l     ,  '<C-^>'               }},
-- { '',                     '/'   ,  ':Explore<CR>'        },

-- local f(s, , , 




