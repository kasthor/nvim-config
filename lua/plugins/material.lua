return {
  'marko-cerovac/material.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.material_style = 'palenight'

    local colors = require "material.colors"

    local m = colors.main
    local e = colors.editor


    require('material').setup({
      borders = true, -- Enable borders between verticaly split windows
      -- for available colors:
      -- https://github.com/marko-cerovac/material.nvim/blob/main/lua/material/colors/init.lua
      --
      custom_colors = function(colors)
        colors.editor.line_numbers = colors.main.darkpurple
      end,
      custom_highlights = {
        NeoTreeTabInactive = { fg = e.disabled, bg = e.bg },
        NeoTreeTabActive = { fg = m.yellow, bg = e.active },
        NeoTreeTabSeparatorInactive = { fg = e.disabled, bg = e.bg },
        NeoTreeTabSeparatorActive = { fg = e.border, bg = e.active },
        Green = { fg = m.green }
      }
    })

    vim.cmd [[colorscheme material]]
  end
}
