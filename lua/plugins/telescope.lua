return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')

    local config_files = function()
      return builtin.find_files({ cwd = "~/.config/nvim/" })
    end

    vim.keymap.set('n', '<Leader>o', builtin.find_files, {})
    vim.keymap.set('n', '<Leader>oc', config_files, {})
    vim.keymap.set('n', '<Leader>og', builtin.live_grep, {})
    vim.keymap.set('n', '<Leader>ob', builtin.buffers, {})
  end
}
