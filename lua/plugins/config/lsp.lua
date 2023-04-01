require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls", 'clangd', 'cssls', 'dockerls', 'html',
    'graphql', 'jsonls', 'tsserver', 'marksman', 'pylsp',
    'rust_analyzer', 'yamlls'
  }
})

local get_servers = require('mason-lspconfig').get_installed_servers
local lspconfig = require('lspconfig')

local servers_config = {
  lua_ls = {
    settings = {
      Lua = { diagnostics = { globals = { 'vim' } } }
    }
  }
}


local autofmt = function()
  local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
  local event = "BufWritePre" -- or "BufWritePost"
  local async = event == "BufWritePost"
  local bufnr = vim.api.nvim_get_current_buf()

  vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
  vim.api.nvim_create_autocmd(event, {
    buffer = bufnr,
    group = group,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr, async = async })
    end,
    desc = "[lsp] format on save",
  })
end

local on_attach = function(_, _)
  local telescope = require('telescope.builtin')

  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<Leader>co', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', telescope.lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

  autofmt()
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server_name in ipairs(get_servers()) do
  local config = servers_config[server_name] or {}

  config.on_attach = on_attach
  config.capabilities = capabilities

  lspconfig[server_name].setup(config)
end

vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, {})
