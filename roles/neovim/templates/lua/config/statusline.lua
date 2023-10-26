-- Statusline

local neovim = require('neovim')
local devicons = require('nvim-web-devicons')

-- Hide the default mode status
neovim.option('showmode', false)

-- Mode titles
local mode_titles = {
  c = 'COMMAND',
  n = 'NORMAL',
  v = 'VISUAL',
  V = 'VISUAL',
  [''] = 'VISUAL',
  i = 'INSERT',
  t = 'TERMINAL'
}

-- Mode colors
local mode_colors = {
  c = 'StatusLineModeCommand',
  n = 'StatusLineModeNormal',
  v = 'StatusLineModeVisual',
  V = 'StatusLineModeVisual',
  [''] = 'StatusLineModeVisual',
  i = 'StatusLineModeInsert',
  t = 'StatusLineModeTerminal'
}

local function separator()
  return '%='
end

local function text(text)
  return "%#StatusLineText#" .. text
end

local function space()
  return text(' ')
end

function Statusline_mode()
  local mode = tostring(vim.fn.mode())
  local color = mode_colors[mode]
  local title = mode_titles[mode]

  neovim.highlight_link('StatusLineMode', color)
  return title
end

local function mode()
  return '%#StatusLineMode#%{luaeval("Statusline_mode()")}'
end

local function git()
  local line = ''

  if vim.fn.FugitiveIsGitDir() == 1 then
    local branch = vim.fn.FugitiveHead()

    local dirty = os.execute('test -z "$(git status --porcelain | tail -n1)"')

    local color = 'StatusLineGitNew'
    if dirty ~= 0 then
      color = 'StatusLineGitModified'
    end

    line = '%#' .. color .. '# ' .. branch
  end

  return line
end

local function file()
  local f = vim.fn.expand('%:.')
  local line = '%#StatusLineText# ' .. f

  if vim.fn.FugitiveIsGitDir() == 1 then
    local new = os.execute('git status --porcelain | grep -q "?? ' .. f .. '$"')
    if new == 0 then
      line = line .. '%#StatusLineGitNew# +'
      return line
    end

    local dirty = os.execute('git diff --exit-code --quiet ' .. f)
    if dirty ~= 0 then
      line = line .. '%#StatusLineGitDirty# *'
      return line
    end
  end

  return line
end

local function linecolumn()
  return text('  L %l/%L, C %c')
end

local function indent_width()
  if vim.b.indent_width then
    return vim.b.indent_width
  else
    return 0
  end
end

local function indentation()
  if indent_width() == 'tabs' then
    return text('  Tabs')
  else
    return text('  Spaces: ' .. indent_width())
  end
end

local function filetype()
  local icon = devicons.get_icon_by_filetype(vim.bo.filetype) or ''
  return text('  ' .. icon .. ' ' .. vim.bo.filetype)
end

local function statusline()
  return (
    space() ..
    mode() ..
    git() ..
    file() ..
    separator() ..
    linecolumn() ..
    indentation() ..
    filetype() ..
    space()
  )
end

local function show_statusline()
  vim.opt.laststatus = 3
  vim.opt.statusline = statusline()
end

local function hide_statusline()
  vim.opt.laststatus = 0
end

-- Show statusline when entering or saving a buffer
vim.api.nvim_create_autocmd(
  {'BufEnter', 'BufWritePost'},
  {
    pattern = {'*'},
    callback = show_statusline
  }
)

-- Show statusline when FZF is open
vim.api.nvim_create_autocmd(
  {'User'},
  {
    pattern = 'FzfStatusLine',
    callback = show_statusline
  }
)
