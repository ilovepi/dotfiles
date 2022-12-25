
local fn = vim.fn

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

--- options

vim.g.polyglot_disabled = { 'latex' }

vim.g.vimtex_compiler_latexmk = [[ 'options' : [
                                        '-shell-escape',
                                        '-bibtex',
                                        '-pdf',
                                        '-verbose',
                                        '-file-line-error',
                                        '-synctex=1',
                                    ],
                                ]]


local function init_dirs()
  local prefix = vim.env.XDG_DATA_HOME or vim.fn.expand("~/.cache")
  vim.opt.undodir = prefix .. "/nvim/.undo//"
  vim.opt.backupdir = prefix .. "/nvim/.backup//"
  vim.opt.directory = prefix .. "/nvim/.swp//"
  vim.opt.viewdir = prefix .. "/nvim/.views//"
end

init_dirs()

--- Basic Settings

local o = vim.o
local opt = vim.opt

o.background = 'dark'
o.mouse = 'a'                 --- Automatically enable mouse usage
o.mousehide = true            --- Hide the mouse cursor while typing

o.clipboard = 'unnamed,unnamedplus'

--- Always switch to the current file directory
--- autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

-- vim.api.nvim_create_autocmd("BufEnter", {})
o.autochdir = true

o.shortmess   = vim.o.shortmess .. 'filmnrxoOtT'  --- Abbrev. of messages (avoids 'hit enter')
o.viewoptions = 'folds,options,cursor,unix,slash' --- Better Unix / Windows compatibility
o.virtualedit = 'onemore'                         --- Allow for cursor beyond last character
o.history     = 1000                              --- Store a ton of history (default is 20)
o.spell       = true                              --- Spell checking on
o.hidden      = true                              --- Allow buffer switching without saving
opt.iskeyword = opt.iskeyword - { '.' }           --- '.' is an end of word designator
opt.iskeyword = opt.iskeyword - { '#' }           --- '#' is an end of word designator
opt.iskeyword = opt.iskeyword - { '-' }           --- '-' is an end of word designator

vim.opt.signcolumn = 'yes:1'

--- Instead of reverting the cursor to the last position in the buffer, we
--- set it to the first line when editing a git commit message
--- au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

---  Setting up the directories
o.backup = true                  --- Backups are nice ...
o.undofile = true                --- So is persistent undo ...
o.undolevels=1000         --- Maximum number of changes that can be undone
o.undoreload=10000        --- Maximum number lines to save for undo on a buffer reload


--- UI

opt.cursorline     = true
opt.showmode       = false
opt.ruler          = true
opt.rulerformat    = "%30(%= \\:b%n%y%m%r%w\\ %l,%c%V\\ %P%)"
opt.showcmd        = false
opt.colorcolumn    = '80'                                --- Puts a visual marker at the desired line width
opt.backspace      = 'indent,eol,start'                  --- Backspace for dummies
opt.linespace      = 0                                   --- No extra spaces between rows
opt.number         = true                                --- Line numbers on
opt.relativenumber = true                                --- Line numbers on
opt.showmatch      = true                                --- Show matching brackets/parenthesis
opt.incsearch      = true                                --- Find as you type search
opt.hlsearch       = true                                --- Highlight search terms
opt.winminheight   = 0                                   --- Windows can be 0 line high
opt.ignorecase     = true                                --- Case insensitive search
opt.smartcase      = true                                --- Case sensitive when uc present
opt.wildmenu       = true                                --- Show list instead of just completing
opt.wildmode       = "list:longest,full"                 --- Command <Tab> completion, list matches, then longest common part, then all.
opt.whichwrap      = "b,s,h,l,<,>,[,]"                   --- Backspace and cursor keys wrap too
opt.scrolljump     = 5                                   --- Lines to scroll when cursor leaves screen
opt.scrolloff      = 3                                   --- Minimum lines to keep above and below cursor
opt.foldenable     = true                                --- Auto fold code
opt.list           = true
opt.listchars      = 'tab:›\\ ,trail:•,extends:#,nbsp:.' --- Highlight problematic whitespace

--- formatting
opt.wrap        = false   --- Do not wrap long lines
opt.autoindent  = true    --- Indent at the same level of the previous line
opt.expandtab   = true    --- Tabs are spaces, not tabs
opt.joinspaces  = false   --- Prevents inserting two spaces after punctuation on a join (J)
opt.splitright  = true    --- Puts new vsplit windows to the right of the current
opt.splitbelow  = true    --- Puts new split windows to the bottom of the current
opt.shiftwidth  = 4       --- Use indents of 4 spaces
opt.tabstop     = 4       --- An indentation every four columns
opt.softtabstop = 4       --- Let backspace delete indent
opt.pastetoggle = "<F12>" --- pastetoggle (sane indentation on pastes)

--- Key Bindings

vim.g.mapleader = ' '
vim.g.maplocalleader = '_'

--- Easier moving in tabs and windows
--- The lines conflict with the default digraph mapping of <C-K>
vim.keymap.set("n", "<C-J>", "<C-W>j<C-W>")
vim.keymap.set("n", "<C-K>", "<C-W>k<C-W>")
vim.keymap.set("n", "<C-L>", "<C-W>l<C-W>")
vim.keymap.set("n", "<C-H>", "<C-W>h<C-W>")

-- Make splits equal
vim.keymap.set("n", "<leader>=", "<C-W>=")

-- Bufferline config
vim.keymap.set("n", "<S-H>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<S-L>", ":BufferLineCycleNext<CR>")


-- Shortcuts
-- Change Working Directory to that of the current file

vim.keymap.set("c", "cwd", "lcd %:p:h")
vim.keymap.set("c", "cd.", "lcd %:p:h")


vim.keymap.set("n", "j", "gj", {noremap=true})
vim.keymap.set("n", "k", "gk", {noremap=true})


--- Visual shifting (does not exit Visual mode)
vim.keymap.set("v", "<", "<gv", {noremap=true})
vim.keymap.set("v", ">", ">gv", {noremap=true})

--- Easier formatting
vim.keymap.set("n", "<leader>q", "gwip", {noremap=true, silent=true})

--- Toggle fold at current position.
vim.keymap.set("n", "<Tab>", "za", {noremap=true})

--- Allow using the repeat operator with a visual selection (!)
--- http://stackoverflow.com/a/8064607/127816
vim.keymap.set("v", ".", ":normal .<CR>", {noremap=true})

--- For when you forget to sudo.. Really Write the file.
--- unfortunately this doesn't work in neovim :(
--- cmap w!! w !sudo tee % >/dev/null


-- Some helpers to edit mode
-- http://vimcasts.org/e/14
vim.keymap.set("c", "%%", "<C-R>=fnameescape(expand('%:h')).'/'<CR>", {noremap=true})
vim.keymap.set("v", "ew", ":e %%")
vim.keymap.set("v", "es", ":sp %%")
vim.keymap.set("v", "ev", ":vs %%")
vim.keymap.set("v", "et", ":tabe %%")

-- Adjust viewports to the same size
vim.keymap.set("v", "<Leader>=", "<C-w>=")

-- sane remap of <Esc>
vim.keymap.set("v", "jk", "<Esc>=")
vim.cmd([[au FileType fzf tunmap <Esc>
          au TermOpen * tnoremap <Esc> <C-\><c-n>
          tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
          tnoremap <C-h> <C-\><C-N><C-w>h
          tnoremap <C-j> <C-\><C-N><C-w>j
          tnoremap <C-k> <C-\><C-N><C-w>k
          tnoremap <C-l> <C-\><C-N><C-w>l
          inoremap <C-h> <C-\><C-N><C-w>h
          inoremap <C-j> <C-\><C-N><C-w>j
          inoremap <C-k> <C-\><C-N><C-w>k
          inoremap <C-l> <C-\><C-N><C-w>l]])

-- map <C-J> <C-W>j
-- map <C-K> <C-W>k
-- map <C-L> <C-W>l
-- map <C-H> <C-W>h

-- Stupid shift key fixes
vim.cmd([[command! -bang -nargs=* -complete=file E e<bang> <args>
          command! -bang -nargs=* -complete=file W w<bang> <args>
          command! -bang -nargs=* -complete=file Wq wq<bang> <args>
          command! -bang -nargs=* -complete=file WQ wq<bang> <args>
          command! -bang Wa wa<bang>
          command! -bang WA wa<bang>
          command! -bang Q q<bang>
          command! -bang QA qa<bang>
          command! -bang Qa qa<bang>]])

vim.keymap.set("c", "Tabe", "tabe")

-- Yank from the cursor to the end of the line, to be consistent with C and D.
vim.keymap.set("n", "Y", "y$")

--- colors

opt.termguicolors = true

vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_better_performance = 1

-- On is the default ... so skip?
-- vim.opt.syntax = 'on'


-- vim.g.serenade_background = 'soft'
-- vim.g.serenade_enable_bold = 1
-- vim.g.serenade_enable_italic = 1
-- vim.g.serenade_diagnostic_text_highlight = 1
-- vim.g.serenade_diagnostic_line_highlight = 1
-- vim.g.serenade_better_performance = 1


--- UndoTree
vim.g.undotree_SetFocusWhenToggle=1
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", {noremap=true})

--- Indent guides
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1
vim.g.indent_guides_enable_on_vim_startup = 1

-- NvimTree

vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", {noremap=true})

-- Tabularize
vim.keymap.set({"n", "v"}, "<Leader>a&", ":Tabularize /&<CR>")
vim.keymap.set({"n", "v"}, "<Leader>a=", ":Tabularize /^[^=]*\zs=<CR>")
vim.keymap.set({"n", "v"}, "<Leader>a=>", ":Tabularize /=><CR>")
vim.keymap.set({"n", "v"}, "<Leader>a:", ":Tabularize /: <CR>")
vim.keymap.set({"n", "v"}, "<Leader>a::", ":Tabularize /: \zs<CR>")
vim.keymap.set({"n", "v"}, "<Leader>a,", ":Tabularize /,<CR>")
vim.keymap.set({"n", "v"}, "<Leader>a,,", ":Tabularize /,\zs<CR>")
vim.keymap.set({"n", "v"}, "<Leader>a<Bar>", ":Tabularize /<Bar><CR>")
vim.keymap.set({"n", "v"}, "<Leader>a\\", ":Tabularize /\\<CR>")

-- GitGutter
vim.g.gitgutter_override_sign_column_highlight = 0
vim.g.gitgutter_sign_added='┃'
vim.g.gitgutter_sign_modified='┃'
vim.g.gitgutter_sign_removed='◢'
vim.g.gitgutter_sign_removed_first_line='◥'
vim.g.gitgutter_sign_modified_removed='◢'

-- Snippets

vim.g.snips_author = 'Paul Kirth <paulkirth@google.com>'

-- Last Place
vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
vim.g.lastplace_ignore_buftype = "quickfix,nofile,help"


-- Ale
vim.g.ale_linters_explicit = 1
vim.g.ale_disable_lsp = 1
vim.g.ale_linters = {
  ['c'] = {'clangtidy', 'clangcheck', 'flawfinder'},
  ['cpp'] = {'clangtidy', 'clangcheck', 'flawfinder'},
  ['latex'] = {'chktex', 'lacheck', 'proselint', 'vale', 'write-good'},
}


-- Autoformat
vim.keymap.set({"n", "v"}, "<Leader>kk", ":Autoformat<CR>", {noremap=true})

-- FZF
-- Customize fzf colors to match your color scheme
vim.g.fzf_colors = {
  ['fg']      = {'fg', 'Normal'},
  ['bg']      = {'bg', 'Normal'},
  ['hl']      = {'fg', 'Comment'},
  ['fg+']     = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+']     = {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+']     = {'fg', 'Statement'},
  ['info' ]   = {'fg', 'PreProc'},
  ['border']  = {'fg', 'Ignore'},
  ['prompt']  = {'fg', 'Conditional'},
  ['pointer'] = {'fg', 'Exception'},
  ['marker']  = {'fg', 'Keyword'},
  ['spinner'] = {'fg', 'Label'},
  ['header']  = {'fg', 'Comment'}
 }



vim.keymap.set("n", "<leader>b", ":Buffers<CR>", {noremap=true})
vim.keymap.set("n", "<leader>f", ":Files<CR>", {noremap=true})
vim.keymap.set("n", "<leader>m", ":Maps<CR>", {noremap=true})
vim.keymap.set("n", "<leader>c", ":Colors<CR>", {noremap=true})
vim.keymap.set("n", "<leader>g", ":Rg<CR>", {noremap=true})

-- Writing
vim.g.tex_flavor = "latex"
vim.cmd("let g:pencil#wrapModeDefault = 'soft'")
-- vim.g.pencil#wrapModeDefault = 'soft'   --- default is 'hard'
vim.cmd(
  [[augroup pencil
    autocmd!
    autocmd FileType markdown,mkd      call pencil#init()
    autocmd FileType text,tex,plaintex call pencil#init()
    augroup END]]
)

-- UltiSnips
vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<c-k>"
vim.g.UltiSnipsJumpBackwardTrigger="<c-j>"


require('setup')

require('lsp')

vim.cmd("colorscheme gruvbox-material")

vim.keymap.set("i", "<Tab>", "pumvisible() ? <C-n> : \\<Tab>", {noremap = true, expr = true})
vim.keymap.set("i", "<S-Tab>", "pumvisible() ? <C-p> : \\<S-Tab>", {noremap = true, expr = true})

opt.completeopt='menuone,noinsert,noselect'

-- Make LLVM IR files the correct type
vim.cmd([[augroup filetype
          au! BufRead,BufNewFile *.ll set filetype=llvm
          augroup END]])
