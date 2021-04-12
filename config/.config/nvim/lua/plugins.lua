

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true}
    -- Completion
    use 'Chiel92/vim-autoformat'
    --use 'Shougo/denite.nvim'
    --use 'Shougo/deoplete.nvim'
    --use 'Shougo/deorise.nvim'
    --use 'SirVer/ultisnips'
    --use 'autozimu/LanguageClient-neovim', {'rev' : 'next', 'build' : 'bash install.sh'}
    use 'honza/vim-snippets'
    use 'norcalli/snippets.nvim'
    --use 'w0rp/ale'
    use 'dense-analysis/ale'


    -- Search & Navigation
    use 'brooth/far.vim'
    --use {'junegunn/fzf', { 'build': './install --all', 'merged': 0 })}
    use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
    use 'junegunn/fzf.vim'
    use {'raghur/fruzzy', run = function() vim.fn['fruzzy#install']() end}
    use { 
        'scrooloose/nerdtree',
        requires = {
            {'tiagofumo/vim-nerdtree-syntax-highlight', opt = true},
            {'jistr/vim-nerdtree-tabs', opt = true }
        }
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
    --use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'trevordmiller/nova-vim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

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
    use 'tpope/vim-markdown'

    -- Viewing
    use 'greyblake/vim-preview'

    -- Vim navigation & editing essentials
    use 'bling/vim-bufferline'
    use 'chrisbra/NrrwRgn'
    use 'christoomey/vim-tmux-navigator'
    use 'farmergreg/vim-lastplace'
    use 'gcmt/wildfire.vim'
    use 'godlygeek/tabular'
    use 'jiangmiao/auto-pairs'
    use 'kana/vim-textobj-indent'
    use 'kana/vim-textobj-user'
    use 'mattn/webapi-vim'
    use 'mbbill/undotree'
    use 'nathanaelkane/vim-indent-guides'
    use 'osyo-manga/vim-over'
    use 'reedes/vim-litecorrect'
    use 'reedes/vim-textobj-quote'
    use 'reedes/vim-textobj-sentence'
    --use 'rhysd/conflict-marker.vim'
    use 'preservim/nerdcommenter'
    use 'tpope/vim-repeat'
    use 'tpope/vim-sleuth'
    use 'tpope/vim-surround'

    use 'metakirby5/codi.vim'



    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    --use 'nvim-treesitter/nvim-treesitter'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'kabouzeid/nvim-lspinstall'


end)
