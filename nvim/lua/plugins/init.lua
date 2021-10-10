return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
       -- 'morhetz/gruvbox',
       -- 'arcticicestudio/nord-vim',
       'EdenEast/nightfox.nvim',
       -- 'marko-cerovac/material.nvim',
       config = function()
           require 'plugins/colorscheme'
        end
    }

    -- Nerdtree syntax highlight
    use 'tiagofumo/vim-nerdtree-syntax-highlight'

    -- Vim devicons
    use 'ryanoasis/vim-devicons'

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
          require 'plugins/treesitter'
        end
    }

    -- Undotree
    use {
        'mbbill/undotree',
        config = function()
          require 'plugins/undotree'
        end
    }

    -- Nerdtree
    use {
        'preservim/nerdtree',
        config = function()
          require 'plugins/nerdtree'
        end

    }

    -- FZF
    use {
      '/usr/local/opt/fzf',
      'junegunn/fzf.vim',
        config = function()
          require 'plugins/fzf'
        end
    }

    -- Fugitive
    use {
        'tpope/vim-fugitive',
        config = function()
          require 'plugins/fugitive'
        end
    }

    -- ALE
    use {
      'dense-analysis/ale',
        config = function()
          require 'plugins/ale'
        end
    }

    -- Coc.nvim
    use {
      'neoclide/coc.nvim',
      branch = 'release',
        config = function()
          require 'plugins/coc'
        end
    }

    -- Emmet
    use {
        'mattn/emmet-vim',
        config = function()
          require 'plugins/emmet'
        end
    }

    -- Auto pairs
    use 'jiangmiao/auto-pairs'

    -- Surround
    use 'tpope/vim-surround'

    -- Nerdcommenter
    use {
        'preservim/nerdcommenter',
        config = function()
          require 'plugins/nerdcommenter'
        end
    }

    -- Canva dprint
    use 'Canva/dprint-vim-plugin'
end)
