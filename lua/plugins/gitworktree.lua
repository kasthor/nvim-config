return {
  'ThePrimeagen/git-worktree.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  lazy = true,
  init = function()
    local telescope = require("telescope")
    telescope.load_extension("git_worktree")
    vim.keymap.set('n', '<leader>ot', telescope.extensions.git_worktree.git_worktrees, {})
  end
}
