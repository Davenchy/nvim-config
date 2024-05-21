return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "ray-x/cmp-treesitter",
    "https://codeberg.org/FelipeLema/cmp-async-path",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    luasnip.setup {}

    -- Setup friendly snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    local extends = {
      ["typescript"] = { "tsdoc" },
      ["javascript"] = { "jsdoc" },
      ["lua"] = { "luadoc" },
      ["python"] = { "pydoc" },
      ["rust"] = { "rustdoc" },
      ["cs"] = { "csharpdoc" },
      ["java"] = { "javadoc" },
      ["c"] = { "cdoc" },
      ["cpp"] = { "cppdoc" },
      ["php"] = { "phpdoc" },
      ["kotlin"] = { "kdoc" },
      ["ruby"] = { "rdoc" },
      ["sh"] = { "shelldoc" },
    };

    for k, v in ipairs(extends) do
      luasnip.filetype_extend(k, v)
    end

    -- Setup autocompletetion
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
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
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'calc' },
        { name = 'codeium' },
        { name = 'nvim_lsp' },
        { name = 'treesitter' },
        { name = 'luasnip' },
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

    -- load vscode snippets using luasnip
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
