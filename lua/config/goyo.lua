-- TODO autocmd is added to Nvim 0.7 lua
vim.cmd([[
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
autocmd User GoyoEnter set nocursorline
autocmd User GoyoLeave set cursorline
autocmd User GoyoEnter set noshowcmd
autocmd User GoyoLeave set showcmd
]])

vim.g.limelight_conceal_ctermfg = 'Gray'
