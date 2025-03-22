local map = vim.api.nvim_set_keymap
local silentnoremap = {noremap = true, silent = true}

vim.g.mapleader = " "
map('', '<Leader>y', '"+y', silentnoremap)
map('', '<Leader>p', '"+p', silentnoremap)

map('n', ',', ':noh<CR>', silentnoremap)

map('', '<c-k>', ':exe "resize " . (winheight(0) * 7/6)<CR>', silentnoremap)
map('', '<c-j>', ':exe "resize " . (winheight(0) * 5/6)<CR>', silentnoremap)
map('', '<c-h>', ':exe "vertical resize " . (winwidth(0) * 7/6)<CR>', silentnoremap)
map('', '<c-l>', ':exe "vertical resize " . (winwidth(0) * 5/6)<CR>', silentnoremap)
