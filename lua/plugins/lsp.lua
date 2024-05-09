return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local config = require 'mason-lspconfig'
      config.setup {
        -- for server names, check :h lspconfig-all
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "bashls",
        },
      }

      -- use cmp_nvim_lsp capabilities for lsp autocompletion
      local capabilities = require "cmp_nvim_lsp".default_capabilities()

      -- for more information, check
      -- :h mason-lspconfig-automatic-server-setup
      config.setup_handlers {
        function(server)
          require "lspconfig"[server].setup {
            capabilities = capabilities,
          }
        end,
      }

      -- add some keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Go To Definition" })
    end,
  },
  "neovim/nvim-lspconfig",
}
