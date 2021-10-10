local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

return require('packer').startup(function()
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
    }

    -- Undotree
    use 'mbbill/undotree'

    -- Nerdtree
    use 'preservim/nerdtree'

    -- FZF
    use {
      '/usr/local/opt/fzf',
      'junegunn/fzf',
      'junegunn/fzf.vim'
    }

    -- Fugitive
    use 'tpope/vim-fugitive'

    -- ALE
    use {
      'dense-analysis/ale'
    }

    -- Coc.nvim
    use {
      'neoclide/coc.nvim',
      branch = 'release'
    }

    -- Emmet
    use { 'mattn/emmet-vim' }

    -- Auto pairs
    use 'jiangmiao/auto-pairs'

    -- Surround
    use 'tpope/vim-surround'

    -- Nerdcommenter
    use { 'preservim/nerdcommenter' }

    -- Canva dprint
    use 'Canva/dprint-vim-plugin'
end)
