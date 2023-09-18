-- General

local neovim = require('neovim')

-- Map <Leader> to ","
neovim.gvar('mapleader', ',')

neovim.option('number', true)         -- Show line numbers
neovim.option('relativenumber', true) -- Use relative line numbers
neovim.option('ignorecase', true)     -- Case-insensitive search
neovim.option('smartcase', true)      -- Don't use 'ignorecase' option if search contains upper case characters
neovim.option('exrc', true)           -- Allow per-project configuration files
neovim.option('secure', true)         -- Don't load other people's per-project configs
neovim.option('visualbell', true)     -- No beep on errors
neovim.option('cursorline', true)     -- Highlight the line of the cursor
neovim.option('lazyredraw', true)     -- Redraw only when needed
neovim.option('mouse', 'a')           -- Allow using the mouse
neovim.option('updatetime', 50)       -- Faster update time
neovim.option('scrolloff', 3)         -- Scroll offset
neovim.option('signcolumn', 'yes')    -- Always show the sign column

-- Set colorscheme
neovim.command('colorscheme darkplus')

local opts = {noremap = true, silent = true}

-- Search without moving cursor
neovim.keymap('n', '*', '*``', opts)

-- Clear search
neovim.keymap('n', '<C-Space>', ':noh<CR>', opts)

-- Move visible lines instead of rows
neovim.keymap('n', 'j', 'gj', opts)
neovim.keymap('n', 'k', 'gk', opts)

-- Move text up and down
neovim.keymap('x', '<S-j>', 'xp`[V`]', opts)
neovim.keymap('x', '<S-k>', 'xkP`[V`]', opts)

-- Yank to clipboard
neovim.keymap('n', 'YY', '"+Y', opts)
neovim.keymap('v', 'Y', '"+y', opts)

-- Don't cupy replaced text
neovim.keymap('v', 'p', '"_dP', opts)

-- Clear last message when switching buffer
neovim.autocmd('BufEnter', {pattern = {'*'}, command = 'echo'})

-- Remember vim state after reopening file
neovim.autocmd('BufWinLeave', {pattern = '*', command = 'silent! mkview'})
neovim.autocmd('BufWinEnter', {pattern = '*', command = 'silent! loadview'})
