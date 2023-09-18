-- Comment plugin config

local neovim = require('neovim')
local opts = {remap = true, silent = true}

neovim.keymap('n', '<C-/>', 'gcc', opts)
neovim.keymap('v', '<C-/>', 'gcc', opts)
