-- General

-- Map <Leader> to ","
vim.g.mapleader = ','

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Use relative line numbers
vim.opt.ignorecase = true     -- Case-insensitive search
vim.opt.smartcase = true      -- Don't use 'ignorecase' option if search contains upper case characters
vim.opt.exrc = true           -- Allow per-project configuration files
vim.opt.secure = true         -- Don't load other people's per-project configs
vim.opt.visualbell = true     -- No beep on errors
vim.opt.cursorline = true     -- Highlight the line of the cursor
vim.opt.lazyredraw = true     -- Redraw only when needed
vim.opt.mouse = 'a'           -- Allow using the mouse
vim.opt.updatetime = 50       -- Faster update time
vim.opt.scrolloff = 3         -- Scroll offset
vim.opt.signcolumn = 'yes'    -- Always show the sign column

-- Set colorscheme
vim.opt.termguicolors = true
vim.cmd('silent! colorscheme onedark')

local opts = {noremap = true, silent = true}

-- Search without moving cursor
vim.keymap.set('n', '*', '*``', opts)

-- Clear search
vim.keymap.set('n', '<C-Space>', ':noh<CR>', opts)

-- Move visible lines instead of rows
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)

-- Move text up and down
vim.keymap.set('x', '<S-j>', 'xp`[V`]', opts)
vim.keymap.set('x', '<S-k>', 'xkP`[V`]', opts)

-- Yank to clipboard
vim.keymap.set('n', 'YY', '"+Y', opts)
vim.keymap.set('v', 'Y', '"+y', opts)

-- Don't cupy replaced text
vim.keymap.set('v', 'p', '"_dP', opts)

-- Clear last message when switching buffer
vim.api.nvim_create_autocmd('BufEnter', {pattern = {'*'}, command = 'echo'})

-- Remember vim state after reopening file
vim.api.nvim_create_autocmd('BufWinLeave', {pattern = '*', command = 'silent! mkview'})
vim.api.nvim_create_autocmd('BufWinEnter', {pattern = '*', command = 'silent! loadview'})
vim.cmd('set viewoptions-=curdir]')
