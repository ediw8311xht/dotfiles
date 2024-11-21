
local va    = vim.api;
local vauto = vim.api.nvim_create_autocmd;
local vc    = vim.cmd;
function ClipBoardExit()
    if va.executable("xclip") then
        va.system('xclip -selection clipboard -i -r <<< ', va.getreg('a'))
    end
end
