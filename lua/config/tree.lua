vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1, folder_arrows = 0 }

require'nvim-tree'.setup {
    open_on_setup = true,
    auto_close = true,
    git = { enable = false }
}

vim.api.nvim_set_keymap('', '<Leader>n', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

-- auto close if nvim-tree is the only remaining buffer
-- TODO autocmd is added to Nvim 0.7 lua
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
