local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    prompt_prefix = '❯ ',
    selection_caret = '❯ ',
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<Esc>'] = actions.close,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})

telescope.load_extension('fzf')

local opts = {noremap = true, silent = true}
vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
vim.keymap.set('n', '<C-g>', builtin.live_grep, opts)
vim.keymap.set('n', '<C-\\>', builtin.buffers, opts)
vim.keymap.set('n', '<C-[>', builtin.lsp_references, opts)
