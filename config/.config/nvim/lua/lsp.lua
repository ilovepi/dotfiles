local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', '<leader>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>q',  '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gd',         '<cmd>Lspsaga goto_definition<CR>', opts)
  buf_set_keymap('n', '[e',         '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', ']e',         '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', 'K',          '<cmd>Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<leader>r',  '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<leader>f',  '<cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', '<leader>e',  '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>gd', '<cmd>Lspsaga peek_definition<CR>', opts)
  buf_set_keymap('n', '<leader>la', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('v', '<leader>la', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('n', '<leader>lo', '<cmd>Lspsaga outline<CR>', opts)
  -- Call hierarchy
  buf_set_keymap("n", "<Leader>ci", '<cmd>Lspsaga incoming_calls<CR>', opts)
  buf_set_keymap("n", "<Leader>co", '<cmd>Lspsaga outgoing_calls<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  buf_set_keymap("v", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=darkred guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=darkred guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=darkred guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true;

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd" }
}

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach, capabilities = capabilities
}

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
}


--vim.lsp.set_log_level("debug")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = false,
        update_in_insert = true,
    }
    )

--
--
--
--

--vim.fn.sign_define("LspDiagnosticsSignError", {text = "ﮊ", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignError",
    { text = ">>", numhl = "LspDiagnosticsDefaultSignError", texthl = "LspDiagnosticsDefaultSignError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultSignWarning" })
--vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "!!", numhl = "LspDiagnosticsDefaultSignWarning", texthl = "LspDiagnosticsDefaultSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
    { text = "", numhl = "LspDiagnosticsDefaultSignInformation", texthl = "LspDiagnosticsDefaultSignInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint",
    { text = "=>", numhl = "LspDiagnosticsDefaultSignHint", texthl = "LspDiagnosticsDefaultSignHint", gui = "bold" })


require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "dockerfile",
        "dot",
        "go",
        "html",
        "javascript",
        "json",
        "latex",
        "llvm",
        "lua",
        "make",
        "markdown",
        "ninja",
        "python",
        "rst",
        "rust",
        "toml",
        "vim",
        "yaml",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,
    },
}

require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require("luasnip")
local cmp = require 'cmp'

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    view = 'native',
    snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable( -1) then
            luasnip.jump( -1)
          else
            fallback()
          end
        end, { "i", "s" }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'omni' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    completion = { autocomplete = false },
    sources = cmp.config.sources({
        { name = 'path' }
        }, {
        { name = 'cmdline' }
    })
})
