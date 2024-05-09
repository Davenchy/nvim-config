return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "https://codeberg.org/FelipeLema/cmp-async-path",
    "hrsh7th/cmp-emoji",
    "ray-x/cmp-treesitter",
    "hrsh7th/cmp-nvim-lsp-signature-help",

    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require "cmp"

    cmp.setup {
      snippet = {
        expand = function(args)
          require "luasnip".lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp_signature_help' },
        { name = 'codeium' },
        { name = 'nvim_lsp' },
        { name = 'treesitter' },
        { name = 'luasnip' },
        { name = 'calc' },
        { name = 'async_path' },
        { name = 'buffer' },
        { name = 'emoji' },
      }),
      formatting = {
        format = require 'lspkind'.cmp_format {
          mode = 'symbol_text',
          symbol_map = {
            Codeium = "",
          },
        },
      },
    }

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'cmdline' },
        { name = 'async_path' },
        { name = 'buffer' },
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })
  end,
}