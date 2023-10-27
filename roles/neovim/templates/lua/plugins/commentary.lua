-- Comment plugin config

local neovim = require('neovim')
local opts = {remap = true, silent = true}

neovim.keymap('n', '<C-_>', 'gcc', opts)
neovim.keymap('v', '<C-_>', 'gcc', opts)
