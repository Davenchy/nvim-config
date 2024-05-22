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
        s = { name = "[S]earch" },
        u = { name = "[U]I" },
        h = { name = '[H]unks' },
        c = {
          name = "[C]ode",
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
          name = "[B]uffer",
          b = { ':b#<CR>', "Buffer: Switch With Last previous" },
          n = { ':new<CR>', "Buffer: Create [N]ew" },
          v = { ':vsplit new<CR>', "Buffer: Create New [V]ertical" },
          h = { ':split new<CR>', "Buffer: Create New [H]orizontal" },
          c = { ':bdelete<CR>', "Buffer: [C]lose" },
        },
        d = {
          name = "[D]ocument",
          d = { ':TroubleToggle document_diagnostics<CR>', "Document Diagnostics" },
          q = { ':TroubleToggle quickfix<CR>', "Trouble QuickFix" },
          t = { ':TodoTrouble<CR>', "Trouble Todo Comments" },
        },
        t = {
          name = "[T]erminal",
          t = { ':FTermToggle<CR>', "Toggle floating terminal" },
          l = { function() require 'FTerm'.run{'lazygit'} end, "LazyGit" },
        }
      },
    })
  end,
}
