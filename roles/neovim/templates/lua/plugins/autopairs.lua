-- Autopairs plugin config

local autopairs = require('nvim-autopairs')
require 'nvim-autopairs.completion.cmp'

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string', 'source'},
    javascript = {'string', 'template_string'},
    java = false
  },
  disable_filetype = {'TelescopePrompt'},
  fast_wrap = {
    map = '<C-f>',
    chars = {'{', '[', '(', '"', "'"},
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr'
  }
})
