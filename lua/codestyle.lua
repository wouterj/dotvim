vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.md", "*.rst", "*.rst.inc"},
    callback = function()
        vim.opt_local.textwidth = 75
    end
})
