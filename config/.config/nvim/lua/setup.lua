-- Install plugins
require('plugins')

require('myline')
require 'bufferline'.setup { options = { separator_style = "slant", show_buffer_close_icons = false } }
require('nvim-autopairs').setup({ check_line_pair = false })
require 'nvim-tree'.setup {}

-- Last Place config
require 'nvim-lastplace'.setup {
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = { "gitcommit", "gitrebase" },
    lastplace_open_folds = true,
}

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

require('Comment').setup {
    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
}

require "fidget".setup {}

vim.notify = require("notify")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
