return {
    {
        'junegunn/goyo.vim',
        dependencies = { 'junegunn/limelight.vim' },
        ft = { 'markdown', 'rst' },
        config = function()
            vim.g.limelight_conceal_ctermfg = 'Gray'

            vim.cmd([[
            autocmd User GoyoEnter Limelight
            autocmd User GoyoLeave Limelight!
            autocmd User GoyoEnter set nocursorline
            autocmd User GoyoLeave set cursorline
            autocmd User GoyoEnter set noshowcmd
            autocmd User GoyoLeave set showcmd
            ]])

            -- TODO getting undefined event errors with the functions below
            -- vim.api.nvim_create_autocmd({"GoyoEnter"}, {
            --     callback = function()
            --         vim.cmd('Limelight')
            --         vim.opt_local.cursorline = false
            --         vim.opt_local.showcmd = false
            --     end
            -- })

            -- vim.api.nvim_create_autocmd({"GoyoLeave"}, {
            --     callback = function()
            --         vim.cmd('Limelight!')
            --         vim.opt_local.cursorline = true
            --         vim.opt_local.showcmd = true
            --     end
            -- })
        end
    },
}
