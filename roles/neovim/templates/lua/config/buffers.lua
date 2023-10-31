-- Buffers

local opts = {noremap = true, silent = true}

-- Buffer navigation
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts)

-- Switch between two most recent buffers
vim.keymap.set('n', '<Leader>,', ':b#<CR>', opts)
