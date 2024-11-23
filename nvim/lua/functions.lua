
local va    = vim.api;
local vauto = vim.api.nvim_create_autocmd
local vc    = vim.cmd

function env_var_check(var)
  local e = os.getenv(var)
  if e == nil or e == '' then
    return false
  else
    return e
  end
end

function ClipBoardExit()
    if env_var_check("$DISPLAY") and va.executable("xclip") then
        va.system('xclip -selection clipboard -i -r <<< ', va.getreg('a'))
    end
end
