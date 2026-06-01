vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  callback = function ()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, { desc = "format buffer" })
vim.api.nvim_create_user_command("LspInfo", function()
    vim.cmd("checkhealth vim.lsp")
end, { desc = "show LSP info" })

vim.api.nvim_create_user_command("Home", function()
  Snacks.dashboard()
end, { desc = "Open homescreen" })
