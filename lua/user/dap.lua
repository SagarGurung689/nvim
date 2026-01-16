-- ~/.config/nvim/lua/user/dap.lua

-- 1. Setup the DAP UI (layouts, windows, etc.)
require('dapui').setup {
  -- Customizations for the look and feel of your debugging panels
  icons = { expanded = '▾', collapsed = '▸', current_frame = '➤' },
  layouts = {
    {
      elements = {
        -- You can reorder these elements
        { id = 'scopes', size = 0.25 },
        { id = 'watches', size = 0.25 },
        { id = 'stacks', size = 0.25 },
        { id = 'breakpoints', size = 0.25 },
      },
      size = 40, -- size of the DAP UI sidebar
      position = 'left',
    },
  },
  -- other settings...
}

-- 2. Automatically open/close DAP UI when debugging starts/stops
local dap = require 'dap'
dap.listeners.after.event_initialized['dapui_config'] = function()
  require('dapui').open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  require('dapui').close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  require('dapui').close()
end

-- 3. Configure mason-nvim-dap to automatically install the Dart debug adapter
require('mason-nvim-dap').setup {
  -- Ensure the dart debug adapter is installed automatically
  ensure_installed = { 'dart' },
  -- your mappings for mason-nvim-dap here if you have any
}

-- 4. Keybindings for Debugging (Optional, but highly recommended)
-- Add common DAP keymaps to your global keymaps section, for example in init.lua
-- Or you can add them here:

-- local function map(mode, lhs, rhs, opts) ... end (use the same map function as above)

-- map('n', '<leader>b', ':DapToggleBreakpoint<CR>', { desc = 'Toggle Breakpoint' })
-- map('n', '<leader>dr', ':DapContinue<CR>', { desc = 'DAP Run/Continue' })
-- map('n', '<leader>di', ':DapStepInto<CR>', { desc = 'Step Into' })
-- map('n', '<leader>do', ':DapStepOver<CR>', { desc = 'Step Over' })
-- map('n', '<leader>du', ':DapStepOut<CR>', { desc = 'Step Out' })
