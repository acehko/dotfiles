-- Whitespace

local neovim = require('neovim')

local function trim_whitespace()
  -- Save the current cursor position
  local line = vim.fn.line('.')
  local column = vim.fn.col('.')

  -- Delete trailing whitespace
  neovim.command("silent! execute '%s/\\s\\+$//e'")

  -- Delete empty lines at the end of file
  neovim.command("silent! execute '%s#\\($\\n\\s*\\)\\+\\%$##'")

  -- Restore cursor position
  vim.fn.cursor(line, column)
end

-- Trim whitespace before saving a file
neovim.autocmd('BufWritePre', {pattern = {'*'}, callback = trim_whitespace})
