return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require "which-key"
    wk.setup {}

    wk.register({
      ['<leader>'] = {
        f = { name = "File" },
        c = {
          name = "Code",
          i = { vim.lsp.buf.implementation, "Implementation" },
          r = { vim.lsp.buf.refrences, "Refrences" },
          n = { vim.lsp.buf.rename, "Rename" },
          t = { vim.lsp.buf.type_definition, "Type Definition" },
          h = { vim.lsp.buf.signature_help, "Signature Help" },
          m = { vim.lsp.buf.hover, "Show Docs/Manual" },
          s = { vim.lsp.buf.document_symbol, "Symbols" },
          f = { vim.lsp.buf.format, "Format" },
          d = { vim.lsp.buf.definition, "Go To Definition" },
          c = { vim.lsp.buf.declaration, "Go To Declaration" },
          a = { vim.lsp.buf.code_action, "Code Actions" },
        },
        b = {
          name = "Buffer",
          s = { ':b#<CR>', "Switch" },
          n = { ':new<CR>', "New" },
          b = { ':Telescope buffers<CR>', "Buffers" },
          c = { ':bdelete<CR>', "Close" },
        },
        x = {
          name = "Diagnostics",
          x = { ':TroubleToggle<CR>', "Toggle Trouble" },
          w = { ':TroubleToggle workspace_diagnostics<CR>', "Workspace Diagnostics" },
          d = { ':TroubleToggle document_diagnostics<CR>', "Document Diagnostics" },
          q = { ':TroubleToggle quickfix<CR>', "Trouble QuickFix" },
          l = { ':TroubleToggle loclist<CR>', "Trouble LocList" },
          t = { ':TodoTrouble<CR>', "Trouble Todo Comments" },
        },
      },
    })
  end,
}
