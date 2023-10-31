-- Comment plugin config

local opts = {remap = true, silent = true}

vim.keymap.set('n', '<C-_>', 'gcc', opts)
vim.keymap.set('v', '<C-_>', 'gcc', opts)
