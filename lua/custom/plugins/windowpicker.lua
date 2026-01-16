return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    version = '2.*',
    config = function()
      require('window-picker').setup {
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = {
              'dap-repl',
              'dapui_scopes',
              'dapui_breakpoints',
              'dapui_stacks',
              'dapui_watches',
              'terminal',
            },
          },
        },
      }
    end,
  },
}
