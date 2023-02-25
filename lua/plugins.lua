return require('packer').startup(function()
    -----------------------------
    -- Editor plugins
    use 'wbthomason/packer.nvim'

    use {'tjdevries/express_line.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require'config.expressline' end
    }

    use {'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'config.tree' end
    }

    use {'junegunn/goyo.vim',
        requires = {'junegunn/limelight.vim'},
        ft = {'markdown', 'rst'},
        config = function() require'config.goyo' end
    }
    use {'sotte/presenting.vim', as = 'presenting',
        opt = true
    }

    use {'neovim/nvim-lspconfig',
        requires = {'weilbith/nvim-code-action-menu'},
        config = function() require'config.lsp' end
    }
    use {'hrsh7th/nvim-cmp',
        requires = {
            {'onsails/lspkind-nvim'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-nvim-lsp'}
        },
        config = function() require'config.cmp' end
    }

    use {'mfussenegger/nvim-dap',
        config = function() require'config.dap' end
    }

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-telescope/plenary.nvim'}
            
        },
        config = function() require'config.telescope' end
    }

    -----------------------------
    -- Linters
    use 'editorconfig/editorconfig-vim'

    use {'dense-analysis/ale',
        config = function() require'config.ale' end
    }

    -----------------------------
    -- Languages
    use {'chr4/nginx.vim', ft = {'nginx'} }
    use {'robbles/logstash.vim', ft = {'logstash'} }

    use {'nvim-treesitter/nvim-treesitter',
        requires = {'nvim-treesitter/playground', 'nvim-treesitter/nvim-treesitter-textobjects'},
        run = ':TSUpdate',
        config = function() require'config.treesitter' end
    }

    use {'isobit/vim-caddyfile'}

    use {'towolf/vim-helm'}
end)
