local subscribe = require('el.subscribe')
local extensions = require('el.extensions')
local sections = require('el.sections')
local generator = function(window, buffer)
    if buffer.filetype ~= "NvimTree" then
        return {
            extensions.gen_mode({ format_string = " %s " }),
            sections.highlight('StatusLineError', '%r '),
            '%f %m',
            sections.split,
            sections.highlight("StatusLineBranch", '%y '),
            sections.highlight("StatusLineBranch", subscribe.buf_autocmd(
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

require('el').setup({generator = generator})
