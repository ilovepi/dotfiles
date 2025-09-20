--- Key Bindings

--- Leader Keys
vim.g.mapleader      = ' '
vim.g.maplocalleader = '_'

--- Easier moving in tabs and windows
--- The lines conflict with the default digraph mapping of <C-K>
vim.keymap.set("n", "<C-J>", "<C-W>j<C-W>", { desc = "Window: Move Down" })
vim.keymap.set("n", "<C-K>", "<C-W>k<C-W>", { desc = "Window: Move Up" })
vim.keymap.set("n", "<C-L>", "<C-W>l<C-W>", { desc = "Window: Move Right" })
vim.keymap.set("n", "<C-H>", "<C-W>h<C-W>", { desc = "Window: Move Left" })

--- Make splits equal
vim.keymap.set("n", "<leader>=", "<C-W>=", { desc = "Window: Equalize" })

--- Bufferline config
vim.keymap.set("n", "<S-H>", ":BufferLineCyclePrev<CR>", { desc = "Buffer: Previous" })
vim.keymap.set("n", "<S-L>", ":BufferLineCycleNext<CR>", { desc = "Buffer: Next" })

--- Change Working Directory to that of the current file
vim.keymap.set("c", "cwd", "lcd %:p:h")
vim.keymap.set("c", "cd.", "lcd %:p:h")

--- Make j and k work like you expect
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

--- Visual shifting (does not exit Visual mode)
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

--- Easier formatting
vim.keymap.set("n", "<leader>q", "gwip", { noremap = true, silent = true, desc = "Format: Paragraph" })

--- Toggle fold at current position.
vim.keymap.set("n", "<Tab>", "za", { noremap = true })

--- Allow using the repeat operator with a visual selection (!)
--- http://stackoverflow.com/a/8064607/127816
vim.keymap.set("v", ".", ":normal .<CR>", { noremap = true })

--- For when you forget to sudo.. Really Write the file.
--- unfortunately this doesn't work in neovim :(
--- cmap w!! w !sudo tee % >/dev/null

--- Some helpers to edit mode
--- http://vimcasts.org/e/14
vim.keymap.set("c", "%%", "<C-R>=fnameescape(expand('%:h')).'/'<CR>", { noremap = true })
vim.keymap.set("v", "ew", ":e %%")
vim.keymap.set("v", "es", ":sp %%")
vim.keymap.set("v", "ev", ":vs %%")
vim.keymap.set("v", "et", ":tabe %%")

--- Adjust viewports to the same size
vim.keymap.set("v", "<leader>=", "<C-w>=")

--- sane remap of <Esc>
-- vim.keymap.set("v", "jk", "<Esc>=")

--- Disable fzf in terminal
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

--- Stupid shift key fixes
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

--- Yank from the cursor to the end of the line, to be consistent with C and D.
vim.keymap.set("n", "Y", "y$")

--- Use menus w/ Tab and Shift-Tab
vim.keymap.set("i", "<Tab>", "pumvisible() ? <C-n> : \\<Tab>", { noremap = true, expr = true })
vim.keymap.set("i", "<S-Tab>", "pumvisible() ? <C-p> : \\<S-Tab>", { noremap = true, expr = true })
