local on_attach = function(bufnr)
  local gs = package.loaded.gitsigns

  local function prev_hunk()
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end
  local function next_hunk()
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end

  -- Navigation
  --
  vim.keymap.set('n', '[c', prev_hunk, { buffer = bufnr })
  vim.keymap.set('n', ']c', next_hunk, { buffer = bufnr })
  vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr })
  vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { buffer = bufnr })
  vim.keymap.set('n', '<leader>gd', gs.diffthis, { buffer = bufnr })
  vim.keymap.set('n', '<leader>gg', '<cmd>Git<CR>', { buffer = bufnr })
end

require('gitsigns').setup({
  on_attach = on_attach,
  current_line_blame = true
})
