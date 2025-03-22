return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            require('dap').adapters.php = {
                type = 'executable',
                command = 'node',
                args = { '/opt/vscode-php-debug/out/phpDebug.js' }
            }

            require('dap').configurations.php = {
                {
                    type = 'php',
                    request = 'launch',
                    name = 'Listen for Xdebug',
                    port = 9003
                }
            }

            vim.fn.sign_define('DapBreakpoint', {text='B', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl=''})
        end,
        keys = {
            {'<F5>', function() require('dap').continue() end},
            {'<F10>', function() require('dap').step_over() end},
            {'<F11>', function() require('dap').step_into() end},
            {'<F12>', function() require('dap').step_out() end},

            {'<Leader>b', function() require('dap').toggle_breakpoint() end},
            {'<Leader>B', function() require('dap').set_breakpoint(vim.fn.input("Breakpoint condition: ")) end},
            {'<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end},
            {'<Leader>dr', function() require('dap').repl.open() end},

            {'<Leader>di', function()
                -- <cexpr> doesn't prefix the dollar sign, which fails using Xdebug.
                -- This function always adds it for PHP inspections.
                require('dap.ui.widgets').hover(function()
                    if vim.bo.filetype == 'php' then
                        return '$' .. vim.fn.expand('<cexpr>')
                    else
                        return vim.fn.expand('<cexpr>')
                    end
                end)
            end},
            {'<Leader>di', function() require('dap.ui.widgets').hover() end, mode = 'v'},
        }
    }
}
