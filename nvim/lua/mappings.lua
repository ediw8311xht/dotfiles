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


REGULAR_MAPPINGS={
  { '',   ',;',       F, '',                       ','                                          },
  { '',   'x',        F, '',                       '"xx'                                        },
  { '',   '+',        T, '',                       'g_'                                         },
  { '',   ',',        T, '',                       '<leader>'                                   },
  { i,    '<C-BS>',   F, '',                       '<C-w>'                                      },
  { i,    '<C-S-\\>', F, '',                       '<C-o><C-r>'                                 },
  { i,    '<C-S-k>',  F, '',                       '<C-o>C'                                     },
  { i,    '<C-S-t>',  F, '',                       '<C-d>'                                      },
  { i,    '<C-S-w>',  F, '',                       '<S-left>'                                   },
  { i,    '<C-S-w>',  F, '',                       '<S-left>'                                   },
  { i,    '<C-\\>',   F, '',                       '<C-o>u'                                     },
  { i,    '<C-a>',    F, '',                       '<C-o>I'                                     },
  { i,    '<C-b>',    F, '',                       '<left>'                                     },
  { i,    '<C-e>',    F, '',                       '<C-o>A'                                     },
  { i,    '<C-f>',    F, '',                       '<right>'                                    },
  { i,    '<C-w>',    F, '',                       '<S-right>'                                  },
  { i,    'jk',       F, '',                       '<esc>'                                      },
  { n,    '/',        F, '',                       '/\\v\\c'                                    },
  { n,    '<C-S-E>',  F, '',                       'bbe'                                        },
  { n,    '<C-S-H>',  F, '',                       '<C-w>h'                                     },
  { n,    '<C-S-J>',  F, '',                       '<C-w>j'                                     },
  { n,    '<C-S-K>',  F, '',                       '<C-w>k'                                     },
  { n,    '<C-S-L>',  F, '',                       '<C-w>l'                                     },
  { n,    '<C-S-s>',  F, 'Sub char sensitive',     ':%s/\\v'                                    },
  { n,    '<C-h>',    F, 'Left Pane',              '<C-w>h'                                     },
  { n,    '<C-j>',    F, 'Down Pane',              '<C-w>j'                                     },
  { n,    '<C-k>',    F, 'Up Pane',                '<C-w>k'                                     },
  { n,    '<C-l>',    F, 'Right Pane',             '<C-w>l'                                     },
  { n,    '<C-n>' ,   F, '+Nerd Tree',             ':NERDTreeToggle<CR>'                        },
  { n,    '<C-p>',    F, 'Substitute',             '<C-i>'                                      },
  { n,    '<C-s>',    F, 'Sub char insensitive',   ':%s/\\v\\c'                                 },
  { n,    '<C-w>n',   F, 'New Buffer Right',       ':new<esc><C-w>L'                            },
  { n,    '<esc>',    F, 'Clear',                  ':noh<esc>:echon ""<enter>'                  },
  { n,    '<C-Tab>',  F, '',                       ':tabnext<CR>'                                },
  { n,    '<C-S-Tab>',  F, '',                     ':tabprevious<CR>'                                },
  { n,    '?',        F, '',                       '?\\v\\c'                                    },
  { n,    'ZG',       F, '',                       ':wqall<CR>'                                 },
  { n,    '|',        F, '',                       '/\\V\\c'                                    },
  { n,    '`',        F, '',                       '@=(foldlevel(\'.\')?\'za\':"<Space>")<CR>'  },
  { t,    '<C-w>',    T, '',                       '<C-\\><C-n>'                                },
  { v,    '<C-S-s>',  F, 'Sub char sensitive',     ':s/\\%V\\v'                                 },
  { v,    '<C-s>',    F, 'Sub char insensitive',   ':s/\\%V\\v\\c'                              },
  { v,    '`',        F, '',                       'zf'                                         },
}

LEADER_MAPPINGS={
  -- { n, 'I'   ,  F, '+ lsp_lines',            ':lua require("lsp_lines").toggle()<CR>'                            },
  { n, ','       ,  F, 'Alternate File',         '<C-^>'                                                                },
  { n, '-'       ,  F, 'Equalize Split Hori',    '20<c-w><'                                                             },
  { n, '='       ,  F, 'Equalize Split Vert',    '20<c-w>>'                                                             },
  { n, 'A'       ,  F, 'Start LSP',              ':LspStart()<CR>'                                                      },
  { n, 'D'       ,  F, 'Delete Buffer',          ':bd<esc><enter>'                                                      },
  { n, 'E'       ,  F, 'CWD Edit',               ':call feedkeys(":e " . FilePathFull() . "/")<CR>'                     },
  { n, 'H'       ,  F, 'Helpgrep',               ':vert helpgrep '                                                      },
  { n, 'L'       ,  F, 'Prev Background',        ':call CyBack(-1)<CR>'                                                 },
  { n, 'N'       ,  F, 'Previous Buffer',        ':cnext<esc>'                                                          },
  { n, 'S'       ,  F, 'Source vim config',      ':source ~/.config/nvim/init.vim<esc>'                                 },
  { n, 'T'       ,  F, 'Terminal',               ':term<esc>'                                                           },
  { n, 'W'       ,  F, 'VimwikiIndex',           '<Plug>VimwikiIndex'                                                   },
  { n, 'ZC'      ,  F, 'Delete Buffer',          ':bd<esc>'                                                             },
  { n, '['       ,  F, 'Prev Buffer',            ':bprevious<CR>'                                                       },
  { n, ']'       ,  F, 'Next Buffer',            ':bnext<CR>'                                                           },
  { n, 'a'       ,  F, 'Stop LSP',               ':LspStop<CR>'                                                         },
  { n, 'b'       ,  F, 'open buffer',            ':Buffers<esc>'                                                        },
  { n, 'cJ'      ,  F, 'Prev Scheme',            ':call SetColScheme(-1)<CR>'                                           },
  { n, 'cS'      ,  F, '+ spell',                ':set spell!<CR>'                                                      },
  { n, 'cc'      ,  F, '+ Line Length Indicator',':call TogCC()<CR>'                                                    },
  { n, 'ce'      ,  F, '+ CursorColumn',         ':set cuc!<CR>'                                                        },
  { n, 'cf'      ,  F, '+ Wrap',                 ':set wrap!<esc>'                                                      },
  { n, 'cg'      ,  F, 'Toggle Git Signs',       ':Gitsigns toggle_signs<CR>'                                           },
  { n, 'cj'      ,  F, 'Next Scheme',            ':call SetColScheme(+1)<CR>'                                           },
  { n, 'ck'      ,  F, 'CorrectColor',           ':call CorrectColors()<CR>'                                            },
  { n, 'cl'      ,  F, '+ CursorLine',           ':set nocul!<CR>'                                                      },
  { n, 'cs'      ,  F, '+ Statusline',           ':call TogSL()<CR>'                                                    },
  { n, 'df'      ,  F, 'Find Space EOL',         ':%s/\\s\\+\\ze$//gc<CR>'                                              },
  { n, 'gh'      ,  F, 'Get highlight',          ':call GetHL()<ESC>'                                                   },
  { n, 'gm'      ,  F, 'Print Mappings',         ':call GMaps()<CR>'                                                    },
  { n, 'gn'      ,  F, 'New File',               ':enew<esc>'                                                           },
  { n, 'i'       ,  F, 'Show diagnostics',       ':lua vim.diagnostic.open_float(nil, {focus=T, scope="cursor"})<CR>'   },
  { n, 'I'       ,  F, 'Show code-action',       ':lua require("actions-preview").code_actions()<CR>'                   },
  { n, 'l'       ,  F, 'Next Background',        ':call CyBack(+1)<CR>'                                                 },
  { n, 'mh'      ,  F, 'Checkhealth',            ':checkhealth<CR>'                                                     },
  { n, 'mm'      ,  F, 'Messages',               ':messages<esc>'                                                       },
  { n, 'n'       ,  F, 'Next Buffer',            ':next<esc>'                                                           },
  { n, 'ob'      ,  F, '',                       ':silent !"${BROWSER:-"brave"}"  %<CR>'                                },
  { n, 'oq'      ,  F, '',                       ':silent !"qutebrowser" %<CR>'                                         },
  { n, 'q'       ,  F, '',                       ':bd'                                                                  },
  { n, 's'       ,  F, '',                       '<C-w><C-p>'                                                           },
  { n, 'tb'      ,  F, 'Prev Tab',               ':tabmove -1<esc>'                                                     },
  { n, 'tn'      ,  F, 'Next Tab',               ':tabmove +1<esc>'                                                     },
  { n, 'tt'      ,  F, 'New Tab',                ':tabnew<esc>'                                                         },
  { n, 'u'       ,  F, '',                       ':Lf<esc>'                                                             },
  { n, 'vv'      ,  F, '',                       ':call TogVE()<CR>'                                                    },
  { n, 'wr'      ,  F, 'Write',                  ':w<esc>'                                                              },
  { n, 'y'       ,  F, '',                       ':hi Normal guibg=Transparent<esc>'                                    },
  { n, 'z'       ,  F, '',                       'z'                                                                    },
  { v, 'M'       ,  F, '',                       ':!dc<esc>'                                                            },
  { v, 'm'       ,  F, '',                       ':!bc<esc>'                                                            },
  { v, 'vc'      ,  F, '',                       ':!column -o " " -t<enter>'                                            },
  { v, 'vs'      ,  F, '',                       ':sort<enter>'                                                         },
  { n, '<C-x>'   ,  F, 'Execute',                ':!%:p<esc>'                                                           },
  { n, '<C-S-x>' ,  F, 'Execute with args',      ':!%:p '                                                               },
  { n, '<Tab>'   ,  F, '',                       ':earlier<CR>'                                                         },
  { n, '<S-Tab>' ,  F, '',                       ':later<CR>'                                                           },
}

-- ALL_MAPPINGS = { [""] = REGULAR_MAPPINGS, ["<LEADER>"] = LEADER_MAPPINGS}

function MyMap(map, prep)
  local description = map[4]
  if prep == nil then prep = '' end
  if map[4] == nil or map[4] == '' then
    description = map[5]
  end

  vim.keymap.set(map[1], prep .. map[2], map[5], {remap = map[3], desc = description})
end

for _, map in ipairs(REGULAR_MAPPINGS) do
  MyMap(map)
  -- vim.keymap.set(map[1], map[2], map[5], {remap = map[3]})
end

for _, map in ipairs(LEADER_MAPPINGS) do
  MyMap(map, '<leader>')
  -- vim.keymap.set(map[1], '<leader>' .. map[2], map[5], {remap = map[3], desc = map[4]})
end



