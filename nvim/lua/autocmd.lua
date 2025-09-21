
local home  = vim.env.HOME
local va    = vim.api
local vfn   = vim.fn
local vauto = vim.api.nvim_create_autocmd
local vc    = vim.cmd

ConfigDir = home .. "/.config/nvim"
LanguageSpecificDir = ConfigDir .. "/language_specific"
TemplateDir = home .. "/.config/nvim/language_specific/templates"
MaxLinesCMP = 5000

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
-- Vars -----------------
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

function MapCommandsToReg(event)
  if event['regname'] ~= "" then
    return
  end
  local reg = vim.g.reg_filter_map['normal'][event['operator']]
  -- if event['visual'] and 
  -- else
  -- end
  -- if Contains(vim.g.reg_filter_map, event["operator"]) then
  --   print(vim.inspect(event))
  -- end
end
vauto({ "TextYankPost" }, {
  pattern = "*",
  callback = function()
    vim.hl.on_yank( { higroup="Visual", timeout=300 } )
    -- MapCommandsToReg(vim.v.event)
  end
})


-- if vfn.exists("##TextYankPost") then
--   vauto({ 
-- end
--   function! SmallDeleteRing(event) abort
--     if a:event['operator'] == 'y'
--       " Don't care about actual yanks
--       return
--     endif
--     if a:event['regtype'] ==# 'V'
--       " Vim already handles linewise deletions
--       return
--     endif
--
--     let regcontents = a:event['regcontents']
--     if len(regcontents) > 1
--       " Vim already handles deletions spanning multiple lines
--       return
--     endif
--
--     let deleted = regcontents[0]
--
--     if len(deleted) == 1
--       " Don't want to catch single-character deletions (in particular, x)
--       return
--     endif
--
--     " Grab registers 1-8
--     let one_through_eight = mapnew(range(1, 8), {k, v -> getreg(v)})
--
--     " Set register "1
--     call setreg(1, deleted)
--
--     " Set registers 2-9
--     for i in range(1, 8)
--       call setreg(i + 1, one_through_eight[i - 1])
--     endfor
--   endfunction
--
--   augroup small_delete_ring
--     autocmd!
--     autocmd TextYankPost * call SmallDeleteRing(v:event)
--   augroup END
-- endif
