return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-ui-select.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<C-p>", ":Telescope<CR>", desc = "Telescope" },
  },
  init = function ()
    local telescope = require "telescope"
    telescope.setup {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      },
    }

    telescope.load_extension("ui-select")
  end,
  config = function()
    local builtin = require "telescope.builtin"
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep Files" })
  end,
}

