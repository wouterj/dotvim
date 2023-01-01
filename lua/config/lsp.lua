local lspconfig = require'lspconfig'

vim.o.updatetime = 250
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

vim.api.nvim_set_keymap('n', '<Leader>c', '<cmd>CodeActionMenu<CR>', {noremap = true, silent = true});

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

lspconfig.phpactor.setup{
    init_options = {
        ["language_server_completion.trim_leading_dollar"] = true,
    },
    on_attach = on_attach
}
-- lspconfig.intelephense.setup{
--     on_attach = on_attach
-- }

lspconfig.ansiblels.setup{
    root_dir=lspconfig.util.find_git_ancestor,
    init_options = {
        ["ansible.ansible.useFullyQualifiedCollectionNames"] = true,
    }
}

lspconfig.tsserver.setup{
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" }
}
