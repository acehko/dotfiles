-- Helper functions

local neovim = {}

-- Set global variable
function neovim.gvar(name, value)
  vim.g[name] = value
end

-- Set buffer variable
function neovim.bvar(name, value)
  vim.b[name] = value
end

-- Set vim option
function neovim.option(name, value)
  vim.opt[name] = value
end

-- Set vim keymap
function neovim.keymap(...)
  vim.keymap.set(...)
end

-- Set autocommand
function neovim.autocmd(...)
  vim.api.nvim_create_autocmd(...)
end

-- Execute a vim command
function neovim.command(...)
  vim.cmd(...)
end

-- Create a user command
function neovim.user_command(...)
  vim.api.nvim_create_user_command(...)
end

-- Add new filetype mapping
function neovim.filetype(...)
  vim.filetype.add(...)
end

-- Link highlight group
function neovim.highlight_link(group, link_group)
  vim.api.nvim_set_hl(0, group, {link = link_group})
end

return neovim
