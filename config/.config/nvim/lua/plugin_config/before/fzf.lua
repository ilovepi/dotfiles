-- FZF
-- Customize fzf colors to match your color scheme
vim.g.fzf_colors = {
    ['fg']      = { 'fg', 'Normal' },
    ['bg']      = { 'bg', 'Normal' },
    ['hl']      = { 'fg', 'Comment' },
    ['fg+']     = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
    ['bg+']     = { 'bg', 'CursorLine', 'CursorColumn' },
    ['hl+']     = { 'fg', 'Statement' },
    ['info']    = { 'fg', 'PreProc' },
    ['border']  = { 'fg', 'Ignore' },
    ['prompt']  = { 'fg', 'Conditional' },
    ['pointer'] = { 'fg', 'Exception' },
    ['marker']  = { 'fg', 'Keyword' },
    ['spinner'] = { 'fg', 'Label' },
    ['header']  = { 'fg', 'Comment' }
}

vim.keymap.set("n", "<leader>b", "<cmd>Buffers<CR>", { noremap = true })
vim.keymap.set("n", "<leader>z", "<cmd>Files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>m", "<cmd>Maps<CR>", { noremap = true })
vim.keymap.set("n", "<leader>c", "<cmd>Colors<CR>", { noremap = true })
vim.keymap.set("n", "<leader>rg", "<cmd>Rg<CR>", { noremap = true })
