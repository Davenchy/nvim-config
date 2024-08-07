return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>h", group = "Git" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Terminal" },
      { "<leader>u", group = "UI" },
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps",
      },
      {
        "<leader>b",
        group = "Buffer",
        expand = function()
          return require("which-key.extras").expand.buf()
        end,
      },
      { "<leader>bb", ":b#<CR>", desc = "Buffer: Switch With Last previous" },
      { "<leader>bc", ":bdelete<CR>", desc = "Buffer: [C]lose" },
      {
        "<leader>bh",
        ":split new<CR>",
        desc = "Buffer: Create New [H]orizontal",
      },
      { "<leader>bn", ":new<CR>", desc = "Buffer: Create [N]ew" },
      {
        "<leader>bv",
        ":vsplit new<CR>",
        desc = "Buffer: Create New [V]ertical",
      },
      { "<leader>c", group = "Code" },
      { "<leader>ci", vim.lsp.buf.implementation, desc = "Implementation" },
      { "<leader>cr", vim.lsp.buf.refrences, desc = "Refrences" },
      { "<leader>cn", vim.lsp.buf.rename, desc = "Rename" },
      { "<leader>ct", vim.lsp.buf.type_definition, desc = "Type Definition" },
      { "<leader>ck", vim.lsp.buf.signature_help, desc = "Signature Help" },
      {
        "<leader>ch",
        vim.lsp.buf.hover,
        desc = "Show Docs/Manual for [h]overed",
      },
      { "<leader>cs", vim.lsp.buf.document_symbol, desc = "Symbols" },
      { "<leader>cf", vim.lsp.buf.format, desc = "Format" },
      { "<leader>cd", vim.lsp.buf.definition, desc = "Go To Definition" },
      { "<leader>cc", vim.lsp.buf.declaration, desc = "Go To Declaration" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Actions" },
      { "<leader>x", group = "Diagnostics" },
      {
        "<leader>xx",
        ":Trouble diagnostics toggle filter.buf=0<CR>",
        desc = "Document Diagnostics",
      },
      {
        "<leader>xq",
        ":Trouble quickfix toggle<CR>",
        desc = "Trouble QuickFix",
      },
      {
        "<leader>xt",
        ":TodoTrouble toggle<CR>",
        desc = "Trouble Todo Comments",
      },
      { "<leader>xs", ":Trouble symbols toggle<CR>", desc = "Symbols" },
      {
        "<leader>tl",
        function()
          require("FTerm").scratch({ cmd = { "lazygit" } })
        end,
        desc = "LazyGit",
      },
      { "<leader>tt", ":FTermToggle<CR>", desc = "Toggle floating terminal" },
    },
  },
}
