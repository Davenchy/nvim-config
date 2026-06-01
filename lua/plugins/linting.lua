return {
  {
    "mfussenegger/nvim-lint",
    event = "BufReadPost",
    dependencies = { "mason-org/mason.nvim", "rshkarin/mason-nvim-lint" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        -- python = { "pyrefly" },
        -- typescript = { "biomejs" },
        -- javascript = { "biomejs" },
        -- json = { "jsonlint" },
        -- make = { "checkmake" },
        -- bash = { "shellcheck" },
        -- cpp = { "cpptools" },
      }

      require("mason-nvim-lint").setup({
        ignore_install = { "biomejs" },
      })

      local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
        group = lint_group,
        callback = function() lint.try_lint() end,
      })
    end,
  },
}
