local ensure_package_manager = require('utils.ensure_package_manager')

ensure_package_manager()

local plugins = {
  -- [[ theming ]] --
  'marko-cerovac/material.nvim',
  'kyazdani42/nvim-web-devicons',

  'nvim-lualine/lualine.nvim',
  'akinsho/bufferline.nvim',

  -- [[ file manager ]] --
  'kyazdani42/nvim-tree.lua',

  -- [[ surround ]] --
  'tpope/vim-surround',

  -- [[ lsp ]] --
  'nvim-treesitter/nvim-treesitter',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',

  -- [[ comments ]] --
  'numToStr/Comment.nvim',

  -- [[ auto completion ]] --

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',

  -- [[ tools ]] --
  'itchyny/calendar.vim',
  'vimwiki/vimwiki',
  'akinsho/toggleterm.nvim',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- [ git ] =-
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive'

}
require('lazy').setup(plugins, {})

require('plugins.config')
