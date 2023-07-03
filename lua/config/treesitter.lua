require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,

--   indent = {
--       enable = true
--   },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {
            "php", -- needed for the cursor to be properly indented on new lines
            "helm"
        },
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "gnr",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },

    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["am"] = "@function.outer",
                ["im"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            }
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
            },
        },
    }
}

vim.api.nvim_set_keymap('', '<c-t>', ':TSHighlightCapturesUnderCursor<CR>', {noremap = true, silent = true})
