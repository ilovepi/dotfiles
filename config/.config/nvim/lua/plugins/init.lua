local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add {
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
    "lewis6991/gitsigns.nvim",
    'jreybert/vimagit',
    'rhysd/committia.vim',
    'tpope/vim-fugitive',

    --- Viewing
    --'greyblake/vim-preview'

    --- Vim navigation & editing essentials
    'chrisbra/NrrwRgn',
    'christoomey/vim-tmux-navigator',
    'ethanholz/nvim-lastplace',
    'godlygeek/tabular',
    'windwp/nvim-autopairs',
    {
        "jiaoshijie/undotree",
        config = function()
            require "undotree".setup {}
        end,
        requires = "nvim-lua/plenary.nvim"
    },
    "lukas-reineke/indent-blankline.nvim",
    'osyo-manga/vim-over',
    'tpope/vim-repeat',
    'tpope/vim-sleuth',
    'tpope/vim-surround',
    'numToStr/Comment.nvim',
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
            require("fidget").setup {
                -- options
            }
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
    { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

    "theHamsta/nvim-dap-virtual-text",
    "LunarVim/bigfile.nvim",
}
