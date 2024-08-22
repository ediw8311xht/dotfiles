-- local nvim_rocks = require('nvim_rocks')
-- nvim_rocks.install('fun')

function DisableSlow()
  require('cmp').setup.buffer( { enabled = false } )
end

function CheckSize(args)
  if vim.api.nvim_buf_line_count(args.buf) > 5000 then
    DisableSlow()
  end
end


vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*"},
  callback = CheckSize
})
