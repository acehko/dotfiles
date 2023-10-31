-- Windows

local opts = {noremap = true, silent = true}

-- Window creation
vim.keymap.set('n', '<C-w>h', ':vnew<CR>', opts)
vim.keymap.set('n', '<C-w>j', ':below new<CR>', opts)
vim.keymap.set('n', '<C-w>k', ':new<CR>', opts)
vim.keymap.set('n', '<C-w>l', ':rightb vnew<CR>', opts)

-- Window closing
vim.keymap.set('n', '<C-w>x', ':q<CR>', opts)

-- Move cursor to window in a direction
local function move_window(direction)
  vim.cmd('wincmd ' .. direction)
end

-- Window movement
vim.keymap.set('n', '<C-h>', function() move_window('h') end, opts)
vim.keymap.set('n', '<C-j>', function() move_window('j') end, opts)
vim.keymap.set('n', '<C-k>', function() move_window('k') end, opts)
vim.keymap.set('n', '<C-l>', function() move_window('l') end, opts)

-- Window resizing
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
