
local va    = vim.api
local vauto = vim.api.nvim_create_autocmd
local vc    = vim.cmd

function EnvVarCheck(var)
  local e = os.getenv(var)
  if e == nil or e == '' then
    return false
  else
    return e
  end
end

function ClipBoardExit()
    if EnvVarCheck("$DISPLAY") and va.executable("xclip") then
        va.system('xclip -selection clipboard -i -r <<< ', va.getreg('a'))
    end
end
function Contains(t, v)
  for _,i in ipairs(t) do
    if v == i then
      return true
    end
  end
  return false
end
-- function SearchBuffers(s)
--   vc( {cmd="vimgrep", args={s, "##"} } )
-- end
