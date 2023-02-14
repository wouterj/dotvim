-- TODO find the motivation to rewrite this custom code in lua
vim.cmd([[
try
    function! ChangeBackground(bg)
        if a:bg == "dark"
            set background=dark
            colorscheme nord
        else
            set background=light
            colorscheme nord
        endif
    endfunction

    let s:bg = readfile($HOME . "/.local/share/nvim/.vimbg")[0]
    if s:bg == "dark"
        call ChangeBackground("dark")
    else
        call ChangeBackground("light")
    endif

    function! ToggleBackground()
        let l:bg = readfile($HOME . "/.local/share/nvim/.vimbg")[0]

        if l:bg == "dark"
            call ChangeBackground("light")
            call writefile(["light"], $HOME . "/.local/share/nvim/.vimbg")
        else
            call ChangeBackground("dark")
            call writefile(["dark"], $HOME . "/.local/share/nvim/.vimbg")
        endif
    endfunction
    map <Leader>b :call ToggleBackground()<CR>
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry
]])
