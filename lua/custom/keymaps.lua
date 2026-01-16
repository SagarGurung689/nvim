vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dart',
  callback = function()
    local map = vim.keymap.set
    local opts = { buffer = true }

    -- ===============================
    -- LSP (Flutter / Dart)
    -- ===============================

    -- Code actions (light-bulb replacement)
    map('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code Action (Flutter quick fix)' }))
    -- git hub settings

    -- ===============================
    -- Git (Telescope)
    -- ===============================
    map('n', '<leader>gs', function()
      require('telescope.builtin').git_status()
    end, { desc = 'Git Status' })

    map('n', '<leader>gc', function()
      require('telescope.builtin').git_commits()
    end, { desc = 'Git Commits' })

    map('n', '<leader>gb', function()
      require('telescope.builtin').git_branches()
    end, { desc = 'Git Branches' })

    map('n', '<leader>gf', function()
      require('telescope.builtin').git_files()
    end, { desc = 'Git Files' })

    -- exit to current file directory
    vim.keymap.set('n', '<leader>ex', function()
      vim.cmd('Ex ' .. vim.fn.expand '%:p:h')
    end, { desc = 'Explorer at current file' })

    -- Go to / navigation
    map('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))

    map('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))

    map('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Find references' }))

    map('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))

    map('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))

    map('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))

    -- ===============================
    -- Flutter commands
    -- ===============================

    -- Run / Control
    map('n', '<leader>Fr', '<cmd>FlutterRun<CR>', vim.tbl_extend('force', opts, { desc = 'Flutter Run' }))

    map('n', '<leader>FR', '<cmd>FlutterRestart<CR>', vim.tbl_extend('force', opts, { desc = 'Flutter Restart' }))

    map('n', '<leader>Fl', '<cmd>FlutterReload<CR>', vim.tbl_extend('force', opts, { desc = 'Flutter Reload' }))

    map('n', '<leader>Fq', '<cmd>FlutterQuit<CR>', vim.tbl_extend('force', opts, { desc = 'Flutter Quit' }))

    -- Devices / Emulators
    map('n', '<leader>Fd', '<cmd>FlutterDevices<CR>', vim.tbl_extend('force', opts, { desc = 'Flutter Devices' }))

    map('n', '<leader>Fe', '<cmd>FlutterEmulators<CR>', vim.tbl_extend('force', opts, { desc = 'Flutter Emulators' }))

    -- Logs
    map('n', '<leader>FL', '<cmd>FlutterLogToggle<CR>', vim.tbl_extend('force', opts, { desc = 'Flutter Dev Logs' }))

    map('n', '<leader>Fc', '<cmd>FlutterLogClear<CR>', vim.tbl_extend('force', opts, { desc = 'Clear Flutter Logs' }))

    -- Widget Outline
    map('n', '<leader>Fo', '<cmd>FlutterOutlineToggle<CR>', vim.tbl_extend('force', opts, { desc = 'Flutter Outline' }))

    -- ===============================
    -- Flutter Debugging (DAP)
    -- ===============================
    local dap = require 'dap'
    local dapui = require 'dapui'
    map('n', '<leader>du', function()
      dapui.toggle()
    end, { desc = 'DAP UI: Toogle' })

    -- Start / Continue debugging
    map('n', '<F5>', dap.continue, vim.tbl_extend('force', opts, { desc = 'Flutter Debug: Start / Continue' }))

    -- Step controls
    map('n', '<F10>', dap.step_over, vim.tbl_extend('force', opts, { desc = 'Flutter Debug: Step Over' }))
    map('n', '<F11>', dap.step_into, vim.tbl_extend('force', opts, { desc = 'Flutter Debug: Step Into' }))
    map('n', '<F12>', dap.step_out, vim.tbl_extend('force', opts, { desc = 'Flutter Debug: Step Out' }))

    -- Breakpoints
    map('n', '<leader>Fb', dap.toggle_breakpoint, vim.tbl_extend('force', opts, { desc = 'Flutter Debug: Toggle Breakpoint' }))

    map('n', '<leader>FB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, vim.tbl_extend('force', opts, { desc = 'Flutter Debug: Conditional Breakpoint' }))

    -- Debug REPL
    -- map('n', '<leader>Frp', function()
    --   dap.repl.toggle()
    -- end, vim.tbl_extend('force', opts, { desc = 'Flutter Debug: Toggle Debug REPL' }))
    -- Rerun last debug session
    map('n', '<leader>Fdl', dap.run_last, vim.tbl_extend('force', opts, { desc = 'Flutter Debug: Run Last' }))
  end,
})

-- ===============================
-- Python run mapping
-- ===============================
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', '<leader>r', ':!python3 %<CR>', { buffer = true, desc = 'Run Python file' })

    vim.keymap.set('n', '<leader>ex', function()
      vim.cmd('Ex ' .. vim.fn.expand '%:p:h')
    end, { desc = 'Explorer at current file' })
  end,
})

vim.keymap.set('n', '<leader>w', function()
  local pick = require('window-picker').pick_window()
  if pick then
    vim.api.nvim_set_current_win(pick)
  end
end, { desc = 'Pick window (works with floating & DAP)' })
