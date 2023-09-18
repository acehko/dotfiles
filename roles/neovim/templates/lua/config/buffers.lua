-- Buffers

local neovim = require('neovim')
local opts = {noremap = true, silent = true}

-- Buffer navigation
neovim.keymap('n', '<S-l>', ':bnext<CR>', opts)
neovim.keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Switch between two most recent buffers
neovim.keymap('n', '<Leader>,', ':b#<CR>', opts)
