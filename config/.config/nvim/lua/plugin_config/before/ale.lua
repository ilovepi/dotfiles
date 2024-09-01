-- Ale
vim.g.ale_linters_explicit = 1
vim.g.ale_disable_lsp = 1
vim.g.ale_linters = {
    ['c'] = { 'clangtidy', 'clangcheck', 'flawfinder' },
    ['cpp'] = { 'clangtidy', 'clangcheck', 'flawfinder' },
    ['latex'] = { 'chktex', 'lacheck', 'proselint', 'vale', 'write-good' },
}


