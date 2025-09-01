#!/usr/bin/lua

--
--  _____________________________________________________________________________
--  ||                                                                         ||
--  ||                                                         [*map-table*]   ||
--  ||            Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |   ||
--  ||   Command        +------+-----+-----+-----+-----+-----+------+------+   ||
--  ||   [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |   ||
--  ||   n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |   ||
--  ||   [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |   ||
--  ||   i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |   ||
--  ||   c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |   ||
--  ||   v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |   ||
--  ||   x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |   ||
--  ||   s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |   ||
--  ||   o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |   ||
--  ||   t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |   ||
--  ||   l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |   ||
--  ||_________________________________________________________________________||
--  ||                                                                         ||
--  ||   1.4 LISTING MAPPINGS                                [*map-listing*]   ||
--  ||                                                                         ||
--  ||   When listing mappings the characters in the first two columns are:    ||
--  ||                                                                         ||
--  ||    CHAR     MODE                                                        ||
--  ||   <Space>   Normal, Visual, Select and Operator-pending                 ||
--  ||      n      Normal                                                      ||
--  ||      v      Visual and Select                                           ||
--  ||      s      Select                                                      ||
--  ||      x      Visual                                                      ||
--  ||      o      Operator-pending                                            ||
--  ||      !      Insert and Command-line                                     ||
--  ||      i      Insert                                                      ||
--  ||      l      ":lmap" mappings for Insert, Command-line and Lang-Arg      ||
--  ||      c      Command-line                                                ||
--  ||      t      Terminal-Job                                                ||
--  ||-------------------------------------------------------------------------||
--  || mode([{expr}])                                             [*mode()*]   ||
--  ||_________________________________________________________________________||________
--  ||    n         | Normal                                                           ||
--  ||    no        | Op-pending                                                       ||
--  ||    nov       | Op-pending (forced charwise |o_v|)                               ||
--  ||    noV       | Op-pending (forced linewise |o_V|)                               ||
--  ||    noCTRL-V  | Op-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character ||
--  ||    niI       | Normal using |i_CTRL-O| in |Insert-mode|                         ||
--  ||    niR       | Normal using |i_CTRL-O| in |Replace-mode|                        ||
--  ||    niV       | Normal using |i_CTRL-O| in |Virtual-Replace-mode|                ||
--  ||    nt        | Normal in |terminal-emulator| (insert goes to Terminal mode)     ||
--  ||    ntT       | Normal using |t_CTRL-\_CTRL-O| in |Terminal-mode|                ||
--  ||    v         | Visual by character                                              ||
--  ||    vs        | Visual by character using |v_CTRL-O| in Select mode              ||
--  ||    V         | Visual by line                                                   ||
--  ||    Vs        | Visual by line using |v_CTRL-O| in Select mode                   ||
--  ||    CTRL-V    | Visual blockwise                                                 ||
--  ||    CTRL-Vs   | Visual blockwise using |v_CTRL-O| in Select mode                 ||
--  ||    s         | Select by character                                              ||
--  ||    S         | Select by line                                                   ||
--  ||    CTRL-S    | Select blockwise                                                 ||
--  ||    i         | Insert                                                           ||
--  ||    ic        | Insert mode completion |compl-generic|                           ||
--  ||    ix        | Insert mode |i_CTRL-X| completion                                ||
--  ||    R         | Replace |R|                                                      ||
--  ||    Rc        | Replace mode completion |compl-generic|                          ||
--  ||    Rx        | Replace mode |i_CTRL-X| completion                               ||
--  ||    Rv        | Virtual Replace |gR|                                             ||
--  ||    Rvc       | Virtual Replace mode completion |compl-generic|                  ||
--  ||    Rvx       | Virtual Replace mode |i_CTRL-X| completion                       ||
--  ||    c         | Command-line editing                                             ||
--  ||    cr        | Command-line editing overstrike mode |c_<Insert>|                ||
--  ||    cv        | Vim Ex mode |gQ|                                                 ||
--  ||    cvr       | Vim Ex mode while in overstrike mode |c_<Insert>|                ||
--  ||    r         | Hit-enter prompt                                                 ||
--  ||    rm        | The -- more -- prompt                                            ||
--  ||    r?        | A |:confirm| query of some sort                                  ||
--  ||    !         | Shell or external command is executing                           ||
--  ||    t         | Terminal mode: keys go to the job                                ||
--  ||_________________________________________________________________________________||

local F = false;
local T = true;
local n = 'n';
local i = 'i';
local t = 't';
local v = 'v';
local e = '';
local c = 'c';
-- local l = 'l';
-- [ '<C-p>'    ] = {F, 'Substitute [All Buffs]', ':%s/\\v\\c'                              },

REGULAR_MAPPINGS={
  [e] = {
    [ '+'        ] = {T, 'End of line',            'g_'                                          },
    [ ','        ] = {T, '<leader>',               '<leader>'                                    },
    [ ',;'       ] = {F, '',                       ','                                           },
    [ 'x'        ] = {F, '',                       '"xx'                                         },
  }, [n] = {
    [ '/'        ] = {F, 'Search +vmagic',         '/\\v\\c'                                    },
    [ '<C-S-E>'  ] = {F, 'End of previous word',   'ge'                                         },
    [ '<C-S-H>'  ] = {F, 'Left pane',              '<C-w>h'                                     },
    [ '<C-S-J>'  ] = {F, 'Down pane',              '<C-w>j'                                     },
    [ '<C-S-K>'  ] = {F, 'Up Pane',                '<C-w>k'                                     },
    [ '<C-S-L>'  ] = {F, 'Right pane',             '<C-w>l'                                     },
    [ '<C-S-Tab>'] = {F, 'Previous tab',           ':tabprevious<CR>'                           },
    [ '<C-S-s>'  ] = {F, 'Substitute +char +vmagic', ':%s/\\v'                                  },
    [ '<C-Tab>'  ] = {F, 'Next tab',               ':tabnext<CR>'                               },
    [ '<C-h>'    ] = {F, 'Left Pane',              '<C-w>h'                                     },
    [ '<C-j>'    ] = {F, 'Down Pane',              '<C-w>j'                                     },
    [ '<C-k>'    ] = {F, 'Up Pane',                '<C-w>k'                                     },
    [ '<C-l>'    ] = {F, 'Right Pane',             '<C-w>l'                                     },
    [ '<C-n>'    ] = {F, '+Nerd Tree',             ':NERDTreeToggle<CR>'                        },
    [ '<C-s>'    ] = {F, 'Substitute i',           ':%s/\\v\\c'                                 },
    [ '<C-w>n'   ] = {F, 'New Buffer Right',       ':new<esc><C-w>L'                            },
    [ '<esc>'    ] = {F, 'Clear',                  ':noh<esc>:echon ""<enter>'                  },
    [ '?'        ] = {F, 'Search +back +vmagic',   '?\\v\\c'                                    },
    [ 'ZG'       ] = {F, 'Write quit all',         ':wqall<CR>'                                 },
    [ '`'        ] = {F, 'Fold',                   '@=(foldlevel(\'.\')?\'za\':"<Space>")<CR>'  },
    [ '|'        ] = {F, 'Search -magic',          '/\\V\\c'                                    },
    [ '{'        ] = {F, 'Prev Function Start',    ':GotoPrevFunctionStart<CR>'                 },
    [ '}'        ] = {F, 'Next Function Start',    ':GotoNextFunctionStart<CR>'                 },
    [ 'gne'      ] = {F, 'Next Function End',      ':GotoNextFunctionEnd<CR>'                   },
    [ '<C-S-g>'  ] = {F, '! Floating Term',        ':FloatermToggle!<esc>'                      },
  }, [t] = {
    [ '<C-w>'    ] = {T, 'Normal Mode Terminal',   '<C-\\><C-n>'                },
    [ '<C-S-g>'  ] = {T, '! Floating Term',        '<C-w>:FloatermToggle!<esc>' },
  }, [v] = {
    -- [ '{'        ] = {F, 'Prev Function Start',    ':GotoPrevFunctionStart<CR>'                  },
    -- [ '}'        ] = {F, 'Next Function Start',    ':GotoNextFunctionStart<CR>'                  },
    [ '<C-S-s>'  ] = {F, 'Sub +char +vm',          ':s/\\%V\\v'                                  },
    [ '<C-s>'    ] = {F, 'Sub +vm',                ':s/\\%V\\v\\c'                               },
    [ '`'        ] = {F, '',                       'zf'                                          },
  }, [i] = {
    [ '<C-S-\\>' ] = {F, 'Redo',                   '<C-o><C-r>'                                  },
    [ '<C-k>'    ] = {F, 'Redo',                   '<C-o>D'                                      },
    [ '<C-S-k>'  ] = {F, 'Delete to end of line',  '<C-o>D'                                      },
    [ '<C-S-t>'  ] = {F, 'Remove indent',          '<C-d>'                                       },
    [ '<C-\\>'   ] = {F, 'Undo',                   '<C-o>u'                                      },
    [ 'jk'       ] = {F, 'Exit Insert[m]',         '<esc>'                                       },
  }, [c] = {
    [ '<C-k>'    ] = {F, '',                       '<C-c>D<C-c>'                                  },
    [ '<C-S-k>'  ] = {F, '',                       '<C-c>D<C-c>'                                  },
  }, [ {c, i} ] = {
    [ '<C-a>'    ] = {F, 'Start of line',          '<home>'                                      },
    [ '<C-b>'    ] = {F, 'Backward char',          '<left>'                                      },
    [ '<C-e>'    ] = {F, 'End of line',            '<end>'                                       },
    [ '<C-f>'    ] = {F, 'Forward char',           '<right>'                                     },
    [ '<C-w>'    ] = {F, 'Forward word',           '<S-right>'                                   },
    [ '<C-S-w>'  ] = {F, 'Backward word',          '<S-left>'                                    },
    [ '<C-BS>'   ] = {F, 'Delete word backwards',  '<C-w>'                                       },
    -- [ '<C-S-e>'  ] = {F, '',                       '<C-e>'                                   },
  }, [ {n, v, t, i} ] = {
    [ "<C-1>" ] = { F, 'Go to tab 1',    "1gt"           },
    [ "<C-2>" ] = { F, 'Go to tab 2',    "2gt"           },
    [ "<C-3>" ] = { F, 'Go to tab 3',    "3gt"           },
    [ "<C-4>" ] = { F, 'Go to tab 4',    "4gt"           },
    [ "<C-5>" ] = { F, 'Go to tab 5',    "5gt"           },
    [ "<C-6>" ] = { F, 'Go to tab 6',    "6gt"           },
    [ "<C-7>" ] = { F, 'Go to tab 7',    "7gt"           },
    [ "<C-8>" ] = { F, 'Go to tab 8',    "8gt"           },
    [ "<C-9>" ] = { F, 'Go to last tab', ":tablast<CR>"  },
  },
}

-- beginning 
LEADER_MAPPINGS = {
  [n] = {
    [ ','       ] = { F, 'Alternate File',         '<C-^>'                                                                },
    [ '-'       ] = { F, 'Equalize Split Hori',    '20<c-w><'                                                             },
    -- Excute --
    [ '<C-s>'   ] = { F, 'Sub in all buffs',       ':budfo %s/\\v\\c'                                                     },
    [ '<C-S-x>' ] = { F, 'Execute with args',      ':!%:p '                                                               },
    [ '<C-x>'   ] = { F, 'Execute',                ':!%:p<esc>'                                                           },
    [ '<S-x>'   ] = { F, 'Execute with args',      ':!%:p '                                                               },
    [ 'x'       ] = { F, 'Execute',                ':!%:p<esc>'                                                           },

    [ '<S-Tab>' ] = { F, 'Later',                  ':later<CR>'                                                           },
    [ '<Tab>'   ] = { F, 'Earlier',                ':earlier<CR>'                                                         },
    [ '='       ] = { F, 'Equalize Split Vert',    '20<c-w>>'                                                             },
    [ 'D'       ] = { F, 'Delete Buffer',          ':bd<esc><enter>'                                                      },
    [ 'E'       ] = { F, 'CWD Edit',               ':call feedkeys(":e " . FilePathFull() . "/")<CR>'                     },
    -- Session --
    [ 'Fa'      ] = { F, '! Session Auto Save',    ':AutoSession toggle<CR>'                                              },
    [ 'Fs'      ] = { F, '[Args] Session Save',    ':AutoSession save '                                                   },
    [ 'FS'      ] = { F, 'Session Save',           ':AutoSession save<CR>'                                                },
    [ 'Fc'      ] = { F, 'Session Search',         ':AutoSession search<CR>'                                              },
    [ 'H'       ] = { F, 'Helpgrep',               ':vert helpgrep '                                                      },
    [ 'I'       ] = { F, 'Show code-action',       ':lua require("actions-preview").code_actions()<CR>'                   },
    [ 'L'       ] = { F, 'Prev Background',        ':call CyBack(-1)<CR>'                                                 },
    [ 'N'       ] = { F, 'Previous Buffer',        ':cnext<esc>'                                                          },
    -- [ 'S'       ] = { F, 'Source vim config',      ':source ~/.config/nvim/init.vim<esc>'                                 },
    [ 'Tt'      ] = { F, 'Terminal',               ':term<esc>'                                                           },
    [ 'Te'      ] = { F, 'Telescope',              ':Telescope<cr>'                                                       },
    [ 'W'       ] = { F, 'VimwikiIndex',           '<Plug>VimwikiIndex'                                                   },
    [ 'ZC'      ] = { F, 'Delete Buffer',          ':bd<esc>'                                                             },
    [ '['       ] = { F, 'Prev Buffer',            ':bprevious<CR>'                                                       },
    [ ']'       ] = { F, 'Next Buffer',            ':bnext<CR>'                                                           },
    [ 'b'       ] = { F, 'open buffer',            ':Buffers<esc>'                                                        },
    [ 'cA'      ] = { F, 'Start LSP',              ':LspStart()<CR>'                                                      },
    [ 'ca'      ] = { F, 'Stop LSP',               ':LspStop<CR>'                                                         },
    [ 'cC'      ] = { F, '! Comments in gutter',   ':call TogFoldColumn()<CR>'                                            },
    [ 'cJ'      ] = { F, 'Prev Scheme',            ':call SetColScheme(-1)<CR>'                                           },
    [ 'cL'      ] = { F, 'Cycle Statusline',       ':lua = Cycle("statusline", vim.g.my_statuslines)<CR>'                 },
    [ 'cS'      ] = { F, '! Spell',                ':set spell!<CR>'                                                      },
    [ 'cc'      ] = { F, '! Line Length Indicator',':call TogColorColumn()<CR>'                                           },
    [ 'ce'      ] = { F, '! CursorColumn',         ':set cuc!<CR>'                                                        },
    [ 'cf'      ] = { F, 'Format',                 ':!prettier -w %<ESC>'                                                  },
    [ 'cg'      ] = { F, '! Git Signs',            ':Gitsigns toggle_signs<CR>'                                           },
    [ 'cj'      ] = { F, 'Next Scheme',            ':call SetColScheme(+1)<CR>'                                           },
    [ 'ck'      ] = { F, 'CorrectColors()',        ':lua CorrectColors()<CR>'                                             },
    [ 'cl'      ] = { F, '! CursorLine',           ':set nocul!<CR>'                                                      },
    -- [ 'cp'      ] = { F, '! Rainbow Parenth',      ':RainbowToggle<CR>'                                                   },
    [ 'cs'      ] = { F, '! Statusline',           ':call TogLastStatus()<CR>'                                            },
    [ 'cv'      ] = { F, '! Virtualedit',          ':call TogVirtualEdit()<CR>'                                           },
    [ 'cV'      ] = { F, '! lsp_lines',            ':lua require("lsp_lines").toggle()<CR>'                               },
    [ 'cw'      ] = { F, '! Wrap',                 ':set wrap!<esc>'                                                      },
    [ 'df'      ] = { F, 'Find Space EOL',         ':%s/\\s\\+\\ze$//gc<CR>'                                              },
    [ 'gh'      ] = { F, 'Get Highlight',          ':call GetHL()<ESC>'                                                   },
    [ 'gm'      ] = { F, 'Print Mappings',         ':call GMaps()<CR>'                                                    },
    [ 'gn'      ] = { F, 'New File',               ':enew<esc>'                                                           },
    [ 'grg'     ] = { F, 'Search in All Buffers',  ':Lines<esc>'                                                          },

    [ 'i'       ] = { F, 'Show diagnostics',       ':lua vim.diagnostic.open_float(nil, {focus=T, scope="cursor"})<CR>'   },
    [ 'l'       ] = { F, 'Next Background',        ':call CyBack(+1)<CR>'                                                 },
    [ 'mh'      ] = { F, 'Checkhealth',            ':checkhealth<CR>'                                                     },
    [ 'mm'      ] = { F, 'Messages',               ':messages<esc>'                                                       },
    [ 'n'       ] = { F, 'Next Buffer',            ':next<esc>'                                                           },
    [ 'ob'      ] = { F, 'Open in Browser',        ':silent !"${BROWSER:-"brave"}"  %<CR>'                                },
    [ 'oq'      ] = { F, 'Open in Qutebrowser',    ':silent !"qutebrowser" %<CR>'                                         },
    [ 'q'       ] = { F, 'Delete buffer',          ':bd'                                                                  },
    [ 's'       ] = { F, 'Switch pane',            '<C-w><C-p>'                                                           },
    [ 'Sl'      ] = { F, 'Luafile',                ':luafile %<CR>'                                                       },
    [ 'Ss'      ] = { F, 'Source file',            ':%so<CR>'                                                             },
    [ 'Sx'      ] = { F, 'Execute',                ':!%<CR>'                                                              },
    [ 'SX'      ] = { F, 'Execute with args',      ':!%'                                                                  },
    [ 'tb'      ] = { F, 'Prev Tab',               ':tabmove -1<esc>'                                                     },
    [ 'tn'      ] = { F, 'Next Tab',               ':tabmove +1<esc>'                                                     },
    [ 'tt'      ] = { F, 'New Tab',                ':tabnew<esc>'                                                         },
    [ 'u'       ] = { F, 'lf file manager',        ':Lf<esc>'                                                             },
    [ 'wr'      ] = { F, 'Write',                  ':w<esc>'                                                              },
    [ 'y'       ] = { F, 'bg transparent',         ':hi Normal guibg=Transparent<esc>'                                    },
    [ 'z'       ] = { F, '',                       'z'                                                                    },
  }, [v] = {
    [ 'mf'       ] = { F, 'bc [math] float',        ':!bc -l<esc>'                                                         },
    [ 'mi'       ] = { F, 'bc [math] int',          ':!bc -l<esc>'                                                         },
    [ 'mq'       ] = { F, 'qalc [math]',            ':!xargs qalc --color=never --terse<esc>'                              },
    [ 'vc'       ] = { F, 'column',                 ':!column -o " " -t<enter>'                                            },
    [ 'vs'       ] = { F, 'sort',                   ':sort<enter>'                                                         },
    [ 'vt'       ] = { F, 'title case',             ':s/\\%V\\v\\c\\w(\\a*(\'\\a{0,1})?\\w)?/\\u\\0/g<CR>'                 },
  }
}

ALL_MAPPINGS = { [""] = REGULAR_MAPPINGS, ["<LEADER>"] = LEADER_MAPPINGS}
local which_key = require("which-key")

function KeyMapSetter(map, pre)
  for mode, mode_map in pairs(map) do
    for key, tbl in pairs(mode_map) do
      which_key.add({ pre .. key, desc = tbl[2], mode = mode })
      vim.keymap.set(mode, pre .. key, tbl[3], { remap = tbl[1], desc = tbl[2] } )
    end
  end
end

KeyMapSetter(LEADER_MAPPINGS, "<leader>")
KeyMapSetter(REGULAR_MAPPINGS, "")
-- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
-- vim.keymap.set('n', 'grr', function() vim.lsp.buf.references() end)
-- vim.keymap.set('n', '<C-m>', function() vim.diagnostic.open_float() end)

-- local status1 = '%t %r%m%=[%v] (%L lines) (%{wordcount().words} words)%=%#HLspStatus#%{LspStatus()}%*[%{LspStatus()}] [%F]'


-- { n,    '<C-|>',    F, 'Search icase exact',     '/\\V'                                       },
-- { n,    '<C-_>',    F, '',                       '/\\v'                                       },
-- { n,    '<Tab>',    F, '',                       ':earlier<CR>'                               },
-- { n,    '<S-Tab>',  F, '',                       ':later<CR>'                                 },
-- { n,    '\\|',      F, '',                       '?\\V\\c'                                    },



-- local _l = '<leader>'
-- { n, 'I'   ,  F, '+ lsp_lines',            ':lua require("lsp_lines").toggle()<CR>'                            },
-- [ '<C-p>'    ] = {F, 'Substitute',             '<C-i>'                                      },

