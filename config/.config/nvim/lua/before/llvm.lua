--- Make LLVM IR files the correct type
vim.cmd([[augroup filetype
          au! BufRead,BufNewFile *.ll set filetype=llvm
          augroup END]])
--- Make MLIR files the correct type
vim.cmd([[augroup filetype
          au! BufRead,BufNewFile *.mlir set filetype=mlir
          augroup END]])
--- Support objdump syntax in .lst files
vim.cmd([[augroup filetype
          au! BufRead,BufNewFile *.lst set filetype=objdump
          augroup END]])
