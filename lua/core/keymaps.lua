vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>')

local function resize_window(dir)
  return function() return "<cmd>" .. vim.v.count .. "wincmd " .. dir .. "<cr>" end
end
vim.keymap.set('n', '<Up>', resize_window('-'), { expr = 1 })
vim.keymap.set('n', '<Down>', resize_window('+'), { expr = 1 })
vim.keymap.set('n', '<Left>', resize_window('<'), { expr = 1 })
vim.keymap.set('n', '<Right>', resize_window('>'), { expr = 1 })

vim.keymap.set('n', '<Leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<Leader>l', ':invrelativenumber<CR>')
-- vim.keymap.set('n', '<S-j>', '<cmd>m +1<CR>')
-- vim.keymap.set('n', '<S-k>', '<cmd>m -2<CR>')
--
