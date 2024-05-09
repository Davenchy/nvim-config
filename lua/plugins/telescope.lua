return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "Telescope",
  config = true,
  keys = {
    { "<C-p>", ":Telescope<CR>", desc = "Telescope" },
  },
}
