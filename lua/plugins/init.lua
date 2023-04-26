local ensure_packer = require('utils.ensure_packer')

local packer = require('packer')

ensure_packer()

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- [[ theming ]] --
  use 'marko-cerovac/material.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  -- [[ file manager ]] --
  use 'kyazdani42/nvim-tree.lua'

  -- [[ surround ]] --
  use 'tpope/vim-surround'

  -- [[ lsp ]] --
  use 'nvim-treesitter/nvim-treesitter'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- [[ comments ]] --
  use 'numToStr/Comment.nvim'

  -- [[ auto completion ]] --

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- [[ tools ]] --
  use 'itchyny/calendar.vim'
  use 'vimwiki/vimwiki'
  use 'akinsho/toggleterm.nvim'
  use { 'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- [[ git ]] =-
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

  -- if packer_bootstrap then
  packer.install()
  packer.compile()
  -- end
end)

require('plugins.config')
