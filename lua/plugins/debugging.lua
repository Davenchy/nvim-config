return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local mdap = require("mason-nvim-dap")

    dapui.setup {}

    require("nvim-dap-virtual-text").setup {}
    mdap.setup({
      automatic_installation = true,
      handlers = {
        function(config)
          mdap.default_setup(config)
        end,
      },
    })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "Continue" })
    vim.keymap.set('n', '<leader>do', dap.step_over, { desc = "Step Over" })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = "Step Into" })
    vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = "Step Out" })
    vim.keymap.set('n', '<leader>dB', dap.step_back, { desc = "Step Back" })
    vim.keymap.set('n', '<leader>dr', dap.reverse_continue, { desc = "Reverse Continue" })
    vim.keymap.set('n', '<leader>dd', dap.close, { desc = "Close Session" })
  end
}
