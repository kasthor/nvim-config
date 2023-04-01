require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "lua", "rust", "vim", "javascript", "python" },
  sync_install = true,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true },
})
