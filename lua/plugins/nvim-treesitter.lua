return
{
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build        = ":TSUpdate",
  config       = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "c", "lua", "rust", "vim", "javascript", "python", "typescript", "tsx", "dockerfile", "php" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-Space>',
          node_incremental = '<C-Space>',
          scope_incremental = '<C-Space>',
          node_decremental = 'grm'
        }
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['a='] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ['i='] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },

            ['aa'] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
            ['ia'] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },

            ['ai'] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
            ['ii'] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

            ['af'] = { query = "@function.outer", desc = "Select outer part of a function" },
            ['if'] = { query = "@function.inner", desc = "Select inner part of a function" },

            ['ac'] = { query = "@class.outer", desc = "Select outer part of a function" },
            ['ic'] = { query = "@class.inner", desc = "Select inner part of a function" },

            ['as'] = { query = '@scope', query_group = "locals", desc = "Language Scope" },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
      rainbow = { enable = true },
      autotag = { enable = true },
      context_commentstring = { enable = true },
    })
  end
}
