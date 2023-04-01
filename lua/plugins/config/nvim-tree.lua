local tree_cb = require('nvim-tree.config').nvim_tree_callback

require('nvim-tree').setup({
  auto_close = true,
  disable_netrw = true,
  -- hijack netrw window on startup
  hijack_netrw = true,
  -- open the tree when running this setup function
  open_on_setup = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = {},
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab = false,
  -- hijacks new directory buffers when they are opened.
  hijack_directories = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = true,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = false,
  -- updates the root directory of the tree on `DirChanged` (when you run `:cd` usually)
  update_cwd = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = false,
    icons = {
      hint = '?',
      info = '?',
      warning = '?',
      error = '?',
    },
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {},
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = { '.git', 'node_modules', '.cache', '.next', '*.out' }
  },
  git = {
    enable = true,
    ignore = true,
  },
  actions = { open_file = { resize_window = true } },
  view = {
    float = {
      open_win_config = {
        -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
        height = 30,
        -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
        width = 30,
      }
    },
    -- Hide the root path of the current folder on top of the tree
    hide_root_folder = false,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    -- if true the tree will resize itself after opening a file
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {
        {
          key = { '<CR>', 'o', '<2-LeftMouse>', 'l' },
          cb = tree_cb('edit'),
        },
        {
          key = { 'a', '%' },
          cb = tree_cb('create'),
        },
        {
          key = 'h',
          cb = tree_cb('close_node'),
        },
      },
    },
  },
})

vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>')
