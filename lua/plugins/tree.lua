local function open_nvim_tree(data)
    local no_file = data.file == "" and vim.bo[data.buf].buftype == ""

    if data.file:match('\\.git/') then
        return
    end

    require("nvim-tree.api").tree.toggle({ focus = no_file, find_file = true })
end

return {
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
        opts = {
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
        },
        init = function()
            vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

            vim.api.nvim_set_keymap('', '<Leader>n', '<Cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('', '<Leader>m', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

            vim.api.nvim_create_autocmd("BufEnter", {
              nested = true,
              callback = function()
                if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
                  vim.cmd "quit"
                end
              end
            })
        end,
    }
}
