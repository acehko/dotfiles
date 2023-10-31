-- Whitespace

local function trim_whitespace()
  -- Save the current cursor position
  local line = vim.fn.line('.')
  local column = vim.fn.col('.')

  -- Delete trailing whitespace
  vim.cmd("silent! execute '%s/\\s\\+$//e'")

  -- Delete empty lines at the end of file
  vim.cmd("silent! execute '%s#\\($\\n\\s*\\)\\+\\%$##'")

  -- Restore cursor position
  vim.fn.cursor(line, column)
end

-- Trim whitespace before saving a file
vim.api.nvim_create_autocmd('BufWritePre', {pattern = {'*'}, callback = trim_whitespace})
