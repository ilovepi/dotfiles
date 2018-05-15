" Modeline {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Dein {
    set nocompatible
    set runtimepath+=~/.nvim/dein/repos/github.com/Shougo/dein.vim

    if dein#load_state('~/.nvim/dein')
      call dein#begin('~/.nvim/dein/')

      call dein#add('~/.nvim/dein/')
      call dein#add('Shougo/dein.vim')
      call dein#add('haya14busa/dein-command.vim')        " dein bindings
      call dein#add('Shougo/deoplete.nvim')
      call dein#add('Shougo/denite.nvim')
      call dein#add('Shougo/vinarise.vim')
      "call dein#add('neomake/neomake')
      call dein#add('iCyMind/NeoSolarized')
      call dein#add('morhetz/gruvbox')
      call dein#add('rakr/vim-two-firewatch')
      call dein#add('rakr/vim-one')
      call dein#add('reedes/vim-colors-pencil')
      call dein#add('trevordmiller/nova-vim')


      call dein#add('tpope/vim-fugitive')
      call dein#add('jreybert/vimagit')
      call dein#add('tpope/vim-surround')
      call dein#add('tpope/vim-sleuth')
      call dein#add('tpope/vim-repeat')
      call dein#add('tpope/vim-markdown')
      call dein#add('rust-lang/rust.vim')
      call dein#add('cespare/vim-toml')
      call dein#add('spf13/vim-preview')
      "call dein#add('scrooloose/syntastic')
      call dein#add('w0rp/ale')
      call dein#add('scrooloose/nerdtree')
      call dein#add('scrooloose/nerdcommenter')
      call dein#add('godlygeek/tabular')
      call dein#add('luochen1990/rainbow')
      call dein#add('mattn/webapi-vim')
      call dein#add('mattn/gist-vim')
      call dein#add('majutsushi/tagbar')
      "call dein#add('mhinz/vim-signify')
      call dein#add('airblade/vim-gitgutter')

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
      call dein#add('jremmen/vim-ripgrep')

      call dein#add('octol/vim-cpp-enhanced-highlight')
      call dein#add('ryanoasis/vim-devicons')
      call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
      call dein#add('ludovicchabant/vim-gutentags')
      call dein#add('christoomey/vim-tmux-navigator')

      call dein#add('Chiel92/vim-autoformat')
      call dein#add('chrisbra/NrrwRgn')
      call dein#add('farmergreg/vim-lastplace')
      call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
      call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

      call dein#add('andreshazard/vim-logreview')
      call dein#add('ekalinin/Dockerfile.vim')
      call dein#add('metakirby5/codi.vim')
      call dein#add('brooth/far.vim')
      call dein#add('rhysd/committia.vim')

      call dein#add('autozimu/LanguageClient-neovim', {'rev' : 'next', 'build' : 'bash install.sh'})

      call dein#add('wincent/loupe')

      if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
      endif

      "call dein#add('vim-scripts/restore_view.vim')
      "call dein#add('svermeulen/vim-easyclip')

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

    set noshowmode                    " Display the current mode
    set cursorline                  " Highlight current line

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set noshowcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    "if has('statusline')
        "set laststatus=2

        "" Broken down into easily includeable segments
        "set statusline=%<%f\                     " Filename
        "set statusline+=%w%h%m%r                 " Options
        "if !exists('g:override_spf13_bundles')
            "set statusline+=%{fugitive#statusline()} " Git Hotness
        "endif
        "set statusline+=\ [%{&ff}/%Y]            " Filetype
        "set statusline+=\ [%{getcwd()}]          " Current dir
        "set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    "endif

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

" }

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

    let mapleader = ' '
    let maplocalleader = '_'

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



    " Stupid shift key fixes
    if !exists('g:spf13_no_keyfixes')
        if has("user_commands")
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>
        endif

        cmap Tabe tabe
    endif

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    "toggle search highlighting rather than clear the current search results.
    "nmap <silent> <leader>/ :set invhlsearch<CR>


" }

    " Colors {
        set termguicolors
        "colorscheme NeoSolarized
        "colorscheme gruvbox
        "colorscheme Tomorrow-Night-Eighties
        "colorscheme two-firewatch
        "let g:two_firewatch_italics=1
        colorscheme nova
        syntax on
    "}

    " Deoplete{
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#enable_smart_case = 1

        " disable autocomplete by default
        let b:deoplete_disable_auto_complete=1
        let g:deoplete_disable_auto_complete=1
        call deoplete#custom#buffer_option('auto_complete', v:false)

        if !exists('g:deoplete#omni#input_patterns')
            let g:deoplete#omni#input_patterns = {}
        endif

        " Disable the candidates in Comment/String syntaxes.
        call deoplete#custom#source('_',
                    \ 'disabled_syntaxes', ['Comment', 'String'])

        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

        " set sources
        let g:deoplete#sources         = {}
        let g:deoplete#sources.c       = ['LanguageClient']
        let g:deoplete#sources.cpp     = ['LanguageClient']
        let g:deoplete#sources.python  = ['LanguageClient']
        let g:deoplete#sources.python3 = ['LanguageClient']
        let g:deoplete#sources.rust    = ['LanguageClient']
        let g:deoplete#sources.vim     = ['vim']
    "}

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

    " Fugitive {
        "nnoremap <silent> <leader>gs :Gstatus<CR>
        "nnoremap <silent> <leader>gd :Gdiff<CR>
        "nnoremap <silent> <leader>gc :Gcommit<CR>
        "nnoremap <silent> <leader>gb :Gblame<CR>
        "nnoremap <silent> <leader>gl :Glog<CR>
        "nnoremap <silent> <leader>gp :Git push<CR>
        "nnoremap <silent> <leader>gr :Gread<CR>
        "nnoremap <silent> <leader>gw :Gwrite<CR>
        "nnoremap <silent> <leader>ge :Gedit<CR>
        "" Mnemonic _i_nteractive
        "nnoremap <silent> <leader>gi :Git add -p %<CR>
        "nnoremap <silent> <leader>gg :SignifyToggle<CR>
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

        if isdirectory(expand("~/.nvim/dein/repos/github.com/keln/python-mode"))
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
            nmap <Leader>a\ :Tabularize /\\<CR>
            vmap <Leader>a\ :Tabularize /\\<CR>
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

" Git Gutter {
    "settings for signify
    "let g:signify_vcs_list = [ 'git', 'hg' ]
    "let g:signify_sign_add='┃'
    "let g:signify_sign_change='┃'
    "let g:signify_sign_delete='◢'
    "let g:signify_sign_delete_first_line='◥'


    "nmap <Leader>ha <Plug>GitGutterStageHunk
    "nmap <Leader>hu <Plug>GitGutterUndoHunk
    "nmap ]c <Plug>GitGutterNextHunk
    "nmap [c <Plug>GitGutterPrevHunk

    let g:gitgutter_override_sign_column_highlight = 0
    let g:gitgutter_sign_added='┃'
    let g:gitgutter_sign_modified='┃'
    let g:gitgutter_sign_removed='◢'
    let g:gitgutter_sign_removed_first_line='◥'
    let g:gitgutter_sign_modified_removed='◢'

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
    if executable('rg')
        let g:ackprg = 'rg --vimgrep --no-heading --smart-case'
    else
        let g:ackprg = 'ag --vimgrep'
    endif
    let g:rg_highlight=1
    let g:rg_command ='rg --vimgrep --smart-case'

" }

" Airline Options {
    let g:airline_powerline_fonts=1
    "let g:airline_theme = 'solarized'
    "let g:airline_theme = 'gruvbox'
    "let g:airline_theme = 'tomorrow'
    "let g:airline_theme = 'twofirewatch'
        "let g:two_firewatch_italics=1
    let g:airline_theme = 'nova'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#alt_sep = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#ale#enabled = 1
    let airline#extensions#ale#error_symbol = '✖ '
    let airline#extensions#ale#warning_symbol = '⚠ '
    let airline#extensions#ale#show_line_numbers = 1
    let airline#extensions#ale#open_lnum_symbol = '(L'
    let airline#extensions#ale#close_lnum_symbol = ')'

    "nmap <leader>- <Plug>AirlineSelectPrevTab
    "nmap <leader>+ <Plug>AirlineSelectNextTab
    nmap <S-H> <Plug>AirlineSelectPrevTab
    nmap <S-L> <Plug>AirlineSelectNextTab
"}

" Snippets {
    let g:snips_author = 'Paul Kirth <pkirth@uci.edu>'
"}

" Last Place {
    let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
    let g:lastplace_ignore_buftype = "quickfix,nofile,help"
    "let g:lastplace_open_folds = 0
" }

" Denite {
    nnoremap <C-p> :Denite file_rec<cr>
" }

" Ale {
    " Enable completion where available.
    "let g:ale_completion_enabled = 1
    let g:ale_linters = {
    \   'c': [ 'clangtidy', 'clangcheck', 'flawfinder' ],
    \   'cpp': [ 'clangtidy', 'clangcheck', 'flawfinder' ],
    \}
" }

" Autoformat {
    noremap <Leader>kk :Autoformat<CR>
" }

    " IncSearch {
          "call dein#add('haya14busa/incsearch.vim')
          "call dein#add('haya14busa/incsearch-fuzzy.vim')
        "function! s:config_fuzzyall(...) abort
          "return extend(copy({
          "\   'converters': [
          "\     incsearch#config#fuzzy#converter(),
          "\     incsearch#config#fuzzyspell#converter()
          "\   ],
          "\ }), get(a:, 1, {}))
        "endfunction

        "noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
        "noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
        "noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
        "let g:incsearch#auto_nohlsearch = 1
        "map n  <Plug>(incsearch-nohl-n)
        "map N  <Plug>(incsearch-nohl-N)
        "map *  <Plug>(incsearch-nohl-*)
        "map #  <Plug>(incsearch-nohl-#)
        "map g* <Plug>(incsearch-nohl-g*)
        "map g# <Plug>(incsearch-nohl-g#)
    " }

    " FZF Settings {
        " Customize fzf colors to match your color scheme
        let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
          \ 'bg':      ['bg', 'Normal'],
          \ 'hl':      ['fg', 'Comment'],
          \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \ 'hl+':     ['fg', 'Statement'],
          \ 'info':    ['fg', 'PreProc'],
          \ 'border':  ['fg', 'Ignore'],
          \ 'prompt':  ['fg', 'Conditional'],
          \ 'pointer': ['fg', 'Exception'],
          \ 'marker':  ['fg', 'Keyword'],
          \ 'spinner': ['fg', 'Label'],
          \ 'header':  ['fg', 'Comment'] }
    " }

    " LanguageClient {
        let g:LanguageClient_serverCommands = {
            \ 'cpp' : ['clangd'],
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ }

        set signcolumn=yes
        nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
        nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
        nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
        let g:LanguageClient_selectionUI = 'fzf'
    " }
