return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
    {
      "s1n7ax/nvim-window-picker",
      config = true,
    },
  },
  opts = {
    source_selector = {
      winbar = true,
    },
  },
  keys = {
    { "<C-b>", ":Neotree filesystem toggle reveal left<CR>", desc = "NeoTree" }
  },
}
