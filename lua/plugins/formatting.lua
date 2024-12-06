return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "deno_fmt" },
        javascriptreact = { "deno_fmt" },
        typescript = { "deno_fmt" },
        typescriptreact = { "deno_fmt" },
        css = { "deno_fmt" },
        html = { "deno_fmt" },
        json = { "deno_fmt" },
        yaml = { "deno_fmt" },
        markdown = { "deno_fmt" },
        lua = { "stylua" },
        sql = { "sql_formatter" }
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
