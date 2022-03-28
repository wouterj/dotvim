local lspconfig = require'lspconfig'

-- Disable Diagnostcs globally
vim.diagnostic.config({virtual_text = false})

lspconfig.intelephense.setup{
    on_attach = function(client)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
        buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        -- Use LSP as the handler for omnifunc.
        --    See `:help omnifunc` and `:help ins-completion` for more information.
        vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- For plugins with an `on_attach` callback, call them here. For example:
        -- require('completion').on_attach()
    end
}

lspconfig.ansiblels.setup{
    root_dir=lspconfig.util.find_git_ancestor
}
