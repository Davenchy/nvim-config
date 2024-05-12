return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- add debugging UI
    "rcarriga/nvim-dap-ui",
    -- required for nvim-dap-ui
    "nvim-neotest/nvim-nio",

    -- add virtual variables value text
    "theHamsta/nvim-dap-virtual-text",

    -- debug adapters installer
    'williamboman/mason.nvim',
    "jay-babu/mason-nvim-dap.nvim",

    -- my own debuggers
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local mdap = require("mason-nvim-dap")
    mdap.setup({
      automatic_installation = true,
      handlers = {
        function(config)
          mdap.default_setup(config)
        end,
      },
      -- my mason adapters
      ensure_installed = {},
    })

    local dapui = require("dapui")
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    local dap = require("dap")
    dap.listeners.after.event_initialized.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.close()
    dap.listeners.before.event_exited.dapui_config = dapui.close()

    vim.keymap.set('n', '<F5>', dap.continue, { desc = "Debug: Continue" })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set('n', '<leader><F1>', dap.step_back, { desc = "Debug: Step Back" })
    vim.keymap.set('n', '<leader><F5>', dap.close, { desc = "Debug: Close Session" })
    vim.keymap.set('n', '<leader>*', dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    vim.keymap.set('n', '<leader>-', dap.reverse_continue, { desc = "Debug: Reverse Continue" })
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    require 'nvim-dap-virtual-text'.setup {}
  end
}
