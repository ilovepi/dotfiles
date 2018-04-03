" Modeline {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Dein {
    set nocompatible
    set runtimepath+=~/.nvim/bundle/repos/github.com/Shougo/dein.vim

    if dein#load_state('~/.nvim/bundle')
      call dein#begin('~/.nvim/bundle/')

      call dein#add('~/.nvim/bundle/')
      call dein#add('Shougo/dein.vim')
      call dein#add('Shougo/deoplete.nvim')
      call dein#add('Shougo/denite.nvim')
      call dein#add('neomake/neomake')
      call dein#add('iCyMind/NeoSolarized')
      call dein#add('tpope/vim-fugitive')
      call dein#add('tpope/vim-surround')
      call dein#add('tpope/vim-sleuth')
      call dein#add('tpope/vim-repeat')
      call dein#add('tpope/vim-markdown')
      call dein#add('rust-lang/rust.vim')
      call dein#add('rust-lang/rust.vim')
      call dein#add('cespare/vim-toml')
      call dein#add('spf13/vim-preview')
      call dein#add('scrooloose/syntastic')
      call dein#add('scrooloose/nerdtree')
      call dein#add('scrooloose/nerdcommenter')
      call dein#add('godlygeek/tabular')
      call dein#add('luochen1990/rainbow')
      call dein#add('mattn/webapi-vim')
      call dein#add('mattn/gist-vim')
      call dein#add('majutsushi/tagbar')
      call dein#add('mhinz/vim-signify')
      call dein#add('luochen1990/rainbow')

      call dein#add('rhysd/conflict-marker.vim')
      call dein#add('jiangmiao/auto-pairs')
      call dein#add('terryma/vim-multiple-cursors')
      call dein#add('vim-scripts/matchit.zip')
      call dein#add('vim-airline/vim-airline')
      call dein#add('vim-airline/vim-airline-themes')
      call dein#add('powerline/fonts')
      call dein#add('bling/vim-bufferline')
      call dein#add('easymotion/vim-easymotion')
      call dein#add('jistr/vim-nerdtree-tabs')
      call dein#add('flazz/vim-colorschemes')
      call dein#add('mbbill/undotree')
      call dein#add('nathanaelkane/vim-indent-guides')
      "call dein#add('vim-scripts/restore_view.vim')
      call dein#add('mhinz/vim-signify')
      call dein#add('osyo-manga/vim-over')
      call dein#add('kana/vim-textobj-user')
      call dein#add('kana/vim-textobj-indent')
      call dein#add('gcmt/wildfire.vim')

      call dein#add('reedes/vim-litecorrect')
      call dein#add('reedes/vim-textobj-sentence')
      call dein#add('reedes/vim-textobj-quote')
      call dein#add('reedes/vim-wordy')
      call dein#add('SirVer/ultisnips')
      call dein#add('honza/vim-snippets')
      call dein#add('klen/python-mode')
      call dein#add('yssource/python.vim')
      call dein#add('vim-scripts/python_match.vim')
      call dein#add('vim-scripts/pythoncomplete')
      call dein#add('mileszs/ack.vim')

      call dein#add('octol/vim-cpp-enhanced-highlight')
      call dein#add('ryanoasis/vim-devicons')
      call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
      call dein#add('ludovicchabant/vim-gutentags')
      call dein#add('christoomey/vim-tmux-navigator')



      if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
      endif

      call dein#end()
      call dein#save_state()
    endif

" }

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }

" Basic Settings {
    set background=dark
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif
    " }

" }

" UI {

    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

" }

    let mapleader = ' '
    let maplocalleader = '_'
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" }

" Key Mappings {


    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv


    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>


    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=
" }

    set termguicolors
    colorscheme NeoSolarized
    syntax on
    let g:deoplete#enable_at_startup = 1

    let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'

    let g:airline_powerline_fonts=1


    " UndoTree {
        if isdirectory(expand("~/.vim/bundle/undotree/"))
            nnoremap <Leader>u :UndotreeToggle<CR>
            " If undotree is opened, it is likely one wants to interact with it.
            let g:undotree_SetFocusWhenToggle=1
        endif
    " }


    " indent_guides {
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }


    " vim-airline {
        let g:airline_powerline_fonts=1
        let g:airline_theme = 'solarized'
    " }


    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    "}


    " Rainbow {
        if isdirectory(expand("~/.vim/bundle/rainbow/"))
            let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
        endif
    "}


    " TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    "}


    " PyMode {
        " Disable if python support not present
        if !has('python') && !has('python3')
            let g:pymode = 0
        endif

        if isdirectory(expand("~/.nvim/bundle/repos/github.com/keln/python-mode"))
            let g:pymode_lint_checkers = ['pyflakes']
            let g:pymode_trim_whitespaces = 0
            let g:pymode_options = 0
            let g:pymode_rope = 0
        endif
    " }


    " NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
        endif
    " }

    " Tabularize {
        if isdirectory(expand("~/.vim/bundle/tabular"))
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    " }


    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }


" Key Bindings {
    " sane remap of <Esc>
    :imap jk <Esc>

    if has('nvim')
        tnoremap <Esc> <C-\><C-n>
        tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
        tnoremap <C-h> <C-\><C-N><C-w>h
        tnoremap <C-j> <C-\><C-N><C-w>j
        tnoremap <C-k> <C-\><C-N><C-w>k
        tnoremap <C-l> <C-\><C-N><C-w>l
        inoremap <C-h> <C-\><C-N><C-w>h
        inoremap <C-j> <C-\><C-N><C-w>j
        inoremap <C-k> <C-\><C-N><C-w>k
        inoremap <C-l> <C-\><C-N><C-w>l
        "nnoremap <C-h> <C-w>h
        "nnoremap <C-j> <C-w>j
        "nnoremap <C-k> <C-w>k
        "nnoremap <C-l> <C-w>l
    endif

    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l
    map <C-H> <C-W>h
"}

" Git Gutter {
    "settings for signify
    let g:signify_vcs_list = [ 'git', 'hg' ]
    let g:signify_realtime = 1
    "let g:signify_line_highlight = 1
" }

" Syntax Highlighting {
    "set guifont=Meslo\ LG\ S\ for\ Powerline:h12,Meslo\ LG\ S\ for\ Powerline:h11,Meslo\ LG\ S\ for\ Powerline:h12,Meslo\ LG\ S\ for\ Powerline:h14
    let g:cpp_class_scope_highlight = 1
    let g:cpp_member_variable_highlight = 1
    let g:cpp_experimental_template_highlight = 1
    let g:cpp_concepts_highlight = 1
" }

" Clang Library Path {
    " path to directory where library can be found
        let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
" }

" Ack Options {
    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
    endif
" }

" Airline Options {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#alt_sep = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    "nmap <leader>- <Plug>AirlineSelectPrevTab
    "nmap <leader>+ <Plug>AirlineSelectNextTab
    nmap <S-H> <Plug>AirlineSelectPrevTab
    nmap <S-L> <Plug>AirlineSelectNextTab
"}


    let g:snips_author = 'Paul Kirth <pkirth@uci.edu>'
