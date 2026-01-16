return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        dartls = {
          cmd = { 'flutter', 'dart', 'language-server', '--protocol=lsp' },
          filetypes = { 'dart' },
          root_dir = function(fname)
            return require('lspconfig.util').root_pattern('pubspec.yaml', '.git')(fname)
          end,
          init_options = {
            closingLabels = true,
            flutterOutline = true,
            outline = true,
          },
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
            },
          },
        },
      },
    },
  },
}
