vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost $NVIM_HOME/lua/zachyho/plugins/init.lua source <afile> | PackerSync
augroup end
]])

return require('packer').startup({ function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    use {
        -- 'morhetz/gruvbox',
        -- 'arcticicestudio/nord-vim',
        'EdenEast/nightfox.nvim',
        -- 'marko-cerovac/material.nvim',
    }

    -- Hexokinase
    use {
        'RRethy/vim-hexokinase',
        run = 'make hexokinase'
    }

    -- Nerdtree syntax highlight
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Popup
    use 'nvim-lua/popup.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- Plenary
    use 'nvim-lua/plenary.nvim'

    -- Native-lsp
    use 'neovim/nvim-lspconfig'

    -- Nvim devicons (can't be fucked configuring this cos it doesn't work for me yet)
    -- use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Cmp
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua'
    }

    -- Vsnip and snippets
    use {
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
        'rafamadriz/friendly-snippets'
    }

    -- Undotree
    use 'mbbill/undotree'

    -- Nerdtree
    use 'preservim/nerdtree'

    -- FZF
    use {
        '/usr/local/opt/fzf',
        'junegunn/fzf',
        'junegunn/fzf.vim',
    }

    -- Grepper (until I find a way to do this with FZF.vim's Rg)
    use 'mhinz/vim-grepper'

    -- Fugitive
    use 'tpope/vim-fugitive'

    -- Emmet
    use {
        'mattn/emmet-vim',
        setup = function()
            vim.g.user_emmet_install_global = 0
            vim.g.user_emmet_leader_key = '<C-s>'
            vim.cmd([[
                autocmd FileType html,css,typescriptreact,javascriptreact,typescript,javascript EmmetInstall
            ]])
        end,
    }

    -- Auto pairs
    use 'windwp/nvim-autopairs'

    -- Surround
    use 'tpope/vim-surround'

    -- Easy align
    use 'junegunn/vim-easy-align'

    -- Nerdcommenter
    use 'preservim/nerdcommenter'

    -- Auto Session
    use 'rmagatti/auto-session'

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Org mode
    use {
        'kristijanhusak/orgmode.nvim',
        branch = 'tree-sitter',
        requires = 'nvim-treesitter/nvim-treesitter'
    }

    -- Orgmode-stuff
    use 'akinsho/org-bullets.nvim'
    use 'lukas-reineke/headlines.nvim'

    -- Markdown-preview
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install'
    }

    -- Canva dprint
    use 'Canva/dprint-vim-plugin'
end,
config = {
    display = {
        open_fn = require('packer.util').float
        }
}})
