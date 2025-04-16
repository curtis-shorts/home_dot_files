-- Set the leader character that triggers using mapped commands
vim.g.mapleader = " "

-- Keymap takes the inputs of (<vim mode>,<alias>,<resolved command>)
-- Vim modes are n - normal, v/x - visual, i - insert, s - select, c - command line, t - terminal

-- Netrw navigation menu
vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- Bring up menu fullscreen
vim.keymap.set("n", "<leader>ev", vim.cmd.Vex) -- Bring up menu in a new left pane
vim.keymap.set("n", "<leader>eh", vim.cmd.Hex) -- Bring up menu in a new bottom pane

-- Navigate between split panes
vim.keymap.set("n", "<leader>h", "<C-w>h") -- Move down a pane
vim.keymap.set("n", "<leader>j", "<C-w>j") -- Move down a pane
vim.keymap.set("n", "<leader>k", "<C-w>k") -- Move up a pane
vim.keymap.set("n", "<leader>l", "<C-w>l") -- Move right a pane
vim.keymap.set("n", "<leader>q", "<C-w>q") -- Close the current pane

-- Copy/paste to/from the global keyboard
vim.keymap.set("n", "<leader>y", '"+y') -- "+y yanks to the external clipboard (y doesn't)
vim.keymap.set("v", "<leader>y", '"+y') -- Support in visual and normal modes
vim.keymap.set("n", "<leader>Y", '"+Y') -- Y is equivelent to yy
vim.keymap.set("n", "<leader>p", '"+p') -- "+p pastes from the external clipboard (p is vim local)
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.schedule(function()
--  vim.opt.clipboard = 'unnamedplus'
--end)

-- Visual block movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Moves the selected visual block down one line
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Moves the selected visual block up one line

-- Deletions
vim.keymap.set("n", "<leader>d", '"_d') -- _d redirects to void buffer (d normally copies to clipboard)
vim.keymap.set("v", "<leader>d", '"_d') -- Support in visual and normal modes
vim.keymap.set("v", "<leader>p", '"_dP') -- Deletes selected visual block and paste the clipboard

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
