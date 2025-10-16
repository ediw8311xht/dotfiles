
local home  = vim.env.HOME
local va    = vim.api
local vfn   = vim.fn
local vauto = vim.api.nvim_create_autocmd
local vc    = vim.cmd

ConfigDir = home .. "/.config/nvim"
LanguageSpecificDir = ConfigDir .. "/language_specific"
TemplateDir = home .. "/.config/nvim/language_specific/templates"
MaxLinesCMP = 2000

---------------------------------
-- Disable CMP For Large Files --
---------------------------------
vauto({ "BufEnter", "BufWinEnter" }, { pattern = { "*" },
  callback = function(args)
    if va.nvim_buf_line_count(args.buf) > MaxLinesCMP then
      require('cmp').setup.buffer( { enabled = false } )
    end
  end
})

vauto({ "FocusGained", "CursorHold", "CursorHoldI" }, { pattern = { "*" },
  callback = function()
    vc("silent! checktime")
  end
})

-------------------------
-- BufNewFile, BufRead --
-------------------------
local function bufnew_bufread(glob, comms)
  vauto({ "BufNewFile", "BufRead" }, { pattern = glob,
    callback = function() for _,com in ipairs(comms) do vc(com) end end
  })
end

local function bufnr_add(globcomms)
  for glob,comms in pairs(globcomms) do
    bufnew_bufread(glob, comms)
  end
end

-------------------------
-- Templates ------------
-------------------------
local function template_add(glob, template_file)
  vauto({ "BufNewFile" }, { pattern = glob,
    callback = function()
      local full_path = TemplateDir .. template_file
      vc("keepalt 0read " .. full_path)
      vc("silent w")
      vc("silent !chmod 700 %")
    end})
end

local function template_add_e(exts)
  for _,ext in ipairs(exts) do
    template_add("*." .. ext, "/template." .. ext)
  end
end

-------------------------
-- VimLeave -------------
-------------------------
vauto({ "VimLeave" }, { pattern = "*",
  callback = function() ClipBoardExit() end
})

-------------------------
-- TermOpen -------------
-------------------------
vauto({ "TermOpen" }, { pattern = "*",
  callback = function() vc("setlocal statusline=%{b:term_title}") end
})

------------------------
-- FileType Formatting --
-------------------------
vauto({ "FileType" }, { pattern = "*",
  callback = function() vc("setlocal formatoptions-=c formatoptions-=r formatoptions-=o") end
})


-------------------------
-- YankedText -----------
-------------------------
--
-- -- For use with MapCommandsToReg
-- vim.g.reg_filter_map = {
--   [ 'normal' ] = { 'd', 'c', 'D', 'C' },
--   [ 'visual' ] = { 'd', 'c', 'D', 'C', 'p', 'P' },
-- }
-- function MapCommandsToReg(event)
--   if event['regname'] ~= "" then
--     return
--   end
--   local reg = vim.g.reg_filter_map['normal'][event['operator']]
--   -- if event['visual'] and 
--   -- else
--   -- end
--   -- if Contains(vim.g.reg_filter_map, event["operator"]) then
--   --   print(vim.inspect(event))
--   -- end
-- end

vauto({ "TextYankPost" }, {
  pattern = "*",
  callback = function()
    vim.hl.on_yank( { higroup="Visual", timeout=300 } )
    -- MapCommandsToReg(vim.v.event)
  end
})

-------------------------
-- EXTENSION SPECIFIC ---
-------------------------
local exts = { "sh", "py", "kalker", "exs", "tex", "ex", "html", "cpp", "md", "lisp", "hs" }

local globcomms = {
  ---- Syntax ----
  [ home .. "/bashrc_files/*" ]              = { "setfiletype bash"      } ,
  [ "*.sh" ]                                 = { "setfiletype bash"      } ,
  [ home .. "/.config/polybar/*.ini" ]       = { "setfiletype dosini"    } ,
  [ home .. "/.config/polybar/*/*.ini" ]     = { "setfiletype dosini"    } ,
  [ "*.kalker" ]                             = { "setfiletype kalker"    } ,
  [ home .. "/.config/i3/*" ]                = { "setfiletype i3"        } ,
  [ "*.ex,*.exs" ]                           = { "setfiletype elixir"    } ,
  [ "*.schema" ]                             = { "setfiletype sql"       } ,
  [ "*.md" ]                                 = { "setfiletype markdown"  } ,
  [ home .. "/.config/zathura/*" ]           = { "set syntax=zathurarc"  } ,
  ---- Special ----
  [ home .. "/.bashrc"] = {
      "setfiletype bash",
      "source ${HOME}/.config/nvim/language_specific/bashrc.vim"
  },
  [ home .. "/.config/joplin-desktop/userstyle.css"] = {
      "source ${HOME}/.config/nvim/language_specific/joplin_userstyle.vim"
  },
  [ home .. "/TEST/QUICK/*.cpp" ] = {
      "source" .. LanguageSpecificDir .. "/quick_cpp.vim"
  },
}

template_add_e(exts)
bufnr_add(globcomms)

