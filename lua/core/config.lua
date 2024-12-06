vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.mouse = ''
vim.opt.colorcolumn = '120'
vim.opt.signcolumn = 'yes'
vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.api.nvim_set_hl(0, 'TabRed', { bg = 'red' })
vim.fn.matchadd('TabRed', '\\t')
