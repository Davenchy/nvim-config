return {
  { -- disabled until blink integration complete
    "Exafunction/codeium.nvim",
    event = "BufEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { enable_chat = true },
  },
}
