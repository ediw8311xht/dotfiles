
local home  = vim.env.HOME
local va    = vim.api
local vauto = vim.api.nvim_create_autocmd
local vc    = vim.cmd

TemplatePath = home .. "/.config/nvim/language_specific/templates/"
MaxLinesCMP = 5000


---------------------------------
-- Disable CMP For Large Files --
---------------------------------
vauto({"BufEnter", "BufWinEnter"}, {
  pattern = {"*"},
  callback = function(args)
    if va.nvim_buf_line_count(args.buf) > MaxLinesCMP then
      require('cmp').setup.buffer( { enabled = false } )
    end
  end})
vauto({"FocusGained", "CursorHold", "CursorHoldI"}, {
  pattern = { "*" },
  callback = function()
    vc("silent! checktime")
  end})
-------------------------
-- BufNewFile, BufRead --
-------------------------
local function bufnew_bufread(glob, comms)
  vauto({"BufNewFile", "BufRead"}, {
    pattern = glob,
    callback = function()
      for _,com in ipairs(comms) do
        vc(com)
      end
    end})
end
local function bufnr_add(globcomms)
  for glob,comms in pairs(globcomms) do
    bufnew_bufread(glob, comms)
  end
end
-------------------------
-- Templates ------------
-------------------------
local function template_add(glob, template_path)
  vauto({"BufNewFile"}, {
    pattern = glob,
    callback = function()
      local full_path = TemplatePath .. template_path
      vc("0read " .. full_path)
      vc("silent w")
      vc("silent !chmod 700 %")
    end})
end
local function template_add_e(exts)
  for _,ext in ipairs(exts) do
    template_add("*." .. ext, "template." .. ext)
  end
end
-------------------------
-- Vars -----------------
-------------------------
local exts = { "sh", "py", "kalker", "exs", "tex", "ex", "html", "cpp" }
local globcomms = {
  [home .. "/.bashrc"] = {
      "setfiletype bash",
      "source ${HOME}/.config/nvim/language_specific/bashrc.vim"
    },
  [home .. "/bashrc_files/*" ]              = { "setfiletype bash"      } ,
  ["*.sh" ]                                 = { "setfiletype bash"      } ,
  [home .. "/.config/polybar/*.ini" ]       = { "setfiletype dosini"    } ,
  [home .. "/.config/polybar/*/*.ini" ]     = { "setfiletype dosini"    } ,
  ["*.kalker" ]                             = { "setfiletype kalker"    } ,
  [home .. "/.config/i3/*" ]                = { "setfiletype i3"        } ,
  ["*.ex,*.exs" ]                           = { "setfiletype elixir"    } ,
  ["*.schema" ]                             = { "setfiletype sql"       } ,
  ["*.md" ]                                 = { "setfiletype markdown"  } ,
  [home .. "/.config/zathura/*"]            = { "set syntax=zathurarc"  } ,
}
template_add_e(exts)
bufnr_add(globcomms)

-------------------------
-- VimLeave -------------
-------------------------
vauto({"VimLeave"}, {
  pattern = "*",
  callback = function()
    ClipBoardExit()
  end
})

-------------------------
-- TermOpen -------------
-------------------------
vauto({"TermOpen"}, {
  pattern = "*",
  callback = function()
    vc("setlocal statusline=%{b:term_title}")
  end
})

-------------------------
-- FileType Formatting --
-------------------------
vauto({"FileType"}, {
  pattern = "*",
  callback = function()
    vc("setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
  end
})

-------------------------
-- Help File ------------
-------------------------

local pattern_a = "'\\l{2,}'"
local pattern_b = "[|]\\zs\\S+\\ze[|]"
local combined  = pattern_a .. "|" .. pattern_b
local bindings_help_buffer={
    [ "CR"   ] = "<C-]>",
    [ "BS"   ] = "<C-T>",
    [ "o"    ] = "/\\v(" .. combined .. ")<CR>",
    [ "O"    ] = "?\\v(" .. combined .. ")<CR>",
    [ "<CR>" ] = "<C-]>",
    [ "<BS>" ] = "<C-T>",
}

vauto({"FileType"}, {
  pattern = "help",
  callback = function()
    for key,bind in pairs(bindings_help_buffer) do
      vim.keymap.set( "n", key, bind, { remap = false, buffer = true } )
    end
  end
})

-- autocmd FileType help nnoremap <buffer> <CR> <C-]>
-- autocmd FileType help nnoremap <buffer> <BS> <C-T>

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "/$HOME/.config/i3/*",
  callback = function()
    vim.cmd("setfiletype i3")
  end
})



