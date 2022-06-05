local fn = vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- Install plugins
require('plugins')

--require('statusline')
require('myline')
--require'bufferline'.setup{options = { separator_style = "thin"}}
require 'bufferline'.setup { options = { separator_style = "slant", show_buffer_close_icons = false } }
--require'bufferline'.setup{options = { separator_style = "thick"}}
require('nvim-autopairs').setup({ check_line_pair = false })
require 'nvim-tree'.setup {}
require 'nvim-lastplace'.setup {}

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

vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle', { noremap = true })

vim.notify = require("notify")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


