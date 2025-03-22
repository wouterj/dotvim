local generator = function(window, buffer)
    local extensions = require('el.extensions')
    local sections = require('el.sections')

    if buffer.filetype ~= "NvimTree" then
        return {
            extensions.gen_mode({ format_string = " %s " }),
            sections.highlight('StatusLineError', '%r '),
            '%f %m',
            sections.split,
            sections.highlight("StatusLineBranch", '%y '),
            sections.highlight("StatusLineBranch", require('el.subscribe').buf_autocmd(
                "el_git_branch",
                "BufEnter",
                function(window, buffer)
                    local branch = extensions.git_branch(window, buffer)
                    if branch then
                        return branch
                    end
                end
            )),
            '  '
        }
    else
        return {
        }
    end
end

return {
    {
        'tjdevries/express_line.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        opts = {
            generator = generator
        }
    }
}
