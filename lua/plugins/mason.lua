return {
  { "mason-org/mason.nvim", config = true },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- language servers
        "lua_ls",
        "ts_ls",
        "bashls",
        "clangd",
        "pyright",
        "pylsp",
        "marksman",
        "eslint",
        "ltex-ls",
        -- linters
        "typos",
        "markdownlint",
        "jsonlint",
        "hadolint", -- for Dockerfiles
        "trivy", -- For vulnerabilities, misconfigurations and secrets checking
        "checkmake", -- a checker for makefiles
        "shellcheck",
        -- formatters
        "stylua", -- lua code formatter
        "biome",
        "prettierd",
        "mdformat",
        "autoflake",
        "docformatter",
        "isort",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = { automatic_enable = true },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}
