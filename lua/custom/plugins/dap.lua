return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup {
        layouts = {
          {
            elements = {
              { id = 'scopes', size = 1.0 },
            },
            size = 40,
            position = 'left',
          },
        },
      }

      dap.listeners.after.event_initialized['dapui'] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated['dapui'] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited['dapui'] = function()
        dapui.close()
      end
    end,
  },
}
