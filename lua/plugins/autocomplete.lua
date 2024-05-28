return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    "ray-x/cmp-treesitter",
    "saadparwaiz1/cmp_luasnip",
    "https://codeberg.org/FelipeLema/cmp-async-path",
  },
  config = function()
    local cmp = require "cmp"

    cmp.setup {
      snippet = {
        expand = function(args)
          require 'luasnip'.lsp_expand(args.body)
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
        ['<C-l>'] = cmp.mapping(function()
          local ls = require 'luasnip'
          if ls.expand_or_locally_jumpable() then
            ls.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          local ls = require 'luasnip'
          if ls.locally_jumpable(-1) then
            ls.jump(-1)
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'calc' },
        { name = 'codeium' },
        { name = 'nvim_lsp' },
        { name = 'treesitter' },
        {
          name = 'luasnip',
          option = {
            show_autosnippets = true,
            use_show_condition = false,
          },
        },
        { name = 'emoji' },
      }, {
        { name = 'async_path' },
        { name = 'buffer' },
      }),
      formatting = {
        format = require 'lspkind'.cmp_format {
          mode = 'symbol_text',
          symbol_map = {
            Codeium = "",
          },
        },
      },
      experimental = { ghost_text = true },
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
