-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- add into the table returned by custom/plugins/init.lua
  {
    'akinsho/flutter-tools.nvim',
    lazy = false, -- make sure it installs and loads immediately
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'dart-lang/dart-vim-plugin',
  },
  {
    'Neevash/awesome-flutter-snippets',
    event = 'InsertEnter',
  },
  {

    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip', -- you already have this, but harmless to list
      'rafamadriz/friendly-snippets', -- optional snippet collection
    },
  },
}
