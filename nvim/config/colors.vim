" Colors config

let s:black       = { 'gui': '#282c34', 'cterm': '236' }
let s:red         = { 'gui': '#e06c75', 'cterm': '168' }
let s:green       = { 'gui': '#98c379', 'cterm': '114' }
let s:yellow      = { 'gui': '#e5c07b', 'cterm': '180' }
let s:blue        = { 'gui': '#61afef', 'cterm': '75'  }
let s:magenta     = { 'gui': '#c678dd', 'cterm': '176' }
let s:cyan        = { 'gui': '#56b6c2', 'cterm': '73'  }
let s:white       = { 'gui': '#dcdfe4', 'cterm': '188' }

let s:bright_black       = { 'gui': '#282c34', 'cterm': '236' }
let s:bright_red         = { 'gui': '#e06c75', 'cterm': '168' }
let s:bright_green       = { 'gui': '#98c379', 'cterm': '114' }
let s:bright_yellow      = { 'gui': '#e5c07b', 'cterm': '180' }
let s:bright_blue        = { 'gui': '#61afef', 'cterm': '75'  }
let s:bright_magenta     = { 'gui': '#c678dd', 'cterm': '176' }
let s:bright_cyan        = { 'gui': '#56b6c2', 'cterm': '73'  }
let s:bright_white       = { 'gui': '#dcdfe4', 'cterm': '188' }

let s:foreground          = s:white
let s:background          = s:black
let s:background_alt      = s:black


set termguicolors

let s:color_names = ['black', 'red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white', 'background', 'background_alt', 'foreground']

for color_name in s:color_names
    let s:color_name_upper = toupper(color_name)

    let s:color_gui = system('echo $COLOR_WEB_' . s:color_name_upper)[:-2]
    let s:color_cterm = system('echo $COLOR_TERM_' . s:color_name_upper)[:-2]

    let s:color_bright_gui = system('echo $COLOR_WEB_BRIGHT_' . s:color_name_upper)[:-2]
    let s:color_bright_cterm = system('echo $COLOR_TERM_BRIGHT_' . s:color_name_upper)[:-2]

    let s:[color_name] = {'gui': s:color_gui, 'cterm': s:color_cterm}
    let s:['bright_' . color_name] = {'gui': s:color_bright_gui, 'cterm': s:color_bright_cterm}
endfor

function! s:h(group, fg, bg, attr)
    if type(a:fg) == type({})
        exec 'hi ' . a:group . ' guifg=' . a:fg.gui . ' ctermfg=' . a:fg.cterm
    else
        exec 'hi ' . a:group . ' guifg=NONE cterm=NONE'
    endif

    if type(a:bg) == type({})
        exec 'hi ' . a:group . ' guibg=' . a:bg.gui . ' ctermbg=' . a:bg.cterm
    else
        exec 'hi ' . a:group . ' guibg=NONE ctermbg=NONE'
    endif

    if a:attr !=# ''
        exec 'hi ' . a:group . ' gui=' . a:attr . ' cterm=' . a:attr
    else
        exec 'hi ' . a:group . ' gui=NONE cterm=NONE'
    endif
endfun

let s:comment_fg  = { 'gui': '#5c6370', 'cterm': '241' }
let s:gutter_bg   = { 'gui': '#282c34', 'cterm': '236' }
let s:gutter_fg   = { 'gui': '#919baa', 'cterm': '247' }

let s:cursor_line = { 'gui': '#313640', 'cterm': '237' }
let s:color_col   = { 'gui': '#313640', 'cterm': '237' }

let s:selection   = { 'gui': '#474e5d', 'cterm': '239' }
let s:vertsplit   = { 'gui': '#313640', 'cterm': '237' }

" Interface {
call s:h('Normal', s:foreground, '', '')
call s:h('NonText', s:bright_black, '', '')

call s:h('Cursor', s:background, s:magenta, '')
call s:h('CursorColumn', '', s:black, '')
call s:h('CursorLine', '', s:black, '')
call s:h('QuickFixLine', s:blue, s:black, '')
call s:h('qfFileName', s:magenta, '', '')

call s:h('LineNr', s:bright_black, '', '')
call s:h('CursorLineNr', s:foreground, '', '')

call s:h('DiffAdd', s:green, '', '')
call s:h('DiffChange', s:yellow, '', '')
call s:h('DiffDelete', s:red, '', '')
call s:h('DiffText', s:blue, '', '')

call s:h('IncSearch', s:background, s:magenta, '')
call s:h('Search', s:background, s:bright_black, '')

call s:h('ErrorMsg', s:red, '', '')
call s:h('ModeMsg', s:bright_black, '', '')
call s:h('MoreMsg', s:blue, '', '')
call s:h('WarningMsg', s:yellow, '', '')
call s:h('Question', s:green, '', '')

call s:h('Pmenu', s:foreground, s:background_alt, '')
call s:h('PmenuSel', s:background, s:blue, '')
call s:h('PmenuSbar', '', s:background_alt, '')
call s:h('PmenuThumb', '', s:bright_black, '')

call s:h('SpellBad', s:red, '', '')
call s:h('SpellCap', s:yellow, '', '')
call s:h('SpellLocal', s:yellow, '', '')
call s:h('SpellRare', s:yellow, '', '')

" call s:h("TabLine", s:comment_fg, s:cursor_line, "")
" call s:h("TabLineFill", s:comment_fg, s:cursor_line, "")
" call s:h("TabLineSel", s:foreground, s:background, "")

call s:h('StatusLine', s:bright_black, '', '')
call s:h('StatusLineNC', s:background, '', '')

call s:h('StatusLineMode', s:blue, '', '')
call s:h('StatusLineCommandMode', s:yellow, '', '')
call s:h('StatusLineNormalMode', s:blue, '', '')
call s:h('StatusLineVisualMode', s:red, '', '')
call s:h('StatusLineInsertMode', s:green, '', '')
call s:h('StatusLineTerminalMode', s:yellow, '', '')
call s:h('StatusLineSnippetMode', s:blue, '', '')

call s:h('StatusLineBranch', s:green, '', '')
call s:h('StatusLineBranchClean', s:green, '', '')
call s:h('StatusLineBranchDirty', s:yellow, '', '')

call s:h('StatusLineFilePrefix', s:bright_black, '', '')
call s:h('StatusLineFile', s:bright_black, '', '')
call s:h('StatusLineFileSaved', s:bright_black, '', '')
call s:h('StatusLineFileUnsaved', s:yellow, '', '')
call s:h('StatusLineFileType', s:bright_black, '', '')
call s:h('StatusLineFileLocked', s:red, '', '')
call s:h('StatusLineFileStatus', s:green, '', '')
call s:h('StatusLineFileStatusAdded', s:green, '', '')
call s:h('StatusLineFileStatusModified', s:yellow, '', '')
call s:h('StatusLineFileStatusRemoved', s:red, '', '')

call s:h('StatusLineErrors', s:red, '', '')
call s:h('StatusLineWarnings', s:yellow, '', '')
call s:h('StatusLineCursorPosition', s:blue, '', '')
call s:h('StatusLineCursorPositionActive', s:blue, '', '')
call s:h('StatusLineCursorPositionInactive', s:bright_black, '', '')

call s:h('StatusLineInactive', s:bright_black, '', '')

call s:h('Visual', '', s:background_alt, '')
call s:h('VisualNC', '', s:background_alt, '')
call s:h('VisualNOS', '', s:background_alt, '')

call s:h('ColorColumn', '', s:black, '')
call s:h('Conceal', s:bright_black, '', '')
call s:h('Whitespace', s:bright_black, '', '')
call s:h('Directory', s:blue, '', '')
call s:h('VertSplit', s:bright_black, '', '')
call s:h('Folded', s:bright_black, s:black, '')
call s:h('FoldColumn', s:foreground, '', '')
call s:h('SignColumn', s:foreground, '', '')

call s:h('SpecialKey', s:foreground, '', '')
call s:h('Title', s:foreground, '', '')
call s:h('WildMenu', s:background, s:blue, '')
" }

" Syntax {
call s:h('Comment', s:bright_black, '', 'italic')
call s:h('Constant', s:yellow, '', '')
call s:h('String', s:green, '', '')
call s:h('Character', s:green, '', '')
call s:h('Number', s:red, '', '')
call s:h('Boolean', s:red, '', '')
call s:h('Float', s:red, '', '')

call s:h('Identifier', s:red, '', '')
call s:h('Function', s:blue, '', '')
call s:h('Statement', s:blue, '', '')

call s:h('Conditional', s:blue, '', '')
call s:h('Repeat', s:blue, '', '')
call s:h('Label', s:magenta, '', '')
call s:h('Operator', s:foreground, '', '')
call s:h('Keyword', s:blue, '', '')
call s:h('Exception', s:red, '', '')

call s:h('PreProc', s:yellow, '', '')
call s:h('Include', s:blue, '', '')
call s:h('Define', s:magenta, '', '')
call s:h('Macro', s:magenta, '', '')
call s:h('PreCondit', s:yellow, '', '')

call s:h('Type', s:yellow, '', '')
call s:h('StorageClass', s:foreground, '', '')
call s:h('Structure', s:yellow, '', '')
call s:h('Typedef', s:yellow, '', '')

call s:h('Special', s:blue, '', '')
call s:h('SpecialChar', s:foreground, '', '')
call s:h('Tag', s:cyan, '', '')
call s:h('Delimiter', s:foreground, '', '')
call s:h('SpecialComment', s:foreground, '', '')
call s:h('Debug', s:foreground, '', '')
call s:h('Underlined', s:foreground, '', 'underline')
call s:h('Ignore', s:foreground, '', '')
call s:h('Error', s:red, '', '')
call s:h('Todo', s:foreground, '', 'bold,italic')

" HTML
hi! link htmlEndTag htmlTag
hi! link htmlTagN htmlTag

" Yaml
hi! link yamlBlockMappingKey Function
hi! link yamlBlockCollectionItemStart Normal
hi! link yamlBool Boolean

" Vim
call s:h('vimVar', s:foreground, '', '')
hi! link vimFuncVar vimVar
hi! link vimOption Tag
hi! link vimGroup vimOption
hi! link vimHiGroup vimOption

" Ruby
call s:h('rubyBlockParameter', s:foreground, '', '')
call s:h('rubyInstanceVariable', s:cyan, '', '')
call s:h('rubySymbol', s:cyan, '', '')
call s:h('rubyInterpolationDelimiter', s:blue, '', '')

hi! link rubyControl Function
hi! link rubyAssertion Function
hi! link rubyMacro rubyClass
hi! link rubyInclude rubyMacro
hi! link rubyAttribute rubyMacro
hi! link rubyStringDelimiter rubyString
hi! link rubyPseudoVariable Boolean

" CoffeeScript
call s:h('coffeeObjAssign', s:foreground, '', '')
call s:h('coffeeSpecialIdent', s:cyan, '', '')
call s:h('coffeeInterpDelim', s:blue, '', '')

hi! link coffeeObject Normal
hi! link coffeeSpecialVar Normal

" Go
call s:h('goDeclaration', s:magenta, '', '')
call s:h('goBuiltins', s:cyan, '', '')

hi! link goParamName Normal

" ZSH
call s:h('zshOption', s:cyan, '', '')
call s:h('zshPreProc', s:cyan, '', '')

hi! link zshKeyword Define
hi! link zshFunction Function
hi! link zshKSHFunction Function
hi! link zshDeref zshOption
hi! link zshSubst zshDeref
hi! link zshSubstDelim zshSubst

" JavaScript
call s:h('jsBuiltins', s:cyan, '', '')

hi! link jsOperatorKeyword Function
hi! link jsNull Boolean
hi! link jsGlobalObjects jsBuiltins
hi! link jsArguments jsBuiltins
hi! link jsThis jsBuiltins
hi! link jsUndefined Boolean
hi! link jsFuncCall Normal
hi! link jsPrototype Normal
hi! link jsBlockLabel Normal
hi! link jsObjectMethodType Normal
hi! link jsClassKeyword Define
hi! link jsFunction jsClassKeyword
hi! link jsStorageClass jsClassKeyword
hi! link jsTry Function
hi! link jsCatch jsTry
hi! link jsFinally jsTry
hi! link jsLabel Function

" }

" Plugins {

" GitGutter
call s:h('GitGutterAdd', s:green, '', '')
call s:h('GitGutterDelete', s:red, '', '')
call s:h('GitGutterChange', s:yellow, '', '')
call s:h('GitGutterChangeDelete', s:red, '', '')

" NERDTree
hi! link NERDTreeDir Directory
hi! link NERDTreeFlags Directory
hi! link NERDTreeDirSlash Directory

" NERDTree Git
hi! link NERDTreeGitStatusAdded GitGutterAdd
hi! link NERDTreeGitStatusModified GitGutterChange

" Matchup
call s:h('MatchParen', s:background, s:cyan, '')
call s:h('MatchParenDefault', '', s:bright_black, '')
call s:h('MatchParenMatched', s:background, s:cyan, '')

call s:h('MatchWord', '', s:background_alt, '')
call s:h('MatchWordDefault', '', s:background_alt, '')
call s:h('MatchWordCurrentLine', '', s:blue, '')
call s:h('MatchWordCurrentLineMatched', '', s:bright_black, 'underline')

" EasyMotion
call s:h('EasyMotionTarget', s:blue, '', 'bold')
call s:h('EasyMotionShade', s:bright_black, '', '')
call s:h('EasyMotionTarget2First', s:blue, '', 'bold')
call s:h('EasyMotionTarget2Second', s:blue, '', 'bold')
call s:h('EasyMotionMoveHL', '', s:green, '')
call s:h('EasyMotionIncSearch', '', s:green, '')

" Ale
call s:h('ALEError', s:red, '', 'underline')
call s:h('ALEErrorSign', s:red, '', '')

call s:h('ALEWarning', s:yellow, '', 'underline')
call s:h('ALEWarningSign', s:yellow, '', '')
call s:h('ALEWarningSign', s:yellow, '', '')

" CurrentWord
call s:h('CurrentWord', '', '', 'underline')

" Tagbar
call s:h('TagbarHighlight', s:blue, s:black, '')
hi! link TagbarScope Function

" }

let g:terminal_color_0 = s:black.gui
let g:terminal_color_1 = s:red.gui
let g:terminal_color_2 = s:green.gui
let g:terminal_color_3 = s:yellow.gui
let g:terminal_color_4 = s:blue.gui
let g:terminal_color_5 = s:magenta.gui
let g:terminal_color_6 = s:cyan.gui
let g:terminal_color_7 = s:white.gui
let g:terminal_color_8 = s:black.gui
let g:terminal_color_9 = s:red.gui
let g:terminal_color_10 = s:green.gui
let g:terminal_color_11 = s:yellow.gui
let g:terminal_color_12 = s:blue.gui
let g:terminal_color_13 = s:magenta.gui
let g:terminal_color_14 = s:cyan.gui
let g:terminal_color_15 = s:white.gui
let g:terminal_color_background = s:background.gui
let g:terminal_color_foreground = s:foreground.gui
