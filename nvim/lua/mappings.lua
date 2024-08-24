#!/usr/bin/lua

-- local function makemap (key, mode, map, desc, remap)
--   return { key = key, mode = mode, map = map, desc = desc, remap = remap }
-- end

if not table.unpack then
  table.unpack = unpack
end

-- local f(s, , , 
local l = '<leader>'

-- { '',                     {l     ,  '<C-^>'               }},
-- { '',                     '/'   ,  ':Explore<CR>'        },
local leader_nnoremap = {
  { 'Prev Tab',             'tb'  ,  ':tabmove -1<esc>'                                                         },
  { 'Next Tab',             'tn'  ,  ':tabmove +1<esc>'                                                         },
  { 'New Tab',              'tt'  ,  ':tabnew<esc>'                                                             },
  { '',                     ','   ,  '<C-^>'                                                                    },
  { 'Next Buffer',          ']'   ,  ':bnext<CR>'                                                               },
  { 'Prev Buffer',          '['   ,  ':bprevious<CR>'                                                           },
  { '',                     '-'   ,  '20<c-w><'                                                                 },
  { '',                     '='   ,  '20<c-w>>'                                                                 },
  { '',                     'A'   ,  ':LspStart()<CR>'                                                          },
  { '',                     'a'   ,  ':LspStop()<CR>'                                                           },
  { '',                     'B'   ,  ':ls<CR>:b<Space>'                                                         },
  { '',                     'b'   ,  ':Buffers<esc>'                                                            },
  { '+ Line Len Indicator', 'cc'  ,  ':call TogCC()<CR>'                                                        },
  { '+ CursorLine',         'cl'  ,  ':set nocul!<CR>'                                                          },
  { '+ Statusline',         'cs'  ,  ':call TogSL()<CR>'                                                        },
  { 'Delete Buffer',        'D'   ,  ':bd<esc><enter>'                                                          },
  { 'Find Space EOL',       'df'  ,  ':%s/\\s\\+\\ze$//gc<CR>'                                                  },
  { '+ CursorColumn',       'e'   ,  ':set cuc!<CR>'                                                            },
  { 'Edit File CWD',        'E'   ,  ':call feedkeys(":e " . FilePathFull() . "/")<CR>'                         },
  { '+ Wrap',               'f'   ,  ':set wrap!<esc>'                                                          },
  { 'New File',             'gn'  ,  ':enew<esc>'                                                               },
  { '',                     'gh'  ,  ':call GetHL()<CR>'                                                        },
  { 'Print Mappings',       'gm'  ,  ':call GMaps()<CR>'                                                        },
  { 'Helpgrep',             'H'   ,  ':vert helpgrep '                                                          },
  { 'Open diagnostics',     'i'   ,  ':lua vim.diagnostic.open_float(nil, {focus=true, scope="cursor")<CR>'     },
  { '+ lsp_lines',          'I'   ,  ':lua require("lsp_lines").toggle()<CR>'                                   },
  { 'Next Scheme',          'j'   ,  ':call SetColScheme(+1)<CR>'                                               },
  { 'Prev Scheme',          'J'   ,  ':call SetColScheme(-1)<CR>'                                               },
  { '',                     'k'   ,  ':call CorrectColors()<CR>'                                                },
  { '',                     'l'   ,  ':call CyBack(+1)<CR>'                                                     },
  { '',                     'L'   ,  ':call CyBack(-1)<CR>'                                                     },
  { 'Checkhealth',          'mh'  ,  ':checkhealth<CR>'                                                         },
  { '',                     'mm'  ,  ':messages<esc>'                                                           },
  { '',                     'N'   ,  ':cnext<esc>'                                                              },
  { '',                     'n'   ,  ':next<esc>'                                                               },
  { '',                     'ob'  ,  ':silent !"${BROWSER:-"brave"}"  %<CR>'                                    },
  { '',                     'oq'  ,  ':silent !"qutebrowser" %<CR>'                                             },
  { '',                     'q'   ,  ':bd'                                                                      },
  { '',                     's'   ,  ':source ~/.config/nvim/init.vim<esc>'                                     },
  { '',                     'T'   ,  ':term<esc>'                                                               },
  { '',                     'u'   ,  ':Lf<esc>'                                                                 },
  { '',                     'vv'  ,  ':call TogVE()<CR>'                                                        },
  -- { '',                     'W'   ,  ':call Web("f")<esc>i'},
  { '',                     'W'   ,  '<Plug>VimwikiIndex'                                                       },
  { '',                     'w'   ,  ':w<esc>'                                                                  },
  { '',                     'X'   ,  ':!%:p '                                                                   },
  { '',                     'x'   ,  ':!%:p<esc>'                                                               },
  { '',                     'y'   ,  ':hi Normal guibg=Transparent<esc>'                                        },
  { '',                     'ZC'  ,  ':bd<esc>'                                                                 },
  { '',                     'z'   ,  'z'                                                                        },
}



for _, map in ipairs(leader_nnoremap) do
  vim.keymap.set('n', l .. map[2], map[3])
end






