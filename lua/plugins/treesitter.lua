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
  config = function()
    require "nvim-treesitter.configs".setup {
      ensure_installed = ts_modules,
      auto_install = true,
    }
  end,
}
