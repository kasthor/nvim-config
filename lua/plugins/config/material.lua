require('material').setup({
  borders = true, -- Enable borders between verticaly split windows
  -- for available colors:
  -- https://github.com/marko-cerovac/material.nvim/blob/main/lua/material/colors/init.lua
  --
  custom_colors = function(colors)
    colors.editor.line_numbers = colors.main.darkpurple
  end
})

vim.g.material_style = 'palenight'
vim.cmd [[colorscheme material]]
