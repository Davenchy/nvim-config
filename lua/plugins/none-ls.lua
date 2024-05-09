-- replacment for null-ls
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,

        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.trivy,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.codespell,

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isortd,
        null_ls.builtins.formatting.blackd,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.codespell,

        null_ls.builtins.hover.printenv,
      },
    })

    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "LSP Code Format" })
  end,
}
