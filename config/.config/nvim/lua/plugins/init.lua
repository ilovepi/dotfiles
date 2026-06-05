-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Configure Lazy.nvim
require("lazy").setup({
    --- Search & Navigation
    'brooth/far.vim',
    {
        "ibhagwan/fzf-lua",
        config = function ()
            require('fzf-lua').setup({{'fzf-native','telescope'}})
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup()
        end,
    },
    'wincent/loupe',

    --- Appearance
    'powerline/fonts',
    'sainnhe/gruvbox-material',
    'nvim-tree/nvim-web-devicons',

    --- Writing
    'junegunn/goyo.vim',
    'lervag/vimtex',
    'reedes/vim-pencil',
    'reedes/vim-wordy',

    ---  Git
    'jreybert/vimagit',
    'rhysd/committia.vim',
    'tpope/vim-fugitive',
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk)
                    map('n', '<leader>hr', gitsigns.reset_hunk)
                    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    map('n', '<leader>hS', gitsigns.stage_buffer)
                    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                    map('n', '<leader>hR', gitsigns.reset_buffer)
                    map('n', '<leader>hp', gitsigns.preview_hunk)
                    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                    map('n', '<leader>hd', gitsigns.diffthis)
                    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                    map('n', '<leader>td', gitsigns.toggle_deleted)

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            })
        end,
    },
    {
        'akinsho/git-conflict.nvim',
        config = function()
            require('git-conflict').setup()
        end,
    },

    --- Viewing
    --'greyblake/vim-preview'

    --- Vim navigation & editing essentials
    'chrisbra/NrrwRgn',
    'christoomey/vim-tmux-navigator',
    'godlygeek/tabular',
    {
        'ethanholz/nvim-lastplace',
        config = function()
            require 'nvim-lastplace'.setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = { "gitcommit", "gitrebase" },
                lastplace_open_folds = true,
            })
        end,

    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({ check_line_pair = false })
        end,
    },
    {
        "jiaoshijie/undotree",
        config = function()
            require("undotree").setup({})
        end,
        dependencies = "nvim-lua/plenary.nvim"
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup()
        end,
    },
    'osyo-manga/vim-over',
    'tpope/vim-repeat',
    'tpope/vim-sleuth',
    'tpope/vim-surround',
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                ---LHS of toggle mappings in NORMAL + VISUAL mode
                ---@type table
                toggler = {
                    ---Line-comment toggle keymap
                    line = 'gcc',
                    ---Block-comment toggle keymap
                    block = 'gbc',
                },
            })
        end,
    },
    -- 'folke/trouble.nvim',
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to the default settings
                -- refer to the configuration section below
            }
        end
    },

    --- FileType Support
    'andreshazard/vim-logreview',
    'ekalinin/Dockerfile.vim',
    'rust-lang/rust.vim',
    "kalcutter/vim-gn",

    --- Lsp Config
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        'nvimdev/lspsaga.nvim',
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = "main",
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install({
                "asm", "bash", "c", "cmake", "comment", "cpp", "css",
                "dockerfile", "dot", "gn", "go", "html", "javascript", "json",
                "llvm", "lua", "make", "markdown", "markdown_inline", "ninja",
                "nu", "python", "rst", "rust", "starlark", "toml", "vim", "yaml",
            })
            -- main branch has no highlight module; enable it per-buffer.
            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },

    --- UI
    "rcarriga/nvim-notify",
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'gruvbox-material',
                    section_separators = { left = '', right = '' },
                    component_separators = { left = ' ', right = ' ' },
                    disabled_filetypes = { 'packer', 'NvimTree' },
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch' },
                    lualine_c = {
                        {
                            'filename',
                            file_status = true,
                            path = 1,
                        },
                    },
                    lualine_x = {
                        'diff',
                        {
                            'diagnostics',
                            symbols = { error = ' ', warn = ' ', info = ' ' },
                        },
                    },
                    lualine_y = { 'filetype' },
                    lualine_z = { 'progress', 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = { 'nvim-tree' },
            })
        end,
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup({
                options = {
                    separator_style = "slant",
                    show_buffer_close_icons = false
                },
            })
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        config = function() require("render-markdown").setup() end,
    },
    {
        "j-hui/fidget.nvim",
        tag = 'legacy',
        config = function()
            require("fidget").setup({})
        end,
    },

    --- Completions
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    'hrsh7th/cmp-omni',
    "saadparwaiz1/cmp_luasnip",
    "tamago324/cmp-zsh",

    --- Snippets
    'honza/vim-snippets',
    -- 'norcalli/snippets.nvim',
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp"
    },

    --- Debug Adapter Protocol
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
    },

    --- Claude
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        keys = {
            { "<leader>a",  nil,                              desc = "AI/Claude Code" },
            { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
            { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
            { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
            { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
            { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
            { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
            { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
            {
                "<leader>as",
                "<cmd>ClaudeCodeTreeAdd<cr>",
                desc = "Add file",
                ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
            },
            -- Diff management
            { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
            { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
        },
    },

    --- BigFile
    {
        "LunarVim/bigfile.nvim",
        config = function()
            require("bigfile").setup({
                -- default config
                filesize = 8,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
                pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
                features = {       -- features to disable
                    "indent_blankline",
                    "lsp",
                    "treesitter",
                    "syntax",
                    "matchparen",
                    "vimopts",
                    "filetype",
                },
            })
        end,
    },
})
