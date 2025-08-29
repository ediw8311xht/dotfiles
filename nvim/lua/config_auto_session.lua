
require("auto-session").setup({
  auto_save = false,
  preserve_buffer_on_restore = true,
  purge_after_minutes = nil,
    -- -- Saving / restoring
    -- enabled = true, -- Enables/disables auto creating, saving and restoring
    -- auto_restore = true, -- Enables/disables auto restoring session on start
    -- auto_create = true, -- Enables/disables auto creating new session files. Can be a function that returns true if a new session file should be allowed
    -- auto_restore_last_session = false, -- On startup, loads the last saved session if session for cwd does not exist
    -- cwd_change_handling = false, -- Automatically save/restore sessions when changing directories
    -- single_session_mode = false, -- Enable single session mode to keep all work in one session regardless of cwd changes. When enabled, prevents creation of separate sessions for different directories and maintains one unified session. Does not work with cwd_change_handling
    --
    -- -- Filtering
    -- suppressed_dirs = nil, -- Suppress session restore/create in certain directories
    -- allowed_dirs = nil, -- Allow session restore/create in certain directories
    -- bypass_save_filetypes = nil, -- List of filetypes to bypass auto save when the only buffer open is one of the file types listed, useful to ignore dashboards
    -- close_filetypes_on_save = { "checkhealth" }, -- Buffers with matching filetypes will be closed before saving
    -- close_unsupported_windows = true, -- Close windows that aren't backed by normal file before autosaving a session
    --
    -- -- Git / Session naming
    -- git_use_branch_name = false, -- Include git branch name in session name
    -- git_auto_restore_on_branch_change = false, -- Should we auto-restore the session when the git branch changes. Requires git_use_branch_name
    -- custom_session_tag = nil, -- Function that can return a string to be used as part of the session name
    -- -- Deleting
    -- auto_delete_empty_sessions = true, -- Enables/disables deleting the session if there are only unnamed/empty buffers when auto-saving
    -- -- Saving extra data
    -- save_extra_data = nil, -- Function that returns extra data that should be saved with the session. Will be passed to restore_extra_data on restore
    -- restore_extra_data = nil, -- Function called when there's extra data saved for a session
    -- -- Argument handling
    -- args_allow_single_directory = true, -- Follow normal session save/load logic if launched with a single directory as the only argument
    -- args_allow_files_auto_save = false, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. Can be true or a function that returns true when saving is allowed. See documentation for more detail
    -- -- Misc
    -- log_level = "error", -- Sets the log level of the plugin (debug, info, warn, error).
    -- root_dir = vim.fn.stdpath("data") .. "/sessions/", -- Root dir where sessions will be stored
    -- show_auto_restore_notif = false, -- Whether to show a notification when auto-restoring
    -- restore_error_handler = nil, -- Function called when there's an error restoring. By default, it ignores fold errors otherwise it displays the error and returns false to disable auto_save
    -- continue_restore_on_error = true, -- Keep loading the session even if there's an error
    -- lsp_stop_on_restore = false, -- Should language servers be stopped when restoring a session. Can also be a function that will be called if set. Not called on autorestore from startup
    -- lazy_support = true, -- Automatically detect if Lazy.nvim is being used and wait until Lazy is done to make sure session is restored correctly. Does nothing if Lazy isn't being used
    -- legacy_cmds = true, -- Define legacy commands: Session*, Autosession (lowercase s), currently true. Set to false to prevent defining them
    -- ---@type SessionLens
    -- session_lens = {
    --   picker = nil, -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also set one manually. Falls back to vim.ui.select
    --   load_on_setup = true, -- Only used for telescope, registers the telescope extension at startup so you can use :Telescope session-lens
    --   picker_opts = nil, -- Table passed to Telescope / Snacks / Fzf-Lua to configure the picker. See below for more information
    --   ---@type SessionLensMappings
    --   mappings = {
    --     -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
    --     delete_session = { "i", "<C-d>" }, -- mode and key for deleting a session from the picker
    --     alternate_session = { "i", "<C-s>" }, -- mode and key for swapping to alternate session from the picker
    --     copy_session = { "i", "<C-y>" }, -- mode and key for copying a session from the picker
    --   },
    --   ---@type SessionControl
    --   session_control = {
    --     control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
    --     control_filename = "session_control.json", -- File name of the session control file
    --   },
    -- },
})
