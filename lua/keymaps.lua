local keymap = vim.keymap.set
keymap("n", "<ESC>", ":nohl<CR>", { desc = "Save the current file" })
keymap("n", "<C-s>", ":w<CR>", { desc = "Save the current file" })
keymap("n", "<C-q>", ":qa<CR>", { desc = "Save the current file" })

keymap("v", "<C-Up>", ":m '<-2<CR>gv", { desc="Move selections up", silent=true })
keymap("v", "<C-Down>", ":m '>+1<CR>gv", { desc="Move selections down", silent=true })

keymap("n", "<leader>u", ":Undotree<CR>", { desc = "Open undo tree" })

keymap("n", "<leader>n", function()
  Snacks.notifier.show_history()
end, { desc = "Show notifications" })

local ts = require('telescope.builtin')
keymap('n', '<leader>ff', ts.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', ts.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>f/', ts.current_buffer_fuzzy_find, { desc = 'Telescope fuzzy find current buffer' })
keymap('n', '<leader>fb', ts.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', ts.help_tags, { desc = 'Telescope help tags' })
keymap({ 'n', 'i', 'v', 'x' }, '<C-p>', '<CMD>Telescope<CR>', { desc = "Open Telescope" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    keymap("n", "gd", vim.lsp.buf.definition, opts, { desc = "Go to definition" })
    keymap("n", "<leader>cf", vim.lsp.buf.format, opts, { desc = "Format buffer" })
  end
})

-- WhichKey Groups --
local wk = require("which-key")
wk.add({
  { "<leader>f", group = "files" },
  { "<leader>c", group = "code tools" },
  { "<leader>x", group = "code analysis" },
  { "<leader>g", group = "Git/Github Tools" },
  { "gr", group = "LSP tools" },
})
