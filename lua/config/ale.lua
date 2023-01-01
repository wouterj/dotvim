-- disable LSP (nvim-lspconfig is used)
vim.g.ale_disable_lsp = true
vim.g.ale_linters_ignore = {
   php = {'intelephense'}
}

vim.g.ale_echo_msg_format = '[%linter%] %type%: %s'
vim.g.ale_echo_cursor = 0
vim.g.ale_virtualtext_cursor = 0

vim.g.ale_cursor_detail = 1
vim.g.ale_floating_preview = 1
vim.g.ale_floating_window_border = {'│', '─', '╭', '╮', '╯', '╰', '│', '─'}
