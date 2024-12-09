-- This file does not contain every key mappins.
-- Just some general once. if you are looking for specific plugin mappings,
-- try checking out the plugin's lua file or the **which-key.lua** plugin file.

-- create mapping helper functions
local function map(keys, func, desc)
  vim.keymap.set("n", keys, func, { desc = desc })
end
local function mmap(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Save files using Ctrl + s, in normal/insert modes
mmap({ "n", "i" }, "<C-s>", "<Esc>:w<CR>", "Save File")

-- Source file using Ctrl + S
map("<C-S-s>", ":so %<CR>", "Source File")

-- Close buffer using Ctrl + c
map("<C-x>", ":bdelete<CR>", "Close Buffer")

-- Quit Neovim
map("<C-q>", ":qa<CR>", "Quit Neovim")

map("<Esc>", ":nohl<CR>", "Clear all search highlights")
mmap("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Diagnostic keymaps
map("[d", vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message")
map("]d", vim.diagnostic.goto_next, "Go to next [D]iagnostic message")

-- Switch between windows using arrow keys
map("<C-right>", "<C-w><C-l>", "Focus right window")
map("<C-left>", "<C-w><C-h>", "Focus left window")
map("<C-up>", "<C-w><C-k>", "Focus up window")
map("<C-down>", "<C-w><C-j>", "Focus down window")

-- Resize windows using arrow keys
map("<C-S-right>", "<C-w>>", "Focus right window")
map("<C-S-left>", "<C-w><", "Focus left window")
map("<C-S-up>", "<C-w>+", "Focus up window")
map("<C-S-down>", "<C-w>-", "Focus down window")

-- Switch tabs using <C-tab>
map("<C-tab>", "gt", "Goto next tab")
map("<C-S-tab>", "gT", "Goto previous tab")
map("<C-n>", ":tabnew<CR>", "Create a new tab")
map("<C-c>", ":tabclose<CR>", "Close tab")

-- Toggle ZenMode
map("<leader>z", ":ZenMode<CR>", "Toggle ZenMode")
