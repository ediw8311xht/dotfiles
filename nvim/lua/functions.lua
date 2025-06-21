
local va    = vim.api
   -- local vauto = vim.api.nvim_create_autocmd
-- local vc    = vim.cmd

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

function Cycle(check_var, list, func)
  local o = vim.api.nvim_get_option(check_var)
  if not func then
    func = (function(l) vim.api.nvim_set_option(check_var, l[2]) return l[1] end)
  end
  if #list <= 0 then return end
  for i,v in ipairs(list) do
    if v[2] == o then
      local j = (i) % (#list)+1
      return func(list[j])
    end
  end
  return func(list[1])
end

function ReloadConfig()
  for i,v in pairs(package.loaded) do
    print(i, vim.inspect(package.loaded))
  end
end

function CorrectColors()
  local function Main(comm, hl_table)
    if #hl_table == 0 then
      for c,v in pairs(hl_table) do Main(comm .. c, v) end
    else
      vim.cmd("hi " .. comm .. " " .. table.concat(hl_table, " "))
    end
    -- for c,v in pairs(table) do
    --   if type(v) == "table" then
    --     Main(comm..c)
    --   else
    --     vim.cmd(comm
    --   end
    -- end
  end
  Main("", vim.g.my_highlight)
end

-- function CommentExpr(lnum)
--   if not lnum then
--     return 0
--   end
--
-- end
-- function SearchMyMappings(s)
-- end
-- function SubAllBuffs(s)
--   vim.api.nvim_set_option_value("autowriteall", "true")
-- end
-- function SearchAllBuffs(s)
--   -- vim.cmd.buf
--   -- vim.cmd.
-- end






-- function Format(t)
-- end

-- function SearchMaps(search_string)
--   for i,v in pairs(ALL_MAPPINGS) do
--   end
-- end
-- function SearchBuffers(s)
--   vc( {cmd="vimgrep", args={s, "##"} } )
-- end


