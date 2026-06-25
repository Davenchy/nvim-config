local keymap = vim.keymap.set
keymap("n", "<ESC>", ":nohl<CR>", { desc = "Save the current file" })
keymap({"n", "i"}, "<C-s>", "<ESC>:w<CR>", { desc = "Save the current file" })
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
    keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    keymap("n", "<leader>cf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
  end
})

-- Navigate windows from terminal mode
vim.keymap.set('n', '<leader>t', ':vertical terminal<CR>', { desc = 'Open vertical terminal' })
vim.keymap.set('n', '<leader>T', ':horizontal terminal<CR>', { desc = 'Open horizontal terminal' })
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { desc = 'Terminal window commands' })
vim.keymap.set('t', '<C-w>.', '<C-w>', { desc = 'Send <C-w> to terminal' })
-- vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = 'Move to left window' })
-- vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = 'Move to bottom window' })
-- vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = 'Move to top window' })
-- vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = 'Move to right window' })
-- vim.keymap.set('t', '<C-Left>', [[<C-\><C-n><C-w>h]], { desc = 'Move to left window' })
-- vim.keymap.set('t', '<C-Down>', [[<C-\><C-n><C-w>j]], { desc = 'Move to bottom window' })
-- vim.keymap.set('t', '<C-Up>', [[<C-\><C-n><C-w>k]], { desc = 'Move to top window' })
-- vim.keymap.set('t', '<C-Right>', [[<C-\><C-n><C-w>l]], { desc = 'Move to right window' })

-- WhichKey Groups --
local wk = require("which-key")
wk.add({
  { "<leader>f", group = "files" },
  { "<leader>c", group = "code tools" },
  { "<leader>x", group = "code analysis" },
  { "<leader>g", group = "Git/Github Tools" },
  { "gr", group = "LSP tools" },
  { "grs", ":Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
  { "grS", ":Telescope lsp_workspace_symbols<CR>", desc = "Workspace Symbols" },
  {
    "<leader>b", group = "Buffers",
    expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  { "<leader>bb", ":b#<CR>", desc = "Switch to alternate buffer" },
  { "<leader>bc", ":bdelete<CR>", desc = "Close current buffer" },
})
