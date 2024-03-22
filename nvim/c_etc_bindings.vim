
source ${HOME}/.config/nvim/c_functions.vim

"-- Map  (Normal, Visual, Select, OperatorPending --
call  B( 'map',   ',',        '<leader>' )
call  B( 'map',   '+',        'g_' )
"--   Visual     --
call  B( 'vn',    'im',       ':s/\%V[ \t]*//<esc>' )
call  B( 'vn',    '<Enter>',  'zf' )
"--   Normal     --
call  B( 'nn',    '<C-H>',    '<C-w>h' )
call  B( 'nn',    '<C-J>',    '<C-w>j' )
call  B( 'nn',    '<C-K>',    '<C-w>k' )
call  B( 'nn',    '<C-L>',    '<C-w>l' )
call  B( 'nn',    '<esc>',    ':noh<esc>:echon ""<enter>' )
call  B( 'nn',    '<C-p>',    '<C-i>' )
call  B( 'nn',    '/',        '/\v\c' )
call  B( 'nn',    '?',        '?\v\c' )
call  B( 'nn',    '<C-_>',    '/\v' )
call  B( 'nn',    '\',        '/\V\c' )
call  B( 'nn',    '\|',       '?\V\c' )
call  B( 'nn',    '<C-\>',    '/\V' )
call  B( 'nn',    '<lt>',     ':tabprevious<esc>' )
call  B( 'nn',    '>',        ':tabnext<esc>' )
call  B( 'nn',    'x',        '"xx' )
call  B( 'nn',    '<C-w>n',   ':new<esc><C-w>L' )
call  B( 'nn',    '<Enter>',  '@=(foldlevel('."'.')?'za':".'"\<Space>")<CR>' )
"--   Insert     --
call  B( 'ino',   'jk',       '<esc>' )
call  B( 'ino',   '<C-a>',    '<esc>I' )
call  B( 'ino',   '<C-b>',    '<left>' )
call  B( 'ino',   '<C-e>',    '<esc>A' )
call  B( 'ino',   '<C-f>',    '<right>' )
call  B( 'ino',   '<C-K>',    '<esc>lC' )
call  B( 'ino',   '<C-\>',    '<esc>ui' )
call  B( 'ino',   '<C-v>',    '<esc><C-r>i' )
"--   Terminal   --
call  B( 'tmap',  '<C-w>',    '<C-\><C-n>' )

