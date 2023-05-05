return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = {
        ensure_installed = { "lua_ls", 'clangd', 'cssls', 'dockerls', 'html',
          'graphql', 'jsonls', 'tsserver', 'marksman', 'pylsp',
          'rust_analyzer', 'yamlls'
        }
      }
    },
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        local mason_lspconfig = require('mason-lspconfig')
        local lspconfig = require("lspconfig")

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
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

          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

          vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {})
          vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})

          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
          vim.keymap.set('n', 'gr', telescope.lsp_references, {})
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

          autofmt()
        end
        local servers_config = {
          lua_ls = {
            Lua = { diagnostics = { globals = { 'vim' } } }
          }
        }
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

    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', config = true }
  },
  config = function()
    vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, {})
  end
}
