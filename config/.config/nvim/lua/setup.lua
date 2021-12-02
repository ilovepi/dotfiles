
local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
--vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]] -- Auto compile when there are changes in plugins.lua

-- Install plugins
require('plugins')

--require('statusline')
require('myline')
--require'bufferline'.setup{options = { separator_style = "thin"}}
require'bufferline'.setup{options = { separator_style = "slant", show_buffer_close_icons = false}}
--require'bufferline'.setup{options = { separator_style = "thick"}}
require('nvim-autopairs').setup({ check_line_pair = false })

