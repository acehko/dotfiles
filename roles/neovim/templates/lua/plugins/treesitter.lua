-- Treesitter plugin

local configs = require('nvim-treesitter.configs')

configs.setup({
  ensure_installed = 'all',
  sync_installed = false,
  autopairs = {
    enable = true
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {enable = true},
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },
  commentary_integration = {
    Commentary = 'g/',
    CommentaryLine = false
  },
  endwise = {
    enable = true
  }
})
