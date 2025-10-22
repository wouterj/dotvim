return {
    {
        'aznhe21/actions-preview.nvim',
        keys = {
            { '<Leader>c', function() require("actions-preview").code_actions() end },
        }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'j-hui/fidget.nvim',
        },
        config = function()
            local lspconfig = require'lspconfig'

            vim.diagnostic.config({
              virtual_text = false,
              signs = true,
              underline = true,
              update_in_insert = false,
              severity_sort = false,
            })

            local on_attach = function(client)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(0, ...) end
                local opts = { noremap=true, silent=true }
                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
                buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
                buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

                -- Use LSP as the handler for omnifunc.
                vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            end

            vim.api.nvim_create_autocmd("CursorHold", {
              callback = function()
                vim.diagnostic.open_float({
                  border = 'none',
                  prefix = ' ',
                  scope = 'cursor',
                  header = '',
                })
              end
            })

            vim.lsp.config('phpactor', {
                init_options = {
                    ["language_server_completion.trim_leading_dollar"] = true,
                },
                cmd = { 'php', '-d', '\'error_reporting=E_ALL&~E_DEPRECATED\'', vim.g.phpactor_bin, 'language-server', '-vvv' },
                on_attach = on_attach
            })
            vim.lsp.enable('phpactor')

            vim.lsp.config('yamlls', {
                settings = {
                    yaml = {
                        format = {
                            enabled = false
                        },
                        schemas = {
                            kubernetes =  { '*flux/**/*.yaml' },
                            ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = { '.gitlab/ci/*.yaml', '.gitlab/ci/*.yml' }
                        }
                    }
                }
            });
            vim.lsp.enable('yamlls')

            --lspconfig.ansiblels.setup{
            --    root_dir=lspconfig.util.find_git_ancestor,
            --    init_options = {
            --        ["ansible.ansible.useFullyQualifiedCollectionNames"] = true,
            --    }
            --}

            --lspconfig.ts_ls.setup{
            --    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" }
            --}

            --lspconfig.ccls.setup {
            --  init_options = {
            --    cache = {
            --      directory = ".ccls-cache";
            --    };
            --  }
            --}

            --lspconfig.pylsp.setup{}

            require'fidget'.setup{}
        end
    }
}
