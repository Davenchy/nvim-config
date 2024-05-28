-- replacment for null-ls
return {
  "nvimtools/none-ls.nvim",
  disabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "davidmh/cspell.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local cspell = require("cspell")

    null_ls.setup({
      sources = {
        null_ls.builtins.completion.spell,
        -- deleted to fix luasnip and nvim-cmp duplications and errors
        -- null_ls.builtins.completion.luasnip,

        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.commitlint,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.trivy,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.markdownlint,
        cspell.diagnostics,

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isortd,
        null_ls.builtins.formatting.blackd,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.prettierd,

        null_ls.builtins.hover.printenv,

        cspell.code_actions,
      },
    })

    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "LSP Code Format" })
  end,
}
