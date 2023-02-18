vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


return require('packer').startup(function()
        local use = require('packer').use

        use 'wbthomason/packer.nvim'
        -- Completion
        use 'Chiel92/vim-autoformat'
        use 'honza/vim-snippets'
        use 'norcalli/snippets.nvim'
        use 'dense-analysis/ale'


        -- Search & Navigation
        use 'brooth/far.vim'
        use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
        use 'junegunn/fzf.vim'
        use {
            'kyazdani42/nvim-tree.lua',
            requires = { 'kyazdani42/nvim-web-devicons' },
            tag = 'nightly'
        }
        use 'wincent/loupe'

        -- Appearance
        use 'connorholyday/vim-snazzy'
        use 'flazz/vim-colorschemes'
        use 'iCyMind/NeoSolarized'
        use 'morhetz/gruvbox'
        use 'powerline/fonts'
        use 'rakr/vim-one'
        use 'sainnhe/edge'
        use 'rakr/vim-two-firewatch'
        use 'b4skyx/serenade'
        use 'savq/melange'
        use 'sainnhe/gruvbox-material'
        use 'kyazdani42/nvim-web-devicons'
        use 'trevordmiller/nova-vim'

        -- Writing
        use 'junegunn/goyo.vim'
        use 'lervag/vimtex'
        use 'reedes/vim-pencil'
        use 'reedes/vim-wordy'

        --  Git
        use 'airblade/vim-gitgutter'
        use 'jreybert/vimagit'
        use 'rhysd/committia.vim'
        use 'tpope/vim-fugitive'

        -- Languages
        use 'andreshazard/vim-logreview'
        use 'ekalinin/Dockerfile.vim'
        use 'rust-lang/rust.vim'

        -- Viewing
        --use 'greyblake/vim-preview'

        -- Vim navigation & editing essentials
        use 'chrisbra/NrrwRgn'
        use 'christoomey/vim-tmux-navigator'
        use 'ethanholz/nvim-lastplace'
        use 'godlygeek/tabular'
        use 'windwp/nvim-autopairs'
        use {
            "jiaoshijie/undotree",
            config = function()
                require "undotree".setup {}
            end,
            requires = "nvim-lua/plenary.nvim"
        }
        --use 'nathanaelkane/vim-indent-guides'
        use "lukas-reineke/indent-blankline.nvim"
        use 'osyo-manga/vim-over'
        --use 'preservim/nerdcommenter'
        use 'tpope/vim-repeat'
        use 'tpope/vim-sleuth'
        use 'tpope/vim-surround'

        use 'numToStr/Comment.nvim'

        -- lua vim stuff

        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        }
        use { 'glepnir/lspsaga.nvim',
            branch = "main",
            config = function()
                require("lspsaga").setup({})
            end,
            dependencies = {
                { "nvim-tree/nvim-web-devicons" },
                { "nvim-treesitter/nvim-treesitter" }
            }
        }
        use 'glepnir/galaxyline.nvim'
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
        use { "ellisonleao/glow.nvim" }
        use "rcarriga/nvim-notify"
        use "j-hui/fidget.nvim"
        use { "kalcutter/vim-gn" }

        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }

        use {
            'lewis6991/spellsitter.nvim',
            config = function()
                require('spellsitter').setup()
            end
        }

        use "hrsh7th/nvim-cmp"
        -- use "hrsh7th/cmp-cmdline"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-nvim-lua"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-nvim-lsp-document-symbol"
        use 'hrsh7th/cmp-omni'
        use "saadparwaiz1/cmp_luasnip"
        use "tamago324/cmp-zsh"

        use "L3MON4D3/LuaSnip"

        -- Debug Adapter Protocol
        use "mfussenegger/nvim-dap"
        use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
        use "theHamsta/nvim-dap-virtual-text"

        if packer_bootstrap then
            require('packer').sync()
        end
    end)
