-- This doesn't really work lmao
vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost $NVIM_HOME/lua/zachyho/plugins/init.lua source <afile> | PackerSync
augroup end
]])

-- Please write this file and run ':PackerSync' after to sync shit up every time a change is made
return require('packer').startup({ function(use)

    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Vimwiki
    use {
        'vimwiki/vimwiki',
        branch = 'dev',
        config = function()
          require('zachyho.vimwiki')
        end
    }

    -- Color schemes
    use {
        -- I don't really wanna use these anymore, might delete soon
        'morhetz/gruvbox',
        'arcticicestudio/nord-vim',

        -- Getting old
        'EdenEast/nightfox.nvim',
        'marko-cerovac/material.nvim',

        -- Currently liking
        {
            'rose-pine/neovim',
            as = 'rose-pine'
        },
        'sainnhe/sonokai'
    }

    -- Lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Hexokinase: Previews color whenever color (e.g. hex) is used
    use {
        'RRethy/vim-hexokinase',
        run = 'make hexokinase'
    }

    -- Nerdtree-syntax-highlight: To identify filetypes in Nerdtree
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Lspkind: Cute logos for LSP
    use 'onsails/lspkind-nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Treesitter: Just for syntax highlighting only for now
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    -- Plenary: Needed for one of the plugins below I don't remember which
    use 'nvim-lua/plenary.nvim'

    -- Native-lsp: Neovim native Language Server Protocols
    use 'neovim/nvim-lspconfig'

    -- Vim devicons: Gives me pretty icons in Nerdtree
    use 'ryanoasis/vim-devicons'

    -- Cmp: Completion engine
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua'
    }

    -- Vsnip and snippets: Snippets for fast coding
    -- use {
        -- 'hrsh7th/vim-vsnip',
        -- 'hrsh7th/vim-vsnip-integ',
        -- 'rafamadriz/friendly-snippets'
    -- }

    -- Undotree: Undo and redo
    use 'mbbill/undotree'

    -- Nerdtree: Tree-style navigator
    use 'preservim/nerdtree'

    -- FZF: Fuzzy finder
    use {
        '/usr/local/opt/fzf',
        'junegunn/fzf',
        'junegunn/fzf.vim',
    }

    -- Grepper: Makes grepping shit and putting them in quickfix lists so easy
    use 'mhinz/vim-grepper'

    -- Fugitive: Git operations within vim
    use 'tpope/vim-fugitive'

    -- Emmet: HTML templating?
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

    -- Autopairs: For pairs like '', "", (), {}, []
    use 'windwp/nvim-autopairs'

    -- Surround: Whenever I want to surround something with pairs
    use 'tpope/vim-surround'

    -- Easy align: Aligning things to look pretty
    use 'junegunn/vim-easy-align'

    -- Nerdcommenter: Commenting shortcuts
    use 'preservim/nerdcommenter'

    -- Startify: Cool start screen and session saving
    use {
        'mhinz/vim-startify',
        cmd = { 'SLoad', 'SSave' }
    }

    -- Harpoon: File marking to jump back and forth more quickly
    use 'ThePrimeagen/harpoon'

    -- Git worktree
    use {
        'ThePrimeagen/git-worktree.nvim',
        requires = 'nvim-telescope/telescope.nvim',
    }

    -- Headlines highlighting
    use 'lukas-reineke/headlines.nvim'

    -- Markdown-preview: self-explanatory
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install'
    }

    -- Prettier
    use 'prettier/vim-prettier'
end,
config = {
    display = {
        open_fn = require('packer.util').float
        }
}})
