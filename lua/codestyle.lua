-- TODO autocmd is added to Nvim 0.7 lua
vim.cmd([[
au BufRead,BufNewFile *.md setlocal textwidth=72
au BufRead,BufNewFile *.rst setlocal textwidth=75
]])
