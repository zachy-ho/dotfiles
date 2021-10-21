vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost $NVIM_HOME/lua/zachyho/plugins/init.lua source $NVIM_HOME/resource-nvim.lua | PackerCompile
augroup end
]])

-- NOTE: individual plugin files have to be resourced by themselves for changes to take place
return require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    use {
        -- 'morhetz/gruvbox',
        -- 'arcticicestudio/nord-vim',
        'EdenEast/nightfox.nvim',
        -- 'marko-cerovac/material.nvim',
    }

    -- Nerdtree syntax highlight
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Vim devicons
    use 'ryanoasis/vim-devicons'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- Native-lsp
    use {
        'neovim/nvim-lspconfig'
    }

    -- Cmp
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua'
    }

    -- Vsnip
    use {
        'hrsh7th/vim-vsnip'
    }

    -- Undotree
    use {
        'mbbill/undotree',
    }

    -- Nerdtree
    use {
        'preservim/nerdtree',
    }

    -- FZF
    use {
        '/usr/local/opt/fzf',
        'junegunn/fzf',
        'junegunn/fzf.vim',
    }

    -- Fugitive
    use {
        'tpope/vim-fugitive',
    }

    -- ALE
    -- use {
        -- 'dense-analysis/ale',
    -- }

    -- Coc.nvim
    -- use {
        -- 'neoclide/coc.nvim',
        -- branch = 'release',
    -- }

    -- Emmet
    use {
        'mattn/emmet-vim',
    }

    -- Auto pairs
    use 'jiangmiao/auto-pairs'

    -- Surround
    use 'tpope/vim-surround'

    -- Nerdcommenter
    use {
        'preservim/nerdcommenter',
    }

    -- Startify
    use {
        'mhinz/vim-startify',
    }

    -- Auto Session
    use {
        'rmagatti/auto-session',
    }

    -- Canva dprint
    use 'Canva/dprint-vim-plugin'
end)
