-- Make LLVM IR files the correct type
vim.cmd([[augroup filetype
          au! BufRead,BufNewFile *.ll set filetype=llvm
          augroup END]])
-- Make MLIR files the correct type
vim.cmd([[augroup filetype
          au! BufRead,BufNewFile *.mlir set filetype=mlir
          augroup END]])

