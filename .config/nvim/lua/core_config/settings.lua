-- File to set vim-style options
-- Tab spacing
vim.opt.tabstop = 4                 -- The number of spaces a tab counts for
vim.opt.softtabstop = 4             -- The number of spaces a tab counts for with editing operations
vim.opt.shiftwidth = 4              -- The number of spaces used for auto-indent (>> <<)
vim.opt.expandtab = true            -- The number of spaces used for inserting tabs
vim.opt.smartindent = true          -- Automatically indent on a newline

-- GUI navigation and line layout
vim.opt.nu = true                   -- Print the line number in the left margin
vim.opt.relativenumber = true       -- Show the line number relative to the line with the cursor 
vim.opt.colorcolumn:append("80")    -- Set a column number to be colored (inidcates code refactoring required)
vim.opt.wrap = false                -- Sets if the line wraps around when it hits the right margin
vim.opt.whichwrap:append("<,>")     -- When you pass EoL it takes you to the start of the next line (arrow keys only)
--moved to mappings.lua: vim.opt.scrolloff = 5  -- The minimum number of lines to keep above and bellow the cursor when scrolling

-- GUI presentation
--vim.opt.signcolumn = "yes"          -- The column where signs are displayed (used by debuggers, for denoting build errors etc.)
vim.diagnostic.config({
  virtual_text = true,  -- enable inline messages
  signs = true,         -- enable signs in the gutter
  underline = true,     -- underline the problematic code
  update_in_insert = false,
  severity_sort = true,
})
vim.opt.isfname:append("@-@")       -- Fixes issues with the displaying of file names (???)

-- Data recovery
vim.opt.swapfile = false            -- Use a swap file to buffer modified files (.swp)
vim.opt.backup = false              -- Use a backup file to keep the most recent version of a file (.bak)
vim.opt.undofile = true             -- Use a seperate file to track the undo history (.un)
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir_nvim"  -- The directory to put undo files in
vim.opt.updatetime = 50             -- If no activity occurs for this many ms then the swap file is written to disk 

-- Searching
vim.opt.hlsearch = true             -- Highlight searchs, toggle on/off with hls/nohl 
vim.opt.incsearch = true            -- Dynamically show what matches the search as you type it 

vim.opt.showtabline = 2 -- Always show the tabline (2 = always)

