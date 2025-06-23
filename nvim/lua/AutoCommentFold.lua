
local ts = vim.treesitter
local vfn = vim.fn

local M = {
}

function M.FirstNode(linettt)
  local s_column = vfn.match(vfn.getline(linettt), '\\S')
  print("line: ", vfn.getline(linettt))
  if s_column < 0 then return false else end
  print("row: ", linettt, s_column)
  -- return ts.get_node({bufnr = vfn.bufnr(), pos = {line+1, s_column+1} , ignore_injections = false } ):type()
  return ts.get_node({bufnr = vfn.bufnr(), pos = {linettt-1, s_column} } ):type()
end

function M.Gtest() 
  local query = vim.treesitter.query.parse('lua', [[
  ; query
  (comment
    content: (comment_content)) @comment
  ]]
  )
  M.tree = ts.get_parser():parse()[1]
  for v=1,39 do
    print(M.FirstNode(v))
    print("\n")
  end
  print(M.FirstNode(26))
  print("\n")
  for id, node, metadata in query:iter_captures(M.tree:root(), 0) do
   local row1, col1, row2, col2 = node:range() -- range of the capture

   -- Print the node name and source text.
   vim.print({node:type(), vim.treesitter.get_node_text(node, vim.api.nvim_get_current_buf())})
  end
end

M.Gtest()
