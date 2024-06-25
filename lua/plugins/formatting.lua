return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
      }
    })
    function format()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
      })
    end

    vim.keymap.set({ 'n', 'v' }, '<Leader>f', format, {})
  end
}
