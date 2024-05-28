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
  { -- this codeium plugin, works well with nvim-cmp
    "Exafunction/codeium.nvim",
    event = 'BufEnter',
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { enable_chat = true },
  },
  -- { -- this codeium plugin, renders ghost/virtual text
  --   "Exafunction/codeium.vim",
  --   event = 'BufEnter',
  -- },
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
        options = {
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
  {
    "numToStr/FTerm.nvim",
    config = function()
      local ft = require 'FTerm'

      ft.setup {}
      local function def(name, command)
        vim.api.nvim_create_user_command(name, command, { bang = true })
      end

      def('FTermOpen', ft.open)
      def('FTermClose', ft.close)
      def('FTermToggle', ft.toggle)
      def('FTermExit', ft.exit)
    end
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    cmd = 'HopWordMW',
    keys = {
      { 'gw', ':HopWordMW<CR>', desc = "Hop [g]o to [w]ord" }
    },
    opts = {},
  },
}


-- write hello world function
