return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false,
  priority = 1000,
  config = function()
    require("github-theme").setup()
    vim.cmd("colorscheme github_dark_dimmed")
  end,
}
-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('tokyonight').setup({
--       transparent = true,
--     })
--     vim.cmd("colorscheme tokyonight-night")
--   end,
-- }
