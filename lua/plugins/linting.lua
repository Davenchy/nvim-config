return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile", "BufWritePost" },
  dependencies = { "rshkarin/mason-nvim-lint", "davidmh/cspell.nvim" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      markdown = { "vale", "markdownlint" },
      python = { "pylint", "trivy" },
      typescript = { "biomejs", "trivy" },
      javascript = { "biomejs", "trivy" },
    }

    require("mason-nvim-lint").setup({
      ensure_installed = {
        "tflint",
        "vale",
        "markdownlint",
        "jsonlint",
        "hadolint",
        "selene",
        "trivy",
        "biome",
      },
    })

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "InsertLeave",
    }, {
      group = lint_augroup,
      callback = function()
        require("lint").try_lint()
        -- uses a lot of processor power
        -- require("lint").try_lint("cspell")
      end,
    })
  end,
}
