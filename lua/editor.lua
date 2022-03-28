local o = vim.o

o.termguicolors = true
o.background = 'dark'

o.relativenumber = true
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

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevel = 1
o.foldminlines = 5
