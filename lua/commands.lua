-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable numbers in terminal mode
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Disable numbers in terminal mode',
  group = vim.api.nvim_create_augroup('kickstart-terminal', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
