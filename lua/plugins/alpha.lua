return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local theta = require("alpha.themes.theta")
    local button = require("alpha.themes.dashboard").button
    local buttons = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Quick links",
          opts = { hl = "SpecialComment", position = "center" },
        },
        { type = "padding", val = 1 },
        button("e", "  New file", "<cmd>ene<CR>"),
        button("e", "  Browse Files", "<cmd>Oil<CR>"),
        button("SPC s f", "󰈞  Find file"),
        button("SPC s g", "󰊄  Live grep"),
        button("c", "  Configuration", "<cmd>cd ~/.config/nvim/ <CR>"),
        button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
        button("q", "󰅚  Quit", "<cmd>qa<CR>"),
      },
      position = "center",
    }
    local mru = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Recent files",
          opts = {
            hl = "SpecialComment",
            shrink_margin = false,
            position = "center",
          },
        },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { theta.mru(0, vim.fn.getcwd()) }
          end,
          opts = { shrink_margin = false },
        },
      },
    }

    require("alpha").setup({
      layout = {
        { type = "padding", val = 2 },
        theta.config.header,
        { type = "padding", val = 2 },
        mru,
        { type = "padding", val = 2 },
        buttons,
      },
      opts = theta.config.opts,
    })
  end,
}
