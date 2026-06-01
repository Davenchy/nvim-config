return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  event = "VeryLazy",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    -- keymap = { preset = 'default' },
    keymap = { preset = 'enter' },

    signature = { enabled = true },
    cmdline = {
      enabled = true,
      keymap = { preset = "cmdline" },
      sources = { 'buffer', 'path', 'cmdline' },
      completion = {
        ghost_text = { enabled = true },
        menu = { auto_show = function(ctx, _) return ctx.mode == 'cmdwin' end },
        list = {
          selection = { preselect =  true, auto_insert = true },
        },
      },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      nerd_font_variant = 'normal'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = true } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        lua = { inherit_defaults = true, 'lazydev' },
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      }
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" }
}
