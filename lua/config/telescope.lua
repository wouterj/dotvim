require('telescope').setup({
    defaults = {
        path_display = {"truncate"},
--      horizontal = { width = 0.5, prompt_position = "top" },
    },
    pickers = {
        find_files = {
            find_command = { "fdfind", "--hidden", "--type", "file", ".", ".", "vendor/" }
        },
    },
})

require('telescope').load_extension('fzf')
vim.api.nvim_set_keymap('', ';', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'gr', [[<Cmd>lua require('telescope.builtin').lsp_references()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'gs', [[<Cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'gb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
