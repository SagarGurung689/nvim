-- ~/.config/nvim/lua/user/flutter.lua

-- Import keymaps function from the kickstart base configuration if you have one
-- If you are using standard kickstart, this function usually lives in the core setup
-- For this example, we'll define a simple map function here.
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('flutter-tools').setup {
  -- General flutter-tools options
  -- These will be used for all projects
  -- See the github page for more options
  -- github.com

  -- LSP (Language Server Protocol) Configuration
  lsp = {
    -- Set to true to format your code automatically when you save the file
    format_on_save = {
      enabled = true,
      async = true,
      timeout = 1000,
    },
    -- Use the default kickstart on_attach function for standard LSP keybindings
    -- This line assumes you are using the standard kickstart structure for handlers
    on_attach = require('kickstart.plugins.lsp.handlers').on_attach,
    -- Add any extra capabilities or custom config here if needed
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
  },

  -- Visual options
  widget_guides = {
    enabled = true,
  },

  -- Status Line integration
  statusline = {
    enabled = true,
    -- current_device = 'Used device: ' -- customize the label
  },

  -- Keybindings
  -- It's often easier to define these globally in init.lua,
  -- but you can define them here within the flutter-tools plugin config scope too
  keymaps = {
    -- The following commands must be used in a buffer where flutter-tools is attached
    -- (i.e. a .dart file in a flutter project)
    toggle_sim = '<leader>fe',
    toggle_device = '<leader>fd',
    run_app = '<leader>fr',
    stop_app = '<leader>fs',
    hot_reload = '<leader>fh',
    hot_restart = '<leader>fR',
    -- debug options can be configured here too
  },
}

-- You can also define global keymaps outside the setup block for consistency
-- map('n', '<leader>fh', ':FlutterHotReload<CR>', { desc = 'Flutter Hot Reload Global' })
