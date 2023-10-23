-- Plugins

-- Stop if packer is not found
local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

-- Open packer in a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float()
    end
  }
})

-- Plugins list
packer.startup(function(use)
  -- Manage itself
  use({'wbthomason/packer.nvim', commit = '1d0cf98'})

  -- Dependencies
  use({'nvim-lua/plenary.nvim', tag = 'v0.1.3'})

  -- General
  use({'tpope/vim-surround', commit = '3d188ed'})
  use({'tpope/vim-repeat', commit = '24afe92'})
  use({'windwp/nvim-autopairs', commit = 'defad64'})
  use({'junegunn/fzf', commit = 'd2b852f'})
  use({'junegunn/fzf.vim', commit = '678ee1a'})
  use({'Yggdroot/indentLine', tag = 'v2.0'})
  use({'tpope/vim-vinegar', commit = 'bb1bcdd'})

  -- Git
  use({'tpope/vim-fugitive', commit = '43f18ab'})
  use({'lewis6991/gitsigns.nvim', commit = '907ae86'})

  -- Colorschemes
  use({'joshdick/onedark.vim', commit = '57b7774'})

  -- LSP
  use({'neovim/nvim-lspconfig', commit = '3817092'})
  use({'williamboman/mason.nvim', commit = 'd66c60e', run = ':MasonUpdate'})
  use({'williamboman/mason-lspconfig.nvim', commit = 'e270506'})

  -- Completion
  use({'hrsh7th/nvim-cmp', commit = 'fc0f694'})
  use({'hrsh7th/cmp-buffer', commit = '3022dbc'})
  use({'hrsh7th/cmp-path', commit = '91ff86c'})
  use({'hrsh7th/cmp-nvim-lsp', commit = '0e6b2ed'})
  use({'L3MON4D3/LuaSnip', commit = 'ea7d7ea'})

  -- Languages
  use({'tpope/vim-endwise', commit = 'e714ac3', ft = {'lua', 'ruby'}})
  use({'kchmck/vim-coffee-script', commit = '2842125'})
  use({'tpope/vim-rails', commit = '2b8c4fc', ft = 'ruby'})
  use({'tpope/vim-commentary', commit = 'e87cd90'})
end)

-- Plugin configs
require('plugins.autopairs')
require('plugins.indentline')
require('plugins.fzf')
require('plugins.gitsigns')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.lsp')
require('plugins.commentary')