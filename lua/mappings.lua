-- This file does not contain every key mappins.
-- Just some general once. if you are looking for specific plugin mappings,
-- try checking out the plugin's lua file or the **which-key.lua** plugin file.
-- This file depends on which-key. So, make sure it loaded after which-key
-- initialization.

require("which-key").add({
  -- Save files using Ctrl + s, in normal/insert modes
  { mode = { "n", "i" }, "<C-s>", "<Esc>:w<CR>", desc = "Save File" },
  -- Source file using Ctrl + S
  { "<C-S-s>", ":so %<CR>", desc = "Source Current File" },

  -- Editor
  { "<C-x>", ":bdelete<CR>", desc = "Close Buffer" },
  { "<C-q>", ":qa<CR>", desc = "Quit Neovim" },
  { "<Esc>", ":nohl<CR>", desc = "Clear all search highlights" },

  -- Terminal
  { mode = "t", "<Esc><Esc>", "<C-\\><C-n>", desc = "Exit terminal mode" },

  -- Diagnostic keymaps
  {
    "[d",
    vim.diagnostic.goto_prev,
    desc = "Go to previous [D]iagnostic message",
  },
  { "]d", vim.diagnostic.goto_next, desc = "Go to next [D]iagnostic message" },

  -- Switch between windows using arrow keys
  { "<C-right>", "<C-w><C-l>", desc = "Focus right window" },
  { "<C-left>", "<C-w><C-h>", desc = "Focus left window" },
  { "<C-up>", "<C-w><C-k>", desc = "Focus top window" },
  { "<C-down>", "<C-w><C-j>", desc = "Focus bottom window" },

  -- Resize windows using arrow keys
  { "<C-+>", ":vertical resize +5<CR>", desc = "Scale right window" },
  { "<C-->", ":vertical resize -5<CR>", desc = "Scale left window" },
  { "<C-S-up>", ":horizontal resize +5<CR>", desc = "Scale top window" },
  { "<C-S-down>", ":horizontal resize -5<CR>", desc = "Scale bottom window" },

  -- Switch tabs using <C-tab>
  { "<C-n>", ":tabnew<CR>", desc = "Create a new tab" },
  { "<C-c>", ":tabclose<CR>", desc = "Close tab" },

  -- Toggle ZenMode
  { "<leader>z", ":ZenMode<CR>", desc = "Toggle ZenMode" },
})
