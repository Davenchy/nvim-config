return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "autoflake", "docformatter", "isort" },
      javascript = { "biome" },
      typescript = { "biome" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 5000,
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
      })
    end, { desc = "Code Format" })
  end,
}
