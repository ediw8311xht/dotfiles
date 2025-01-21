
local va    = vim.api
local vauto = vim.api.nvim_create_autocmd
local vc    = vim.cmd

-- local function concat_table (...)
--   local new_table = {}
--   for _,t in ipairs({...}) do
--     if (type(t) == table) then
--       for _,v in concat_table(t) do
--         table.insert(new_table, v)
--       end
--     else
--       table.insert(new_table, t)
--     end
--   end
--   return new_table
-- end

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

function Contains(t, check_value, callback)
  if callback == nil then callback = (function(a,b) return a == b end) end
  for _,v in ipairs(t) do
    if callback(v, check_value) then
      return true
    end
  end
  return false
end

-- function SearchMaps(search_string)
--   for i,v in pairs(ALL_MAPPINGS) do
--   end
-- end
-- function SearchBuffers(s)
--   vc( {cmd="vimgrep", args={s, "##"} } )
-- end
