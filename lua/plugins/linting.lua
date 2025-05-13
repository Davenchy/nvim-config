return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile", "BufWritePost" },
  dependencies = {
    {
      "rshkarin/mason-nvim-lint",
      opts = {
        automatic_installation = true,
        ignore_install = { "typos", "biomejs" },
      },
    },
  },
  config = function()
    -- get linter names from the repo readme
    require("lint").linters_by_ft = {
      dockerfile = { "hadolint" },
      markdown = { "markdownlint" },
      typescript = { "biomejs" },
      javascript = { "biomejs" },
      python = { "flake8", "pylint" },
      make = { "checkmake" },
      sh = { "shellcheck" },
      json = { "jsonlint" },
      bash = { "shellcheck" },
    }

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
        require("lint").try_lint("typos")
        require("lint").try_lint("trivy")
      end,
    })
  end,
}
