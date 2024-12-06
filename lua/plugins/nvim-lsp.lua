local function setup_auto_format()
  local group = vim.api.nvim_create_augroup("lsp_format_on_save", {})
  local event = "BufWritePre" -- or "BufWritePost"
  local async = event == "BufWritePost"
  local bufnr = vim.api.nvim_get_current_buf()
  local format = function()
    vim.lsp.buf.format({ async = async })
  end

  -- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
  --
  -- Auto Format
  -- vim.api.nvim_create_autocmd(event, {
  --   buffer = bufnr,
  --   group = group,
  --   callback = format,
  --   desc = "[lsp] format on save",
  -- })

  -- vim.keymap.set('n', '<Leader>f', format, {})
end

local function setup_color_column()
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  local prettierrc_path = vim.fn.findfile('.prettierrc', ';')
  local print_width = 120

  if prettierrc_path ~= '' then
    local prettierrc_contents = vim.fn.readfile(prettierrc_path)

    for _, line in ipairs(prettierrc_contents) do
      local match = line:match('[\'"]?printWidth[\'"]%s*[=:]%s*(%d+)')
      if match then
        print_width = tonumber(match) or print_width
      end
    end

  end
  vim.api.nvim_win_set_option(0, 'colorcolumn', tostring(print_width))
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = {}
    },
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        local mason_lspconfig = require('mason-lspconfig')
        local lspconfig = require("lspconfig")

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local on_attach = function(client, _)
          local telescope = require('telescope.builtin')

          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

          vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {})
          vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
          vim.keymap.set('n', 'gr', telescope.lsp_references, {})
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

          setup_auto_format()
          setup_color_column()
        end
        local servers_config = {
          lua_ls = {
            Lua = { diagnostics = { globals = { 'vim' } } }
          }
        }

        -- ensure_installed = { "lua_ls", 'clangd', 'cssls', 'dockerls', 'html', 'graphql', 'tsserver', 'marksman', 'pylsp', 'rust_analyzer', 'yamlls' }
        mason_lspconfig.setup({
          ensure_installed = { 'lua_ls', 'cssls', 'html', 'graphql', 'tsserver', 'marksman', 'pylsp',
            'rust_analyzer', 'clangd' }
        })
        mason_lspconfig.setup_handlers({
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = servers_config[server_name]
            })
          end
        })
      end
    },

    { 'j-hui/fidget.nvim', tag = "v1.4.5", opts = { notification = { window = { align = "top", relative = "editor", winblend = 0 } } } },
    { 'folke/neodev.nvim', config = true },
  },
  config = function()
  end
}
