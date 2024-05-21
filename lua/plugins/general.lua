return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.theta'.config)
    end
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      enable_chat = true,
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = "tokyonight",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = 'VimEnter',
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "danymat/neogen",
    keys = {
      { '<leader>cg', ':Neogen<CR>', desc = "[G]enerate Docs" },
    },
    opts = {
      snippet_engine = "luasnip",
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options  = {
          ruler = true,
          showcmd = true,
        },
      },
    },
  },
  {
    "folke/twilight.nvim",
    opts = {
      alpha = 0.50,
    },
  },
}
