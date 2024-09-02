local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add({
    --- Search & Navigation
    'brooth/far.vim',
    {
        "arsham/listish.nvim",
        requires = {
            "arsham/arshlib.nvim",
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        config = function() require("listish").config({}) end,
    },
    {
        "arsham/fzfmania.nvim",
        requires = {
            "arsham/arshlib.nvim",
            "junegunn/fzf.vim",
            "nvim-lua/plenary.nvim",
            "arsham/listish.nvim",
            {
                "ibhagwan/fzf-lua",
                requires = { "kyazdani42/nvim-web-devicons" },
            },
        },
        after = { "arsham/listish.nvim", "ibhagwan/fzf-lua" },
        config = function()
            require("fzfmania").config({
                frontend = "fzf-lua", -- uncomment if you want a better ui.
            })
        end,
        event = { "UIEnter" }, -- best way to lazy load this plugin
    },
    {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup()
        end,
    },
    'wincent/loupe',

    --- Appearance
    'connorholyday/vim-snazzy',
    'flazz/vim-colorschemes',
    'iCyMind/NeoSolarized',
    'morhetz/gruvbox',
    'powerline/fonts',
    'rakr/vim-one',
    'sainnhe/edge',
    'rakr/vim-two-firewatch',
    'b4skyx/serenade',
    'savq/melange',
    'sainnhe/gruvbox-material',
    'kyazdani42/nvim-web-devicons',

    --- Writing
    'junegunn/goyo.vim',
    'lervag/vimtex',
    'reedes/vim-pencil',
    'reedes/vim-wordy',

    ---  Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    'jreybert/vimagit',
    'rhysd/committia.vim',
    'tpope/vim-fugitive',

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
            require "undotree".setup {}
        end,
        requires = "nvim-lua/plenary.nvim"
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
        requires = "nvim-lua/plenary.nvim",
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
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

    --- UI
    'nvimdev/galaxyline.nvim',
    {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
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
        "ellisonleao/glow.nvim",
        config = function() require("glow").setup() end,
    },
    "rcarriga/nvim-notify",
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
    'norcalli/snippets.nvim',
    "L3MON4D3/LuaSnip",

    --- Debug Adapter Protocol
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui",            requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    "theHamsta/nvim-dap-virtual-text",
    {
        "LunarVim/bigfile.nvim",
        config = function()
            require("bigfile").setup({
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
            })
        end,
    },
})
