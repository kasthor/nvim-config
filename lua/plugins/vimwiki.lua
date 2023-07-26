return {
  'vimwiki/vimwiki',
  init = function()
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_folding = ''
    vim.g.vimwiki_key_mappings = {
      all_maps = 0,
      global = 0,
      headers = 0,
      text_objs = 0,
      table_format = 0,
      table_mappings = 0,
      lists = 0,
      links = 0,
      html = 0,
      mouse = 0,
    }
    vim.g.vimwiki_list = { {
      auto_export = 0,
      path = '~/.config/vimwiki/',
      syntax = 'markdown',
      ext = '.md',
    } }

    vim.cmd([[
      autocmd FileType vimwiki setlocal nobuflisted
      autocmd FileType vimwiki map <buffer> gn <Plug>VimwikiFollowLink
      autocmd FileType vimwiki map <buffer> gp <Plug>VimwikiGoBackLink
      autocmd FileType vimwiki map <buffer> <Space> <Plug>VimwikiToggleListItem
      noremap <Leader>ww :VimwikiIndex<CR>
    ]])

    vim.keymap.set('n', '<Leader>od', '<cmd>VimwikiDiaryIndex<CR>')
    vim.keymap.set('n', '<Leader>on', '<cmd>VimwikiMakeDiaryNote<CR>')
    vim.keymap.set('n', '<Leader>oy', '<cmd>VimwikiMakeYesterdayDiaryNote<CR>')
  end
}
