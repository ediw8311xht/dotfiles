
-- Much help for creating this, not really too good rn still a work in progress
-- Very useful guide to treesitter querying in nvim
-- https://jhcha.app/blog/the-power-of-treesitter/
-- Thank you to Joohoon Cha <3

local ts = vim.treesitter
local vfn = vim.fn
local vapi = vim.api

local M = {
}

-- function M.FirstNode(linettt)
--   local s_column = vfn.match(vfn.getline(linettt), '\\S')
--   print("line: ", vfn.getline(linettt))
--   if s_column < 0 then return false else end
--   print("row: ", linettt, s_column)
--   -- return ts.get_node({bufnr = vfn.bufnr(), pos = {line+1, s_column+1} , ignore_injections = false } ):type()
--   return ts.get_node({bufnr = vfn.bufnr(), pos = {linettt-1, s_column} } ):type()
-- end
--
-- function M.OnSameLine(node1, node2)
--   local sr1, sc1 = node1:range()
--   local sr2, sc2 = node2:range()
--   return sr1 == sr2
-- end
--
-- function M.Gtest()
--   local comment_query = [[
--     ((comment) @my_capture)
--   ]]
--
--   local br = vim.api.nvim_get_current_buf()
--   local ft = vim.api.nvim_get_option_value("ft", { buf = br })
--   local lang = vim.treesitter.language.get_lang(ft)
--   local hle = require("vim.treesitter.highlighter")
--
--   M.tree = ts.get_parser():parse()[1]
--   local query = ts.query.parse(lang, comment_query)
--   if not hle.active[br] then print("[CommentFold] No parser found for treesitter.") return end
--
--   for id, node, metadata in query:iter_captures(M.tree:root(), 0) do
--     local row1, col1, row2, col2 = node:range() -- range of the capture
--     print(row1, col1)
--     local prev_sibling = node:prev_sibling()
--     local next_sibling = node:next_sibling()
--     if prev_sibling:type() ~= "comment" then
--       print(M.OnSameLine(prev_sibling, node))
--       -- print("HI: ", prev_sibling:type())
--     end
--   end
--   -- local query = vim.treesitter.query.parse(lang, bnr);
--   -- ; query
--   -- ]]
--   -- )
--   -- for i in query:iter_captures(
--   -- for v=1,39 do
--   --   print(M.FirstNode(v))
--   --   print("\n")
--   -- end
--   -- print(M.FirstNode(26))
--   -- print("\n")
--   -- for id, node, metadata in query:iter_captures(M.tree:root(), 0) do
--   --   local row1, col1, row2, col2 = node:range() -- range of the capture
--   -- end
-- end
--
-- -- M.Gtest()
-- -- print(ts.highlighter.active(vapi.nvim_get_current_buf()))

function M.Init()
  M.br = vapi.nvim_get_current_buf()
  M.ft = vapi.nvim_get_option_value("ft", { buf = M.br })
  M.lang = ts.language.get_lang(M.ft)
  -- M.hle = require("vim.treesitter.highlighter")
  M.tree = ts.get_parser():parse()[1]
end

function M.IsInner(cpos, nstart, nend)
  return cpos >= nstart and cpos <= nend
end

function M.GoToQuery(query, args)
  ------------- Set options -------------
  local goto_end = args.goto_end or false
  local reverse = args.reverse or false
  local inner = args.inner or false
  ---------------------------------------

  local cpos, _ = unpack(vapi.nvim_win_get_cursor(0))
  cpos = cpos - 1

  local parsed_query = ts.query.parse(M.lang, query)

  for _, node, _ in parsed_query:iter_captures(M.tree:root(), 0, cpos) do
    local node_start_row, node_start_col, node_end_row, node_end_col = node:range()

    local new_pos = goto_end and {node_end_row+1,node_end_col} or {node_start_row+1,node_start_col}
    if M.IsInner(cpos, node_start_row, node_end_row) then
      if inner then return vapi.nvim_win_set_cursor(0, new_pos) end
    else
      return vapi.nvim_win_set_cursor(0, new_pos)
    end
  end
end

function M.GoToFunction(args)
  M.Init()
  local func_query
  if M.ft == "lua" then
    func_query = " ( (function_declaration) @func_decl ) "
  else
    func_query = " ( (function_definition) @func_decl ) "
  end
  M.GoToQuery(func_query, args or {})
end

function M.create_commands()
  vapi.nvim_create_user_command(
    "GotoNextFunctionStart",
    M.GoToFunction,
    { desc="Go to start of next function", nargs=0 }
  )

  vapi.nvim_create_user_command(
    "GotoNextFunctionEnd",
    function() M.GoToFunction({goto_end=true}) end,
    { desc="Go to end of next function", nargs=0 }
  )

  vapi.nvim_create_user_command(
    "GotoInnerFunctionStart",
    function() M.GoToFunction({inner=true}) end,
    { desc="Go to the start of function cursor is currently inside", nargs=0 }
  )

  vapi.nvim_create_user_command(
    "GotoInnerFunctionEnd",
    function() M.GoToFunction({inner=true, goto_end=true}) end,
    { desc="Go to the end of function cursor is currently inside", nargs=0 }
  )
end

return M

