" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

set nocompatible

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)



let g:polyglot_disabled = ['latex']


let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-bibtex',
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}


    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'nvim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

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
    "syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    "scriptencoding utf-8

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    " Always switch to the current file directory
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    "set spell                           " Spell checking on
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

    set colorcolumn=80              " Puts a visual marker at the desired line width
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set relativenumber                      " Line numbers on
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

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Easier formatting
    "nnoremap <silent> <leader>q gwip

    " Toggle fold at current position.
    nnoremap <Tab> za

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
        au FileType fzf tunmap <Esc>
        au TermOpen * tnoremap <Esc> <C-\><c-n>
        tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
        tnoremap <C-h> <C-\><C-N><C-w>h
        tnoremap <C-j> <C-\><C-N><C-w>j
        tnoremap <C-k> <C-\><C-N><C-w>k
        tnoremap <C-l> <C-\><C-N><C-w>l
        inoremap <C-h> <C-\><C-N><C-w>h
        inoremap <C-j> <C-\><C-N><C-w>j
        inoremap <C-k> <C-\><C-N><C-w>k
        inoremap <C-l> <C-\><C-N><C-w>l
    endif

    "map <C-J> <C-W>j
    "map <C-K> <C-W>k
    "map <C-L> <C-W>l
    "map <C-H> <C-W>h

    " Stupid shift key fixes
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

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

" }

    " Colors {
        set termguicolors

        let g:gruvbox_material_background = 'soft'
        let g:gruvbox_material_enable_bold = 1
        let g:gruvbox_material_enable_italic = 1
        let g:gruvbox_material_diagnostic_text_highlight = 1
        let g:gruvbox_material_diagnostic_line_highlight = 1
        let g:gruvbox_material_better_performance = 1


        let g:serenade_background = 'soft'
        let g:serenade_enable_bold = 1
        let g:serenade_enable_italic = 1
        let g:serenade_diagnostic_text_highlight = 1
        let g:serenade_diagnostic_line_highlight = 1
        let g:serenade_better_performance = 1



        "let g:srcery_background = 'soft'
        "let g:srcery_bold = 1
        "let g:srcery_italic = 1
        "let g:srcery_diagnostic_text_highlight = 1
        "let g:srcery_diagnostic_line_highlight = 1
        "let g:srcery_better_performance = 1


        colorscheme gruvbox-material
        "colorscheme serenade
        "colorscheme melange
        "colorscheme srcery
        syntax on
    "}

    " UndoTree {
        nnoremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
    " }

    " indent_guides {
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }

    " Fugitive {
        " nnoremap <silent> <leader>gs :Gstatus<CR>
        " nnoremap <silent> <leader>gv :Gdiff<CR>
        " nnoremap <silent> <leader>gc :Gcommit<CR>
        " nnoremap <silent> <leader>gb :Git blame<CR>
        " nnoremap <silent> <leader>gl :Gclog<CR>
        " nnoremap <silent> <leader>gp :Git push<CR>
        " nnoremap <silent> <leader>gr :Gread<CR>
        " nnoremap <silent> <leader>gw :Gwrite<CR>
        " nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        " nnoremap <silent> <leader>gi :Git add -p %<CR>
    "}

    " NvimTree {
            nnoremap <C-e> :NvimTreeToggle<CR>
    " }

    " Tabularize {
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
    " }

" Git Gutter {
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
    "let g:airline_theme = 'nova'
    "let g:airline_theme = 'serenade'
    let g:airline_theme = 'gruvbox_material'

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#alt_sep = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#ale#enabled = 1
    let airline#extensions#ale#error_symbol = '✖ '
    let airline#extensions#ale#warning_symbol = '⚠ '
    let airline#extensions#ale#show_line_numbers = 1
    let airline#extensions#ale#open_lnum_symbol = '(L'
    let airline#extensions#ale#close_lnum_symbol = ')'

    "nmap <S-H> <Plug>AirlineSelectPrevTab
    "nmap <S-L> <Plug>AirlineSelectNextTab
    nmap <S-H> :BufferLineCyclePrev<CR>
    nmap <S-L> :BufferLineCycleNext<CR>
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
    "nnoremap <C-p> :Denite file/rec<cr>

    if 0


    "call denite#custom#option('_', {
      "\ 'prompt': '❯',
      "\ 'split': 'floating',
      "\ 'highlight_matched_char': 'Underlined',
      "\ 'highlight_matched_range': 'NormalFloat',
      "\ 'wincol': &columns / 6,
      "\ 'winwidth': &columns * 2 / 3,
      "\ 'winrow': &lines / 6,
      "\ 'winheight': &lines * 2 / 3,
      "\ 'max_dynamic_update_candidates': 100000
      "\ })

    call denite#custom#var('file/rec', 'command',
          \ ['fd', '-H', '--full-path'])
    call denite#custom#source(
            \ 'file/rec', 'matchers', ['matcher/fruzzy'])
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
          \ ['--vimgrep', '--smart-case', '--no-heading'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    autocmd FileType denite call s:denite_settings()

    function! s:denite_settings() abort
      nnoremap <silent><buffer><expr> <CR>
            \ denite#do_map('do_action')
      nnoremap <silent><buffer><expr> <C-v>
            \ denite#do_map('do_action', 'vsplit')
      nnoremap <silent><buffer><expr> d
            \ denite#do_map('do_action', 'delete')
      nnoremap <silent><buffer><expr> p
            \ denite#do_map('do_action', 'preview')
      nnoremap <silent><buffer><expr> <Esc>
            \ denite#do_map('quit')
      nnoremap <silent><buffer><expr> q
            \ denite#do_map('quit')
      nnoremap <silent><buffer><expr> i
            \ denite#do_map('open_filter_buffer')
    endfunction

    autocmd FileType denite-filter call s:denite_filter_settings()

    function! s:denite_filter_settings() abort
      nmap <silent><buffer> <Esc> <Plug>(denite_filter_quit)
    endfunction

    nnoremap <C-p> :<C-u>Denite file/rec -start-filter<CR>
    nnoremap <leader>s :<C-u>Denite buffer<CR>
    nnoremap <leader>8 :<C-u>DeniteCursorWord grep:.<CR>
    nnoremap <leader>/ :<C-u>Denite -start-filter -filter-updatetime=0 grep:::!<CR>
    nnoremap <leader><Space>/ :<C-u>DeniteBufferDir -start-filter -filter-updatetime=0 grep:::!<CR>
    nnoremap <leader>d :<C-u>DeniteBufferDir file/rec -start-filter<CR>
    "nnoremap <leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
    nnoremap <leader><C-r> :<C-u>Denite register:.<CR>
    nnoremap <leader>g :<C-u>Denite gitstatus<CR>

    " neoyank
    nnoremap <leader>y :<C-u>Denite neoyank<CR>
endif

" }

" Ale {
    " Enable completion where available.
    "let g:ale_completion_enabled = 1
    let g:ale_linters_explicit = 1
    let g:ale_disable_lsp = 1
    let g:ale_linters = {
    \   'c': [ 'clangtidy', 'clangcheck', 'flawfinder' ],
    \   'cpp': [ 'clangtidy', 'clangcheck', 'flawfinder' ],
    \   'latex': [ 'chktex', 'lacheck', 'proselint', 'vale', 'write-good' ],
    \}
" }

" Autoformat {
    noremap <Leader>kk :Autoformat<CR>
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

        set signcolumn=yes
    " Writing {
        let g:tex_flavor = "latex"
        let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
        augroup pencil
          autocmd!
          autocmd FileType markdown,mkd      call pencil#init()
          autocmd FileType text,tex,plaintex call pencil#init()
        augroup END


    " }

    " UltiSnips {
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-k>"
        let g:UltiSnipsJumpBackwardTrigger="<c-j>"
    " }

lua require("setup")

" Errors in Red
"hi LspDiagnosticsVirtualTextError guifg=#d75f5f ctermfg=124 gui=bold,italic
"hi LspDiagnosticsDefaultError guifg=#d75f5f ctermfg=124 gui=bold,italic
"hi LspDiagnosticsDefaultSignError guifg=#d75f5f ctermfg=124 gui=bold

hi LspDiagnosticsVirtualTextError guifg=#d76e6e ctermfg=124 gui=bold,italic
hi LspDiagnosticsDefaultError guifg=#d76e6e ctermfg=124 gui=bold,italic
hi LspDiagnosticsDefaultSignError guifg=#d75f5f ctermfg=124 gui=bold


" Warnings in Yellow
hi LspDiagnosticsVirtualTextWarning guifg=#e5a46b ctermfg=DarkYellow gui=italic,bold
hi LspDiagnosticsDefaultWarning guifg=#e5a46b ctermfg=Yellow gui=italic,bold
hi LspDiagnosticsDefaultSignWarning guifg=#e5a46b ctermfg=Yellow gui=bold

" Info and Hints in White
hi LspDiagnosticsVirtualTextInformation guifg=Purple ctermfg=White gui=italic,bold
hi LspDiagnosticsDefaultInformation guifg=White ctermfg=White gui=italic,bold
hi LspDiagnosticsDefaultSignInformation guifg=White ctermfg=White gui=bold

hi LspDiagnosticsVirtualTextHint guifg=#878787 ctermfg=White gui=italic,bold
hi LspDiagnosticsDefaultHint guifg=Cyan ctermfg=Cyan gui=italic,bold
hi LspDiagnosticsDefaultSignHint guifg=#87c095 ctermfg=Cyan gui=bold


" Underline the offending code
"hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
"hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
"hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
"hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline


lua require("lsp")

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
"let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_snippet = 'snippets.nvim'
"let g:completion_enable_auto_paren = 1
lua require'completion'.addCompletionSource('vimtex', require'vimtex'.complete_item)
let g:completion_chain_complete_list = {
        \ 'tex' : [
        \     {'complete_items': ['vimtex']}, 
        \   ],
        \ }
if !&diff
    autocmd BufEnter * lua require'completion'.on_attach()
endif

" <c-k> will either expand the current snippet at the word or try to jump to
" the next position for the snippet.
inoremap <c-t> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>

" <c-j> will jump backwards to the previous field.
" If you jump before the first field, it will cancel the snippet.
inoremap <c-r> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END
