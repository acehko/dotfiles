local neovim = require('neovim')
local tree = require('nvim-tree')

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return {desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom mappings
  vim.keymap.set('n', '<Space>', api.node.open.edit, opts('Open Space'))
  vim.keymap.set('n', '<Esc>', api.tree.close, opts('Close Esc'))
end

tree.setup({
  disable_netrw = true,
  view = {
    width = 40
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  update_focused_file = {
    enable = true
  },
  renderer = {
    icons = {
      git_placement = 'after',
      glyphs = {
        git = {
          unstaged = '~',
          staged = '',
          unmerged = '',
          renamed = '',
          untracked = '+',
          deleted = '',
          ignored = ''
        }
      }
    }
  },
  on_attach = on_attach
})

neovim.keymap('n', '<C-b>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Automatically close if it is the only window left
neovim.autocmd('QuitPre', {command = 'NvimTreeClose'})
