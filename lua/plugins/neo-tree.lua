return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker"
  },
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    require('neo-tree').setup({
      close_if_last_window = true,
      source_selector = {
        winbar = true
      },
      filesystem = {
        follow_current_file = true,
      },
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["?"] = "fuzzy_finder",
          ["<tab>"] = "next_source",
          ["<s-tab>"] = "prev_source"
        }
      }
    })

    vim.keymap.set('n', '<Leader>e', [[<cmd>Neotree toggle<CR>]])
  end
}
