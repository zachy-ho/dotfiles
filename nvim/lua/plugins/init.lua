local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


return require('packer').startup(function(use)
    use {
       'morhetz/gruvbox',
       'arcticicestudio/nord-vim',
       'EdenEast/nightfox.nvim',
       'marko-cerovac/material.nvim',
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
          require 'treesitter'
        end
    }

    -- Undotree
    use {
        'mbbill/undotree',
        config = function()
          require 'undotree'
        end
    }

    -- Nerdtree
    use {
        'preservim/nerdtree',
        config = function()
          require 'nerdtree'
        end

    }

    -- FZF
    use {
      '/usr/local/opt/fzf',
      'junegunn/fzf',
      'junegunn/fzf.vim',
        config = function()
          require 'fzf'
        end
    }

    -- Fugitive
    use {
        'tpope/vim-fugitive',
        config = function()
          require 'fugitive'
        end
    }

    -- ALE
    use {
      'dense-analysis/ale',
        config = function()
          require 'ale'
        end
    }

    -- Coc.nvim
    use {
      'neoclide/coc.nvim',
      branch = 'release',
        config = function()
          require 'coc'
        end
    }

    -- Emmet
    use {
        'mattn/emmet-vim',
        config = function()
          require 'emmet'
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
          require 'nerdcommenter'
        end
    }

    -- Canva dprint
    use 'Canva/dprint-vim-plugin'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
