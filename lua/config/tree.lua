require'nvim-tree'.setup {
    git = { enable = false },
    renderer = {
        root_folder_modifier = ":t",
        add_trailing = true,
        group_empty = true,
        special_files = {},
        icons = {
            show = { folder_arrow = false }
        }
    }
}

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.api.nvim_set_keymap('', '<Leader>n', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
