-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])


local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add {
    'wbthomason/packer.nvim',
    -- Completion
    'Chiel92/vim-autoformat',
    'honza/vim-snippets',
    'norcalli/snippets.nvim',
    'dense-analysis/ale',

    -- Search & Navigation
    'brooth/far.vim',
    -- { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end },
    -- 'junegunn/fzf.vim',

    {
        "arsham/fzfmania.nvim",
        requires = {
            "arsham/arshlib.nvim",
            "junegunn/fzf.vim",
            "nvim-lua/plenary.nvim",
            "arsham/listish.nvim",
            -- uncomment if you want a better ui.
            {
              "ibhagwan/fzf-lua",
              requires = { "kyazdani42/nvim-web-devicons" },
            },
        },
        config = function()
            require("fzfmania").config({
                frontend = "fzf-lua", -- uncomment if you want a better ui.
            })
        end,
        event = { "UIEnter" }, -- best way to lazy load this plugin
    },

    {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        tag = 'nightly'
    },
    'wincent/loupe',

    -- Appearance
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
    'trevordmiller/nova-vim',

    -- Writing
    'junegunn/goyo.vim',
    'lervag/vimtex',
    'reedes/vim-pencil',
    'reedes/vim-wordy',

    --  Git
    'airblade/vim-gitgutter',
    'jreybert/vimagit',
    'rhysd/committia.vim',
    'tpope/vim-fugitive',

    -- Languages
    'andreshazard/vim-logreview',
    'ekalinin/Dockerfile.vim',
    'rust-lang/rust.vim',

    -- Viewing
    --'greyblake/vim-preview'

    -- Vim navigation & editing essentials
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
    --'nathanaelkane/vim-indent-guides'
    "lukas-reineke/indent-blankline.nvim",
    'osyo-manga/vim-over',
    --'preservim/nerdcommenter'
    'tpope/vim-repeat',
    'tpope/vim-sleuth',
    'tpope/vim-surround',

    'numToStr/Comment.nvim',

    -- lua vim stuff

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {
        'glepnir/lspsaga.nvim',
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    },
    'glepnir/galaxyline.nvim',
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    },
    { "ellisonleao/glow.nvim" },
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
    { "kalcutter/vim-gn" },

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

    -- {
    --     'lewis6991/spellsitter.nvim',
    --     config = function()
    --         require('spellsitter').setup()
    --     end
    -- }

    "hrsh7th/nvim-cmp",
    -- "hrsh7th/cmp-cmdline"
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    'hrsh7th/cmp-omni',
    "saadparwaiz1/cmp_luasnip",
    "tamago324/cmp-zsh",

    "L3MON4D3/LuaSnip",

    -- Debug Adapter Protocol
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
    "theHamsta/nvim-dap-virtual-text",
    -- packer example:
    {
        "LunarVim/bigfile.nvim",
    },
}
