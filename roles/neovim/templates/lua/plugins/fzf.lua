-- Telescope plugin config

local neovim = require('neovim')

neovim.keymap('n', '<C-p>', ':FZF<CR>', {noremap = true, silent = true})
