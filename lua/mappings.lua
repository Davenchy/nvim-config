-- This file does not contain every key mappins.
-- Just some general once. if you are looking for specific plugin mappings,
-- try checking out the plugin's lua file or the **which-key.lua** plugin file.

-- create mapping helper function
local function map(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = desc })
end

-- Save files using Ctrl + s
map('<C-s>', ':w<CR>', 'Save File')

map('<Esc>', ':nohl<CR>', "Clear all search highlights")
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Diagnostic keymaps
map('[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map(']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')

-- Switch between windows using arrow keys
map('<C-right>', '<C-w><C-l>', 'Focus right window')
map('<C-left>', '<C-w><C-h>', 'Focus left window')
map('<C-up>', '<C-w><C-k>', 'Focus up window')
map('<C-down>', '<C-w><C-j>', 'Focus down window')

-- Resize windows using arrow keys
map('<C-S-right>', '<C-w>>', 'Focus right window')
map('<C-S-left>', '<C-w><', 'Focus left window')
map('<C-S-up>', '<C-w>+', 'Focus up window')
map('<C-S-down>', '<C-w>-', 'Focus down window')

-- Switch tabs using <C-tab>
map('<C-tab>', 'gt', 'Goto next tab')
map('<C-S-tab>', 'gT', 'Goto previous tab')
map('<C-t>', ':tabnew<CR>', 'Create a new tab')
map('<C-c>', ':tabclose<CR>', 'Close tab')

-- Toggle CSpell
map('<leader>tc', function()
  if vim.g.enable_cspell then
    vim.g.enable_cspell = false
    vim.notify('CSpell Disabled')
  else
    vim.g.enable_cspell = true
    require 'lint'.try_lint('cspell')
    vim.notify('CSpell Enabled')
  end
end, 'Toggle CSpell')
