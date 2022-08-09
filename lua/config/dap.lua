local dap = require('dap')
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/opt/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003
    }
}

local map = vim.api.nvim_set_keymap
local silentnoremap = {noremap = true, silent = true}

map('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', silentnoremap)
map('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>', silentnoremap)
map('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>', silentnoremap)
map('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', silentnoremap)

map('n', '<Leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', silentnoremap)
map('n', '<Leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', silentnoremap)
map('n', '<Leader>lp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', silentnoremap)
map('n', '<Leader>dr', '<cmd>lua require"dap".repl.open()<CR>', silentnoremap)

-- <cexpr> doesn't prefix the dollar sign, which fails using Xdebug.
-- This function always adds it for PHP inspections.
function dap_hover_expr()
    if vim.bo.filetype == 'php' then
        return '$' .. vim.fn.expand('<cexpr>')
    else
        return vim.fn.expand('<cexpr>')
    end
end

map('n', '<Leader>di', '<cmd>lua require"dap.ui.widgets".hover(dap_hover_expr)<CR>', silentnoremap)
map('v', '<Leader>di', '<cmd>lua require"dap.ui.widgets".hover()<CR>', silentnoremap)

vim.fn.sign_define('DapBreakpoint', {text='B', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl=''})
