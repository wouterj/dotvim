return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
        },
        config = function()
            require('telescope').setup({
                defaults = {
                    path_display = {"truncate"},
                    layout_config = {
                        horizontal = { preview_width = 0.45, prompt_position = "top" },
                    }
                },
                pickers = {
                    find_files = {
                        find_command = { vim.g.fdfind_bin, "--hidden", "--exclude", ".git", "--type", "file", ".", ".", "vendor/" }
                    },
                },
            })

            require('telescope').load_extension('fzf')
            require('telescope').load_extension('ui-select')
        end,
        keys = {
            { ';', function() require('telescope.builtin').find_files() end },
            { 'gr', function() require('telescope.builtin').lsp_references() end },
            { 'gs', function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end },
            { '<Leader>gb', function() require('telescope.builtin').buffers() end },
            { '<Leader>gt', function() require('telescope.builtin').live_grep() end },
            { '<Leader>c', function() vim.lsp.buf.code_action() end },
        }
    },
}
