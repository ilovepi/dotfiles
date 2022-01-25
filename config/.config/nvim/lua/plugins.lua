

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
    use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
    use 'junegunn/fzf.vim'
    use {'raghur/fruzzy', run = function() vim.fn['fruzzy#install']() end}
    use 'kyazdani42/nvim-tree.lua'
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
    --use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'trevordmiller/nova-vim'

    -- Writing
    use 'junegunn/goyo.vim'
    use 'lervag/vimtex'
    use 'reedes/vim-colors-pencil'
    use 'reedes/vim-pencil'
    use 'reedes/vim-wordy'

    --  Git
    use 'airblade/vim-gitgutter'
    use 'jreybert/vimagit'
    use 'mattn/gist-vim'
    use 'rhysd/committia.vim'
    use 'tpope/vim-fugitive'

    -- Languages
    use 'andreshazard/vim-logreview'
    use 'cespare/vim-toml'
    use 'ekalinin/Dockerfile.vim'
    use 'rust-lang/rust.vim'
    use 'sheerun/vim-polyglot'

    -- Viewing
    --use 'greyblake/vim-preview'

    -- Vim navigation & editing essentials
    use 'chrisbra/NrrwRgn'
    use 'christoomey/vim-tmux-navigator'
    use 'farmergreg/vim-lastplace'
    use 'godlygeek/tabular'
    use 'windwp/nvim-autopairs'
    use 'mbbill/undotree'
    use 'nathanaelkane/vim-indent-guides'
    use 'osyo-manga/vim-over'
    use 'reedes/vim-litecorrect'
    use 'reedes/vim-textobj-quote'
    use 'reedes/vim-textobj-sentence'
    use 'preservim/nerdcommenter'
    use 'tpope/vim-repeat'
    use 'tpope/vim-sleuth'
    use 'tpope/vim-surround'

    use 'metakirby5/codi.vim'

    -- lua vim stuff
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use { 'tami5/lspsaga.nvim' }
    use 'glepnir/galaxyline.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
    use {"ellisonleao/glow.nvim"}

end)
