return {
  { -- disabled until blink integration complete
    "Exafunction/codeium.nvim",
    event = "BufEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { enable_chat = true },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      behavior = {
        auto_suggestions = true,
      },
      windows = {
        sidebar_header = {
          enabled = false,
        },
        ask = {
          floating = true,
        },
      },
    },
  },
}
