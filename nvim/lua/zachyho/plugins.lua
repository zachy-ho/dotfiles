vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost $NVIM_HOME/lua/zachyho/plugins/init.lua source $NVIM_HOME/resource-nvim.lua | PackerCompile
augroup end
]])

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

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- Native-lsp
    use 'neovim/nvim-lspconfig'

    -- Nvim devicons (can't be fucked configuring this cos it doesn't work for me yet)
    -- use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Trouble (doesn't work for some reason??)
    -- use {
      -- "folke/trouble.nvim",
      -- -- requires = "kyazdani42/nvim-web-devicons",
      -- config = function()
        -- require("trouble").setup {
          -- -- your configuration comes here
          -- -- or leave it empty to use the default settings
          -- -- refer to the configuration section below
        -- }
      -- end
    -- }

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
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ'
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

    -- Fugitive
    use 'tpope/vim-fugitive'

    -- Emmet
    use {
        'mattn/emmet-vim',
        setup = function()
            vim.g.user_emmet_install_global = 0
            vim.g.user_emmet_leader_key = '<C-z>'
            vim.cmd([[
                autocmd FileType html,css EmmetInstall
            ]])
        end
    }

    -- Auto pairs
    use 'jiangmiao/auto-pairs'

    -- Surround
    use 'tpope/vim-surround'

    -- Nerdcommenter
    use 'preservim/nerdcommenter'

    -- Startify
    use 'mhinz/vim-startify'

    -- Auto Session
    use 'rmagatti/auto-session'

    -- Canva dprint
    use 'Canva/dprint-vim-plugin'
end)
