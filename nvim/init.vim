
"<==============================================================================>
"<==------------------======================================------------------==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==-----    ||||-----==__________________________________==-----    ||||-----==>
"<==-    ||||||||||||-==                                  ==-    ||||||||||||-==>
"<==-    ||||||||||||-== Nvim Config - Maximilian Ballard ==-    ||||||||||||-==>
"<==-----    ||||-----==__________________________________==-----    ||||-----==>
"<==-----    ||||-----==                                  ==-----    ||||-----==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==-----    ||||-----======================================-----    ||||-----==>
"<==------------------======================================------------------==>
"<==============================================================================>
"<==============================================================================>
source $XDG_CONFIG_HOME/nvim/settings.vim
lua require('autocmd')
lua require('variables')
lua require('functions')
source $XDG_CONFIG_HOME/nvim/plugins.vim
source $XDG_CONFIG_HOME/nvim/functions.vim
lua require('which_key_config')
lua require('base')
lua require('cmp_config')
lua require('lsp_configs')
lua require('my_elixir')
lua require('gitsigns_config')
lua require('notify_config')
lua require('mappings')
lua require('textobjects')

call nvim_set_option("statusline", g:my_statuslines[0][1])
colorscheme pop-punk
lua CorrectColors()
lua require('mytreesitter')
