-- Windows

local neovim = require('neovim')
local opts = {noremap = true, silent = true}

-- Window creation
neovim.keymap('n', '<C-w>h', ':vnew<CR>', opts)
neovim.keymap('n', '<C-w>j', ':below new<CR>', opts)
neovim.keymap('n', '<C-w>k', ':new<CR>', opts)
neovim.keymap('n', '<C-w>l', ':rightb vnew<CR>', opts)

-- Window closing
vim.keymap.set('n', '<C-w>x', ':q<CR>', opts)

-- Move cursor to window in a direction
local function move_window(direction)
  neovim.command('wincmd ' .. direction)
end

-- Window movement
neovim.keymap('n', '<C-h>', function() move_window('h') end, opts)
neovim.keymap('n', '<C-j>', function() move_window('j') end, opts)
neovim.keymap('n', '<C-k>', function() move_window('k') end, opts)
neovim.keymap('n', '<C-l>', function() move_window('l') end, opts)

-- Window resizing
neovim.keymap('n', '<C-Up>', ':resize +2<CR>', opts)
neovim.keymap('n', '<C-Down>', ':resize -2<CR>', opts)
neovim.keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
neovim.keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)
