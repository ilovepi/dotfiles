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

require("ibl").setup()
-- require("indent_blankline").setup {
--     -- for example, context is off by default, use this to turn it on
--     show_current_context = true,
--     show_current_context_start = true,
-- }

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

require("bigfile").setup {
  -- default config
  filesize = 8, -- size of the file in MiB, the plugin round file sizes to the closest MiB
  pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  features = { -- features to disable
    "indent_blankline",
    "lsp",
    "treesitter",
    "syntax",
    "matchparen",
    "vimopts",
    "filetype",
  },
}

vim.notify = require("notify")
