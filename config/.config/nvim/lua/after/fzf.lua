-- Keybindings and commands for fzf-lua

-- 1. Keybindings (Best Practice: Map directly to Lua functions)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local fzf = require('fzf-lua')

map("n", "<leader>b", function() fzf.buffers() end, { noremap = true, silent = true, desc = "FZF: Buffers" })
map("n", "<leader>z", function() fzf.files() end, { noremap = true, silent = true, desc = "FZF: Files" })
map("n", "<leader>ff", function() fzf.files() end, { noremap = true, silent = true, desc = "FZF: Files" })
map("n", "<leader>m", function() fzf.keymaps() end, { noremap = true, silent = true, desc = "FZF: Keymaps" })
map("n", "<leader>c", function() fzf.colorschemes() end, { noremap = true, silent = true, desc = "FZF: Colorschemes" })
map("n", "<leader>rg", function() fzf.live_grep() end, { noremap = true, silent = true, desc = "FZF: Live Grep" })
map("n", "z=", function() fzf.spell_suggest() end, { noremap = true, silent = true, desc = "FZF: Spelling Suggest" })

-- 2. User Commands (Corrected to handle arguments and lazy-loading)
local function create_command(name, func)
    vim.api.nvim_create_user_command(name, function(opts)
        local fzf_opts = {}
        if opts.args and #opts.args > 0 then
            fzf_opts.search = opts.args
        end
        func(fzf_opts)
    end, { nargs = '?', complete = 'file' })
end

-- General
create_command('Files', fzf.files)
create_command('Buffers', fzf.buffers)
create_command('Rg', fzf.live_grep)
create_command('History', fzf.history)
create_command('Commands', fzf.command_history)
create_command('Maps', fzf.keymaps)
create_command('Colors', fzf.colorschemes)
create_command('Help', fzf.help_tags)

-- Git (Wrapped to prevent lazy-loading errors)
create_command('GFiles', function(...) require('fzf-lua').git.files(...) end)
create_command('GStatus', function(...) require('fzf-lua').git.status(...) end)
create_command('GCommits', function(...) require('fzf-lua').git.commits(...) end)
create_command('GBranches', function(...) require('fzf-lua').git.branches(...) end)

-- LSP (Wrapped to prevent lazy-loading errors)
create_command('LspRefs', function(...) require('fzf-lua').lsp.references(...) end)
create_command('LspDefs', function(...) require('fzf-lua').lsp.definitions(...) end)
create_command('LspImpl', function(...) require('fzf-lua').lsp.implementations(...) end)
create_command('LspDiags', function(...) require('fzf-lua').diagnostics.document(...) end)
create_command('LspAllDiags', function(...) require('fzf-lua').diagnostics.workspace(...) end)
