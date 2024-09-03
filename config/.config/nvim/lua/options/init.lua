local o   = vim.o
local opt = vim.opt

--- Make sure various directories are in place...
local function init_dirs()
    local prefix = vim.env.XDG_DATA_HOME or vim.fn.expand("~/.cache")
    vim.opt.undodir = prefix .. "/nvim/.undo//"
    vim.opt.backupdir = prefix .. "/nvim/.backup//"
    vim.opt.directory = prefix .. "/nvim/.swp//"
    vim.opt.viewdir = prefix .. "/nvim/.views//"
end

init_dirs()

--- Basic Settings
o.background       = 'dark'
o.mouse            = 'a'  --- Automatically enable mouse usage
o.mousehide        = true --- Hide the mouse cursor while typing
o.clipboard        = 'unnamed,unnamedplus'

o.autochdir        = true                              --- Always switch to the current file directory
o.shortmess        = vim.o.shortmess .. 'filmnrxoOtT'  --- Abbrev. of messages (avoids 'hit enter')
o.viewoptions      = 'folds,options,cursor,unix,slash' --- Better Unix / Windows compatibility
o.virtualedit      = 'onemore'                         --- Allow for cursor beyond last character
o.history          = 1000                              --- Store a ton of history (default is 20)
o.spell            = true                              --- Spell checking on
o.hidden           = true                              --- Allow buffer switching without saving
opt.iskeyword      = opt.iskeyword - { '.' }           --- '.' is an end of word designator
opt.iskeyword      = opt.iskeyword - { '#' }           --- '#' is an end of word designator
opt.iskeyword      = opt.iskeyword - { '-' }           --- '-' is an end of word designator

vim.opt.signcolumn = 'yes:1'

---  Setting up the directories
o.backup           = true  --- Backups are nice ...
o.undofile         = true  --- So is persistent undo ...
o.undolevels       = 1000  --- Maximum number of changes that can be undone
o.undoreload       = 10000 --- Maximum number lines to save for undo on a buffer reload

--- UI
opt.cursorline     = true
opt.showmode       = false
opt.ruler          = true
opt.rulerformat    = "%30(%= \\:b%n%y%m%r%w\\ %l,%c%V\\ %P%)"
opt.showcmd        = false
opt.colorcolumn    = '80' --- Puts a visual marker at the desired line width
opt.backspace      = 'indent,eol,start' --- Backspace for dummies
opt.linespace      = 0 --- No extra spaces between rows
opt.number         = true --- Line numbers on
opt.relativenumber = true --- Line numbers on
opt.showmatch      = true --- Show matching brackets/parenthesis
opt.incsearch      = true --- Find as you type search
opt.inccommand     = "split" --- show the command as you type!
opt.hlsearch       = true --- Highlight search terms
opt.winminheight   = 0 --- Windows can be 0 line high
opt.ignorecase     = true --- Case insensitive search
opt.smartcase      = true --- Case sensitive when uc present
opt.wildmenu       = true --- Show list instead of just completing
opt.wildmode       = "list:longest,full" --- Command <Tab> completion, list matches, then longest common part, then all.
opt.whichwrap      = "b,s,h,l,<,>,[,]" --- Backspace and cursor keys wrap too
opt.scrolljump     = 5 --- Lines to scroll when cursor leaves screen
opt.scrolloff      = 3 --- Minimum lines to keep above and below cursor
opt.foldenable     = true --- Auto fold code
opt.list           = true
opt.listchars      = 'tab:›\\ ,trail:•,extends:#,nbsp:.' --- Highlight problematic whitespace

--- formatting
opt.wrap           = false --- Do not wrap long lines
opt.autoindent     = true  --- Indent at the same level of the previous line
opt.expandtab      = true  --- Tabs are spaces, not tabs
opt.joinspaces     = false --- Prevents inserting two spaces after punctuation on a join (J)
opt.splitright     = true  --- Puts new vsplit windows to the right of the current
opt.splitbelow     = true  --- Puts new split windows to the bottom of the current
opt.shiftwidth     = 4     --- Use indents of 4 spaces
opt.tabstop        = 4     --- An indentation every four columns
opt.softtabstop    = 4     --- Let backspace delete indent

-- Only use real colors form now on. It's not 2005...
opt.termguicolors  = true

opt.completeopt    = 'menuone,noinsert,noselect'
