-- Keymap takes the inputs of (<vim mode>,<alias>,<resolved command>)
-- Vim modes are n - normal, v/x - visual, i - insert, s - select, c - command line, t - terminal
vim.g.mapleader = " "

-- Navigation
vim.keymap.set("n", "<leader>e", vim.cmd.Ex,    {desc="MyMaps: Bring up netrw"})
-- Change pane
vim.keymap.set("n", "<leader>h", "<C-w>h",      {desc="MyMaps: Move left one pane"})
vim.keymap.set("n", "<leader>j", "<C-w>j",      {desc="MyMaps: Move down one pane"})
vim.keymap.set("n", "<leader>k", "<C-w>k",      {desc="MyMaps: Move up one pane"})
vim.keymap.set("n", "<leader>l", "<C-w>l",      {desc="MyMaps: Move right one pane"})
-- Move in wrapped lines
vim.keymap.set("n", "<down>", "gj",             {desc="MyMaps: Move down in a wrapped line"})
vim.keymap.set("n", "<up>", "gk",               {desc="MyMaps: Move up in a wrapped line"})
-- Move visual blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",    {desc="MyMaps: Move highlighted block down one line"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",    {desc="MyMaps: Move highlighted block up one line"})

-- Global clipboard access, see ':help clipboard'
vim.keymap.set({"n","v"}, "<leader>y", '"+y',   {desc="MyMaps: Yank to external clipboard"})
vim.keymap.set("n", "<leader>Y", '"+Y',         {desc="MyMaps: Yank the current row (same as yy)"})
vim.keymap.set("n", "<leader>p", '"+p',         {desc="MyMaps: Paste from external clipboard"})

-- Deletion clipboard manipulation
vim.keymap.set({"n","v"}, "<leader>d", '"_d',   {desc="MyMaps: Delete without copying to the clipboard"})
vim.keymap.set("v", "<leader>p", '"_dP',        {desc="MyMaps: Delete highlighted block and paste the clipboard"})

-- Other
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>",     {desc="MyMaps: Clear highlights on search when pressing <Esc> in normal mode"})
vim.keymap.set("n", "<leader>ast", ":InspectTree<CR>",  {desc="MyMaps: Abstract syntax tree (AST) inspection"})

