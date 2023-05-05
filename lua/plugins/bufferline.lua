return {
  'akinsho/bufferline.nvim',
  config = function()
    local bufferline = require('bufferline')
    local ui = require('bufferline.ui')
    local state = require("bufferline.state")
    local commands = require("bufferline.commands")

    local function sort_by_modified(buffer_a, buffer_b)
      return (buffer_a.modified and 1 or 0) < (buffer_b.modified and 1 or 0)
    end

    local function sort_by_name(buffer_a, buffer_b)
      return buffer_a.name < buffer_b.name
    end

    local function buffers_sort_by_name()
      bufferline.sort_buffers_by(sort_by_name)
    end

    local function buffers_sort_by_modified()
      bufferline.sort_buffers_by(sort_by_modified)
    end

    local function close_buffer(buf)
      vim.schedule(function()
        vim.cmd('bdelete' .. buf.id)
      end)
    end

    local function buffers_close_by(func)
      for _, item in ipairs(state.components) do
        if func(item) then
          commands.unpin_and_close(item.id)
        end
      end
    end

    local function not_modified_pinned_or_current(buf)
      local current_buf = vim.api.nvim_get_current_buf()

      return not (buf.modified or (buf.group) == ("pinned") or buf.id == current_buf)
    end

    bufferline.setup({
      options = {
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 22,
        max_prefix_length = 15, -- prefix used when a buffer is deduplicated
        tab_size = 25,
        diagnostics = "nvim_lsp",
        offsets = {
          { text = "Files",    filetype = 'NvimTree',   text_align = 'left' },
          { text = "Terminal", filetype = 'toggleterm', text_align = 'left' } },
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = 'thick',
        -- enforce_regular_tabs = false | true,
        always_show_bufferline = true,
        -- sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
        sort_by = sort_by_name
      },
    })



    vim.keymap.set('n', '<Leader>bsn', buffers_sort_by_name)
    vim.keymap.set('n', '<Leader>bsm', buffers_sort_by_modified)

    vim.keymap.set('n', '<Leader>bp', '<cmd>BufferLineTogglePin<CR>')
    vim.keymap.set('n', '<Leader>bdl', '<cmd>BufferLineCloseRight<CR>')
    vim.keymap.set('n', '<Leader>bdh', '<cmd>BufferLineCloseLeft<CR>')
    vim.keymap.set('n', '<Leader>bdo', function() buffers_close_by(not_modified_pinned_or_current) end)
    vim.keymap.set('n', 'gB', '<cmd>BufferLinePick<CR>')
    vim.keymap.set('n', 'gD', '<cmd>BufferLinePickClose<CR>')
    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>')
  end
}
