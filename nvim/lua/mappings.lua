#!/usr/bin/lua


-- local status1 = '%t %r%m%=[%v] (%L lines) (%{wordcount().words} words)%=%#HLspStatus#%{LspStatus()}%*[%{LspStatus()}] [%F]'


-- { n,    '<C-|>',    F, 'Search icase exact',     '/\\V'                                       },
-- { n,    '<C-_>',    F, '',                       '/\\v'                                       },
-- { n,    '<Tab>',    F, '',                       ':earlier<CR>'                               },
-- { n,    '<S-Tab>',  F, '',                       ':later<CR>'                                 },
-- { n,    '\\|',      F, '',                       '?\\V\\c'                                    },



-- local _l = '<leader>'
local F = false;
local T = true;
local n = 'n';
local i = 'i';
local t = 't';
local v = 'v';
local e = '';


REGULAR_MAPPINGS={
   [e] = {
     [ '+'        ] = {T, 'End of line',            'g_'                                         },
     [ ','        ] = {T, '<leader>',               '<leader>'                                   },
     [ ',;'       ] = {F, '',                       ','                                          },
     [ 'x'        ] = {F, '',                       '"xx'                                        },
   },
   [i] = {
     [ '<C-BS>'   ] = {F, '',                       '<C-w>'                                      },
     [ '<C-S-\\>' ] = {F, '',                       '<C-o><C-r>'                                 },
     [ '<C-S-k>'  ] = {F, '',                       '<C-o>C'                                     },
     [ '<C-S-t>'  ] = {F, '',                       '<C-d>'                                      },
     [ '<C-S-w>'  ] = {F, '',                       '<S-left>'                                   },
     [ '<C-\\>'   ] = {F, '',                       '<C-o>u'                                     },
     [ '<C-a>'    ] = {F, '',                       '<C-o>I'                                     },
     [ '<C-b>'    ] = {F, '',                       '<left>'                                     },
     [ '<C-e>'    ] = {F, '',                       '<C-o>A'                                     },
     [ '<C-f>'    ] = {F, '',                       '<right>'                                    },
     [ '<C-w>'    ] = {F, '',                       '<S-right>'                                  },
     [ 'jk'       ] = {F, '',                       '<esc>'                                      },
   },
   [n] = {
     [ '/'        ] = {F, '',                       '/\\v\\c'                                    },
     [ '<C-S-E>'  ] = {F, '',                       'bbe'                                        },
     [ '<C-S-H>'  ] = {F, '',                       '<C-w>h'                                     },
     [ '<C-S-J>'  ] = {F, '',                       '<C-w>j'                                     },
     [ '<C-S-K>'  ] = {F, '',                       '<C-w>k'                                     },
     [ '<C-S-L>'  ] = {F, '',                       '<C-w>l'                                     },
     [ '<C-S-Tab>'] = {F, '',                       ':tabprevious<CR>'                           },
     [ '<C-S-s>'  ] = {F, 'Sub char sensitive',     ':%s/\\v'                                    },
     [ '<C-Tab>'  ] = {F, '',                       ':tabnext<CR>'                               },
     [ '<C-h>'    ] = {F, 'Left Pane',              '<C-w>h'                                     },
     [ '<C-j>'    ] = {F, 'Down Pane',              '<C-w>j'                                     },
     [ '<C-k>'    ] = {F, 'Up Pane',                '<C-w>k'                                     },
     [ '<C-l>'    ] = {F, 'Right Pane',             '<C-w>l'                                     },
     [ '<C-n>'    ] = {F, '+Nerd Tree',             ':NERDTreeToggle<CR>'                        },
     [ '<C-p>'    ] = {F, 'Substitute',             '<C-i>'                                      },
     [ '<C-s>'    ] = {F, 'Sub char insensitive',   ':%s/\\v\\c'                                 },
     [ '<C-w>n'   ] = {F, 'New Buffer Right',       ':new<esc><C-w>L'                            },
     [ '<esc>'    ] = {F, 'Clear',                  ':noh<esc>:echon ""<enter>'                  },
     [ '?'        ] = {F, '',                       '?\\v\\c'                                    },
     [ 'ZG'       ] = {F, '',                       ':wqall<CR>'                                 },
     [ '`'        ] = {F, '',                       '@=(foldlevel(\'.\')?\'za\':"<Space>")<CR>'  },
     [ '|'        ] = {F, '',                       '/\\V\\c'                                    },
   },
   [t] = {
     [ '<C-w>'    ] = {T, '',                       '<C-\\><C-n>'                                },
   },
   [v] = {
     [ '<C-S-s>'  ] = {F, 'Sub char sensitive',     ':s/\\%V\\v'                                 },
     [ '<C-s>'    ] = {F, 'Sub char insensitive',   ':s/\\%V\\v\\c'                              },
     [ '`'        ] = {F, '',                       'zf'                                         },
   }
}

  -- { n, 'I'   ,  F, '+ lsp_lines',            ':lua require("lsp_lines").toggle()<CR>'                            },
LEADER_MAPPINGS = {
  [ n ] = {
    [','       ] = { F, 'Alternate File',         '<C-^>'                                                                },
    ['-'       ] = { F, 'Equalize Split Hori',    '20<c-w><'                                                             },
    ['<C-S-x>' ] = { F, 'Execute with args',      ':!%:p '                                                               },
    ['<C-x>'   ] = { F, 'Execute',                ':!%:p<esc>'                                                           },
    ['<S-Tab>' ] = { F, 'Later',                  ':later<CR>'                                                           },
    ['<Tab>'   ] = { F, 'Earlier',                ':earlier<CR>'                                                         },
    ['='       ] = { F, 'Equalize Split Vert',    '20<c-w>>'                                                             },
    ['A'       ] = { F, 'Start LSP',              ':LspStart()<CR>'                                                      },
    ['D'       ] = { F, 'Delete Buffer',          ':bd<esc><enter>'                                                      },
    ['E'       ] = { F, 'CWD Edit',               ':call feedkeys(":e " . FilePathFull() . "/")<CR>'                     },
    ['H'       ] = { F, 'Helpgrep',               ':vert helpgrep '                                                      },
    ['I'       ] = { F, 'Show code-action',       ':lua require("actions-preview").code_actions()<CR>'                   },
    ['L'       ] = { F, 'Prev Background',        ':call CyBack(-1)<CR>'                                                 },
    ['N'       ] = { F, 'Previous Buffer',        ':cnext<esc>'                                                          },
    ['S'       ] = { F, 'Source vim config',      ':source ~/.config/nvim/init.vim<esc>'                                 },
    ['T'       ] = { F, 'Terminal',               ':term<esc>'                                                           },
    ['W'       ] = { F, 'VimwikiIndex',           '<Plug>VimwikiIndex'                                                   },
    ['ZC'      ] = { F, 'Delete Buffer',          ':bd<esc>'                                                             },
    ['['       ] = { F, 'Prev Buffer',            ':bprevious<CR>'                                                       },
    [']'       ] = { F, 'Next Buffer',            ':bnext<CR>'                                                           },
    ['a'       ] = { F, 'Stop LSP',               ':LspStop<CR>'                                                         },
    ['b'       ] = { F, 'open buffer',            ':Buffers<esc>'                                                        },
    ['cJ'      ] = { F, 'Prev Scheme',            ':call SetColScheme(-1)<CR>'                                           },
    ['cS'      ] = { F, '+Spell',                 ':set spell!<CR>'                                                      },
    ['cc'      ] = { F, '+Line Length Indicator', ':call TogCC()<CR>'                                                    },
    ['ce'      ] = { F, '+CursorColumn',          ':set cuc!<CR>'                                                        },
    ['cf'      ] = { F, '+Wrap',                  ':set wrap!<esc>'                                                      },
    ['cg'      ] = { F, 'Toggle Git Signs',       ':Gitsigns toggle_signs<CR>'                                           },
    ['cj'      ] = { F, 'Next Scheme',            ':call SetColScheme(+1)<CR>'                                           },
    ['ck'      ] = { F, 'CorrectColor',           ':call CorrectColors()<CR>'                                            },
    ['cl'      ] = { F, '+ CursorLine',           ':set nocul!<CR>'                                                      },
    ['cs'      ] = { F, '+ Statusline',           ':call TogSL()<CR>'                                                    },
    ['df'      ] = { F, 'Find Space EOL',         ':%s/\\s\\+\\ze$//gc<CR>'                                              },
    ['gh'      ] = { F, 'Get highlight',          ':call GetHL()<ESC>'                                                   },
    ['gm'      ] = { F, 'Print Mappings',         ':call GMaps()<CR>'                                                    },
    ['gn'      ] = { F, 'New File',               ':enew<esc>'                                                           },
    ['i'       ] = { F, 'Show diagnostics',       ':lua vim.diagnostic.open_float(nil, {focus=T, scope="cursor"})<CR>'   },
    ['l'       ] = { F, 'Next Background',        ':call CyBack(+1)<CR>'                                                 },
    ['mh'      ] = { F, 'Checkhealth',            ':checkhealth<CR>'                                                     },
    ['mm'      ] = { F, 'Messages',               ':messages<esc>'                                                       },
    ['n'       ] = { F, 'Next Buffer',            ':next<esc>'                                                           },
    ['ob'      ] = { F, 'Open in Browser',        ':silent !"${BROWSER:-"brave"}"  %<CR>'                                },
    ['oq'      ] = { F, 'Open in Qutebrowser',    ':silent !"qutebrowser" %<CR>'                                         },
    ['q'       ] = { F, 'Delete buffer',          ':bd'                                                                  },
    ['s'       ] = { F, 'Switch pane',            '<C-w><C-p>'                                                           },
    ['tb'      ] = { F, 'Prev Tab',               ':tabmove -1<esc>'                                                     },
    ['tn'      ] = { F, 'Next Tab',               ':tabmove +1<esc>'                                                     },
    ['tt'      ] = { F, 'New Tab',                ':tabnew<esc>'                                                         },
    ['u'       ] = { F, 'lf file manager',        ':Lf<esc>'                                                             },
    ['vv'      ] = { F, '+Virtualedit',           ':call TogVE()<CR>'                                                    },
    ['wr'      ] = { F, 'Write',                  ':w<esc>'                                                              },
    ['y'       ] = { F, 'bg transparent',         ':hi Normal guibg=Transparent<esc>'                                    },
    ['z'       ] = { F, '',                       'z'                                                                    },
  },
  [v] = {
    ['M'       ] = { F, 'dc [math]',              ':!dc<esc>'                                                            },
    ['m'       ] = { F, 'bc [math]',              ':!bc<esc>'                                                            },
    ['vc'      ] = { F, 'column',                 ':!column -o " " -t<enter>'                                            },
    ['vs'      ] = { F, 'sort',                   ':sort<enter>'                                                         },
  }
}

-- ALL_MAPPINGS = { [""] = REGULAR_MAPPINGS, ["<LEADER>"] = LEADER_MAPPINGS}



function KeyMapSetter(map, pre)
  for mode, mode_map in pairs(map) do
    for key, tbl in pairs(mode_map) do
      vim.keymap.set(mode, pre .. key, tbl[3], { remap = tbl[1], desc = tbl[2] } )
    end
  end
end

-- function MyMap(map, prep)
--   local description = map[4]
--   if prep == nil then prep = '' end
--   if map[4] == nil or map[4] == '' then
--     description = map[5]
--   end
--
--   vim.keymap.set(map[1], prep .. map[2], map[5], {remap = map[3], desc = description})
-- end
--
-- for _, map in ipairs(REGULAR_MAPPINGS) do
--   MyMap(map)
--   -- vim.keymap.set(map[1], map[2], map[5], {remap = map[3]})
-- end

KeyMapSetter(LEADER_MAPPINGS, "<leader>")
KeyMapSetter(REGULAR_MAPPINGS, "")
-- for _, map in ipairs(LEADER_MAPPINGS) do
--   MyMap(map, '<leader>')
--   -- vim.keymap.set(map[1], '<leader>' .. map[2], map[5], {remap = map[3], desc = map[4]})
-- end



