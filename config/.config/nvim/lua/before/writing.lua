-- Writing
vim.g.tex_flavor = "latex"
vim.cmd("let g:pencil#wrapModeDefault = 'soft'")
vim.cmd(
    [[augroup pencil
    autocmd!
    autocmd FileType markdown,mkd      call pencil#init()
    autocmd FileType text,tex,plaintex call pencil#init()
    augroup END]]
)

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
