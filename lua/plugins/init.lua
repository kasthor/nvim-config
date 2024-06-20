return {
  -- [[ theming ]] --
  'nvim-tree/nvim-web-devicons',

  -- [[ surround ]] --
  'tpope/vim-surround',

  -- [[ comments ]] --
  { 'numToStr/Comment.nvim',    config = true },

  -- [ git ] =-
  'tpope/vim-fugitive',

  -- [[ test runner ]] --
  { 'kasthor/nvim-test-runner', config = true },

  -- [[ markdown notes ]] --
  { 'kasthor/nvim-mdif',        config = true, dir = '~/Sources/nvim/nvim-mdif' },

  -- Shows errors on the top of the window
  {
    'dgagn/diagflow.nvim',
    -- event = 'LspAttach', This is what I use personnally and it works great
    opts = {
      show_borders = true
    }
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.theta'.config)
    end
  },
  -- {
  --   "nvim-neotest/neotest",
  --   keys = {
  --     { '<Leader>tr', [[<cmd>lua require('neotest').run.run()<cr>]],                   desc = "Run tests" },
  --     { '<Leader>tR', [[<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>]], desc = "Run tests for full file" },
  --     { '<Leader>tw', [[<cmd>lua require('neotest').watch.toggle()<cr>]],              desc = "Watch tests" },
  --     { '<Leader>ts', [[<cmd>lua require('neotest').summary.toggle()<cr>]],            desc = "Watch tests" }
  --   },
  --   config = function()
  --     require('neotest').setup({
  --       adapters = {
  --         require('neotest-jest')({
  --           jestCommand = "npm test --",
  --           env = { CI = true },
  --           cwd = function(path)
  --             print('cwd')
  --             return vim.fn.getcwd()
  --           end
  --         })
  --       }
  --
  --     })
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim",
  --     'haydenmeade/neotest-jest',
  --   }
  -- }
}
