return {
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },
  { -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- See `:help ibl`
    main = "ibl",
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup({ scope = { highlight = highlight } })

      hooks.register(
        hooks.type.SCOPE_HIGHLIGHT,
        hooks.builtin.scope_highlight_from_extmark
      )
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      map_cr = true,
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "onedark",
      },
    },
  },
  { -- add todo/fix/info/warn flags to comments with highlights
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  -- trace coding activity and time spent
  { "wakatime/vim-wakatime", lazy = false },
  { -- generate code annotations and doc comments
    "danymat/neogen",
    keys = {
      { "<leader>cg", ":Neogen<CR>", desc = "[G]enerate Docs" },
    },
    opts = {
      snippet_engine = "luasnip",
    },
  },
  { -- to focus on a piece of code, if many windows are open
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options = {
          ruler = true,
          showcmd = true,
        },
      },
    },
  },
  { -- to focus on a piece of code while zen mode activated
    "folke/twilight.nvim",
    opts = {
      alpha = 0.50,
    },
  },
  { -- for quick movement between words
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    cmd = "HopWord",
    keys = {
      { "gw", ":HopWord<CR>", desc = "Hop [g]o to [w]ord" },
    },
    opts = {},
  },
  { -- file management
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
    config = true,
  },
  { -- better ui
    "stevearc/dressing.nvim",
    config = true,
  },
  { -- git functionality
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },
  { -- for better ui
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = { enabled = false },
        notify = { enabled = false },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  { -- for better and smart folds
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = true,
  },
  { -- to snap code into images
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      mac_window_bar = false,
      has_breadcrumbs = true,
      has_line_number = true,
      show_workspace = true,
      watermark = "Coded By Davenchy",
      bg_theme = "grape",
    },
  },
  { -- support for neovim config editing
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    -- !INFO: config blink or cmp to use lazydev
    config = true,
    -- opts = {
    --   library = {
    --     -- See the configuration section for more details
    --     -- Load luvit types when the `vim.uv` word is found
    --     { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    --   },
    -- },
  },
}
