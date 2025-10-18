return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local cmp = require 'cmp'
            local lspkind = require 'lspkind'
            local has_words_before = function()
              local line, col = unpack(vim.api.nvim_win_get_cursor(0))
              return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            vim.o.updatetime = 500
            vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
                callback = function()
                    cmp.complete()
                end,
            })

            cmp.setup {
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        preselect = cmp.PreselectMode.None,
                    },
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end,
                    ['<S-Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end,
                },
                sources = {
                    -- { name = 'minuet' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'ultisnips' },
                },
                performance = {
                    -- It is recommended to increase the timeout duration due to
                    -- the typically slower response speed of LLMs compared to
                    -- other completion sources. This is not needed when you only
                    -- need manual completion.
                    fetching_timeout = 2000,
                },
                formatting = {
                    format = lspkind.cmp_format({
                        -- mode = 'symbol',
                        maxwidth = 50
                    })
                }
            }

            cmp.setup.filetype({ 'markdown', 'help', 'rst' }, {
                sources = {
                    { name = 'path' }
                }
            })
        end
    }
}
