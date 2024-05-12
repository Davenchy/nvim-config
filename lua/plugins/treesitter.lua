local ts_modules = {
  "c",
  "cpp",
  "cmake",
  "make",
  "css",
  "csv",
  "dart",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "typescript",
  "javascript",
  "json",
  "jsdoc",
  "python",
  "rust",
  "sql",
  "yaml",
  "toml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = ts_modules,
    auto_install = true,
  },
  config = function(_, opts)
    require "nvim-treesitter.configs".setup(opts)
    require "nvim-treesitter.install".prefer_git = true
  end,
}
