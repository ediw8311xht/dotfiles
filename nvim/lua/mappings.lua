#!/usr/bin/lua


-- local status1 = '%t %r%m%=[%v] (%L lines) (%{wordcount().words} words)%=%#HLspStatus#%{LspStatus()}%*[%{LspStatus()}] [%F]'





-- local _l = '<leader>'
local F = false;
local T = true;
local n = 'n';
local i = 'i';
local t = 't';
local v = 'v';


REGULAR_MAPPINGS={
  { i,    F, '',                       '<C-S-t>',  '<C-d>'                                      },
  { i,    F, '',                       '<C-S-k>',  '<C-o>C'                                     },
  { i,    F, '',                       '<C-\\>',   '<C-o>u'                                     },
  { i,    F, '',                       '<C-S-\\>', '<C-o><C-r>'                                 },
  { i,    F, '',                       '<C-a>',    '<C-o>I'                                     },
  { i,    F, '',                       '<C-b>',    '<left>'                                     },
  { i,    F, '',                       '<C-e>',    '<C-o>A'                                     },
  { i,    F, '',                       '<C-f>',    '<right>'                                    },
  { i,    F, '',                       '<C-w>',    '<S-right>'                                  },
  { i,    F, '',                       '<C-S-w>',  '<S-left>'                                   },
  { i,    F, '',                       '<C-w>',    '<S-right>'                                  },
  { i,    F, '',                       '<C-S-w>',  '<S-left>'                                   },

  { i,    F, '',                       'jk',       '<esc>'                                      },

  { '',   T, '',                       '+',        'g_'                                         },
  { '',   T, '',                       ',',        '<leader>'                                   },

  { n,    F, '',                       '<C-S-E>',  'bbe'                                        },
  { n,    F, '',                       '/',        '/\\v\\c'                                    },
  { n,    F, '',                       '<C-S-H>',  '<C-w>h'                                     },
  { n,    F, '',                       '<C-S-J>',  '<C-w>j'                                     },
  { n,    F, '',                       '<C-S-K>',  '<C-w>k'                                     },
  { n,    F, '',                       '<C-S-L>',  '<C-w>l'                                     },
  { n,    F, '',                       '<C-\\>',   '/\\V'                                       },
  { n,    F, '',                       '<C-_>',    '/\\v'                                       },
  { n,    F, '',                       '<C-h>',    '<C-w>h'                                     },
  { n,    F, '',                       '<C-j>',    '<C-w>j'                                     },
  { n,    F, '',                       '<C-k>',    '<C-w>k'                                     },
  { n,    F, '',                       '<C-l>',    '<C-w>l'                                     },
  { n,    F, '',                       '<C-p>',    '<C-i>'                                      },
  { n,    F, 'Sub char insensitive',   '<C-s>',    ':%s/\\v\\c'                                 },
  { n,    F, 'Sub char sensitive',     '<C-S-s>',  ':%s/\\v'                                    },
  { n,    F, '',                       '<C-w>n',   ':new<esc><C-w>L'                            },
  { n,    F, '',                       '<esc>',    ':noh<esc>:echon ""<enter>'                  },
  { n,    F, '',                       '?',        '?\\v\\c'                                    },
  { n,    F, '',                       'ZG',       ':wqall<CR>'                                 },
  { n,    F, '',                       '\\',       '/\\V\\c'                                    },
  { n,    F, '',                       '\\|',      '?\\V\\c'                                    },
  { n,    F, '',                       '`',        '@=(foldlevel(\'.\')?\'za\':"<Space>")<CR>'  },
  { '',   F, '',                       ',;',       ','                                          },
  { '',   F, '',                       'x',        '"xx'                                        },
  { t,    T, '',                       '<C-w>',    '<C-\\><C-n>'                                },
  { v,    F, 'Sub char insensitive',   '<C-s>',    ':s/\\%V\\v\\c'                              },
  { v,    F, 'Sub char sensitive',     '<C-S-s>',  ':s/\\%V\\v'                                 },
  { n,    F, '',                       '<C-n>' ,   ':NERDTreeToggle<CR>'                        },
  { v,    F, '',                       '`',        'zf'                                         },
}

LEADER_MAPPINGS={
  { n, F, 'Prev Tab',               'tb'  ,  ':tabmove -1<esc>'                                                      },
  { n, F, 'Next Tab',               'tn'  ,  ':tabmove +1<esc>'                                                      },
  { n, F, 'New Tab',                'tt'  ,  ':tabnew<esc>'                                                          },
  { n, F, 'Alternate File',         ','   ,  '<C-^>'                                                                 },
  { n, F, 'Next Buffer',            ']'   ,  ':bnext<CR>'                                                            },
  { n, F, 'Prev Buffer',            '['   ,  ':bprevious<CR>'                                                        },
  { n, F, 'Equalize Split Hori',    '-'   ,  '20<c-w><'                                                              },
  { n, F, 'Equalize Split Vert',    '='   ,  '20<c-w>>'                                                              },
  { n, F, 'Start LSP',              'A'   ,  ':LspStart()<CR>'                                                       },
  { n, F, 'Stop LSP',               'a'   ,  ':LspStop<CR>'                                                          },
  { n, F, 'open buffer',            'b'   ,  ':Buffers<esc>'                                                         },
  { n, F, '+ Line Len Indicator',   'cc'  ,  ':call TogCC()<CR>'                                                     },
  { n, F, '+ CursorLine',           'cl'  ,  ':set nocul!<CR>'                                                       },
  { n, F, '+ Statusline',           'cs'  ,  ':call TogSL()<CR>'                                                     },
  { n, F, '+ spell',                'cS'  ,  ':set spell!<CR>'                                                       },
  { n, F, 'Delete Buffer',          'D'   ,  ':bd<esc><enter>'                                                       },
  { n, F, 'Find Space EOL',         'df'  ,  ':%s/\\s\\+\\ze$//gc<CR>'                                               },
  { n, F, '+ CursorColumn',         'e'   ,  ':set cuc!<CR>'                                                         },
  { n, F, 'CWD Edit',               'E'   ,  ':call feedkeys(":e " . FilePathFull() . "/")<CR>'                      },
  { n, F, '+ Wrap',                 'f'   ,  ':set wrap!<esc>'                                                       },
  { n, F, 'New File',               'gn'  ,  ':enew<esc>'                                                            },
  { n, F, 'Get highlight',          'gh'  ,  ':call GetHL()<ESC>'                                                    },
  { n, F, 'Print Mappings',         'gm'  ,  ':call GMaps()<CR>'                                                     },
  { n, F, 'Helpgrep',               'H'   ,  ':vert helpgrep '                                                       },
  { n, F, 'Open diagnostics',       'i'   ,  ':lua vim.diagnostic.open_float(nil, {focus=T, scope="cursor"})<CR>'    },
  { n, F, '+ lsp_lines',            'I'   ,  ':lua require("lsp_lines").toggle()<CR>'                                },
  { n, F, 'Next Scheme',            'j'   ,  ':call SetColScheme(+1)<CR>'                                            },
  { n, F, 'Prev Scheme',            'J'   ,  ':call SetColScheme(-1)<CR>'                                            },
  { n, F, 'CorrectColor',           'k'   ,  ':call CorrectColors()<CR>'                                             },
  { n, F, 'Next Background',        'l'   ,  ':call CyBack(+1)<CR>'                                                  },
  { n, F, 'Prev Background',        'L'   ,  ':call CyBack(-1)<CR>'                                                  },
  { n, F, 'Checkhealth',            'mh'  ,  ':checkhealth<CR>'                                                      },
  { n, F, 'Messages',               'mm'  ,  ':messages<esc>'                                                        },
  { n, F, 'Previous Buffer',        'N'   ,  ':cnext<esc>'                                                           },
  { n, F, 'Next Buffer',            'n'   ,  ':next<esc>'                                                            },
  { n, F, '',                       'ob'  ,  ':silent !"${BROWSER:-"brave"}"  %<CR>'                                 },
  { n, F, '',                       'oq'  ,  ':silent !"qutebrowser" %<CR>'                                          },
  { n, F, '',                       'q'   ,  ':bd'                                                                   },
  { n, F, '',                       's'   ,  '<C-w><C-p>'                                                            },
  { n, F, '',                       'S'   ,  ':source ~/.config/nvim/init.vim<esc>'                                  },
  { n, F, '',                       'T'   ,  ':term<esc>'                                                            },
  { n, F, '',                       'u'   ,  ':Lf<esc>'                                                              },
  { n, F, '',                       'vv'  ,  ':call TogVE()<CR>'                                                     },
  { n, F, 'VimwikiIndex',           'W'   ,  '<Plug>VimwikiIndex'                                                    },
  { n, F, 'Write',                  'w'   ,  ':w<esc>'                                                               },
  { n, F, 'Execute with args',      'X'   ,  ':!%:p '                                                                },
  { n, F, 'Execute',                'x'   ,  ':!%:p<esc>'                                                            },
  { n, F, '',                       'y'   ,  ':hi Normal guibg=Transparent<esc>'                                     },
  { n, F, '',                       'ZC'  ,  ':bd<esc>'                                                              },
  { n, F, '',                       'z'   ,  'z'                                                                     },

  { v, F, '',                       'M'   ,  ':!dc<esc>'                                                             },
  { v, F, '',                       'm'   ,  ':!bc<esc>'                                                             },
  { v, F, '',                       'vc'  ,  ':!column -o " " -t<enter>'                                             },
  { v, F, '',                       'vs'  ,  ':sort<enter>'                                                          },
}

-- ALL_MAPPINGS = { [""] = REGULAR_MAPPINGS, ["<LEADER>"] = LEADER_MAPPINGS}

for _, map in ipairs(REGULAR_MAPPINGS) do
  vim.keymap.set(map[1], map[4], map[5], {remap = map[2]})
end

for _, map in ipairs(LEADER_MAPPINGS) do
  vim.keymap.set(map[1], '<leader>' .. map[4], map[5], {remap = map[2]})
end



