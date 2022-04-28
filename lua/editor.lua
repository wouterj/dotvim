local o = vim.o

o.termguicolors = true
o.background = 'dark'

o.number = true
vim.cmd([[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
]])

o.scrolloff = 5
o.wrap = false

o.cursorline = true
o.showcmd = true
o.lazyredraw = true
o.wildmenu = true

o.autoindent = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
vim.cmd('filetype indent on')

o.showmatch = true
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

vim.g.php_folding = 1
o.foldmethod = 'syntax'
o.foldlevel = 1
o.foldminlines = 5
