" ======================================================================
" Johnny Fivecents
" ======================================================================
" A Vim Color Scheme
" Copyright (c) 2015 John Nickell.
" Released under the MIT License <http://opensource.org/licenses/MIT>
" ======================================================================

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "johnny5c"
let colors_name = "johnny5c"

" normal text
hi Normal gui=none cterm=none guibg=#121212 ctermbg=233 guifg=#b2b2b2 ctermfg=249
" used for the columns set with 'colorcolumn'
hi ColorColumn gui=none cterm=none guibg=#b2b2b2 ctermbg=249 guifg=fg ctermfg=fg
" placeholder characters substituted for concealed text
hi Conceal gui=none cterm=none guibg=bg ctermbg=bg guifg=#444444 ctermfg=238
" the character under the cursor
hi Cursor gui=none cterm=none guibg=#b2b2b2 ctermbg=249 guifg=#121212 ctermfg=233
" like Cursor, but used when in IME mode CursorIM
hi link CursorIM Cursor

" the screen column that the cursor is in when 'cursorcolumn' is set
hi CursorColumn gui=none cterm=none guibg=bg ctermbg=bg guifg=fg ctermfg=fg
" the screen line that the cursor is in when 'cursorline' is set
hi CursorLine gui=none cterm=none guibg=bg ctermbg=bg guifg=fg ctermfg=fg
" directory names (and other special names in listings)
hi Directory gui=none cterm=none guibg=bg ctermbg=bg guifg=fg ctermfg=fg

" diff mode: Added line diff.txt
hi DiffAdd gui=none cterm=none guibg=bg ctermbg=bg guifg=#00d700 ctermfg=40
" diff mode: Changed line diff.txt
hi DiffChange gui=none cterm=none guibg=bg ctermbg=bg guifg=#0000d7 ctermfg=20
" diff mode: Deleted line diff.txt
hi DiffDelete gui=none cterm=none guibg=bg ctermbg=bg guifg=#d70000 ctermfg=160
" diff mode: Changed text within a changed line diff.txt
hi DiffText gui=none cterm=none guibg=bg ctermbg=bg guifg=#c6c6c6 ctermfg=251

" the column separating vertically split windows
hi VertSplit gui=none cterm=none guibg=#262626 ctermbg=235 guifg=#262626 ctermfg=235
" line used for closed folds
hi Folded gui=none cterm=none guibg=bg ctermbg=bg guifg=#585858 ctermfg=240
" 'incsearch' highlighting; also used for the text replaced with ':s///c'
hi IncSearch gui=none cterm=none guibg=#b2b2b2 ctermbg=249 guifg=#121212 ctermfg=233

" Line number for ':number' and ':#' commands, and when 'number' or
" 'relativenumber' option is set.
hi LineNr gui=none cterm=none guibg=bg ctermbg=bg guifg=#666666 ctermfg=242
" Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
hi CursorLineNr gui=none cterm=none guibg=bg ctermbg=bg guifg=#666666 ctermfg=242

" The character under the cursor or just before it, if it is a paired bracket,
" and its match. pi_paren.txt
hi MatchParen gui=underline cterm=underline guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24

" '~' and '@' at the end of the window, characters from 'showbreak' and other
" characters that do not really exist in the text (e.g., '>' displayed when a
" double-wide character doesn't fit at the end of the line).
hi NonText gui=none cterm=none guibg=bg ctermbg=bg guifg=#666666 ctermfg=242

" Popup menu: normal item.
hi Pmenu gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" Popup menu: selected item.
hi PmenuSel gui=none cterm=none guibg=#262626 ctermbg=235 guifg=fg ctermfg=fg

" Last search pattern highlighting (see 'hlsearch'). Also used for highlighting
" the current line in the quickfix window and similar items that need to stand
" out.
hi Search gui=underline cterm=underline guibg=#c6c6c6 ctermbg=251 guifg=#000087 ctermfg=18

" Meta and special keys listed with ':map', also for text used to show
" unprintable characters in the text, 'listchars'. Generally: text that is
" displayed differently from what it really is.
hi SpecialKey gui=none cterm=none guibg=bg ctermbg=bg guifg=#666666 ctermfg=242

" status line of current window
hi StatusLine gui=bold cterm=bold guibg=#262626 ctermbg=235 guifg=fg ctermfg=fg
" status lines of not-current windows. Note: if this is equal to 'StatusLine'
" Vim will use '^^^' in the status line of the current window.
hi StatusLineNC gui=none cterm=none guibg=#262626 ctermbg=235 guifg=fg ctermfg=fg

" titles for output from ':set all', ':autocmd' etc.
hi Title gui=bold cterm=bold guibg=bg ctermbg=bg guifg=fg ctermfg=fg

" Visual mode selection
hi Visual gui=none cterm=none guibg=#262626 ctermbg=235 guifg=fg ctermfg=fg

" any comment
hi Comment gui=none cterm=none guibg=bg ctermbg=bg guifg=#585858 ctermfg=240

" any constant
hi Constant gui=none cterm=none guibg=bg ctermbg=bg guifg=#005faf ctermfg=25
" a string constant
hi String gui=none cterm=none guibg=bg ctermbg=bg guifg=#878700 ctermfg=100
" a character constant
hi Character gui=none cterm=none guibg=bg ctermbg=bg guifg=#878700 ctermfg=100
" a number constant
hi Number gui=none cterm=none guibg=bg ctermbg=bg guifg=#af5f00 ctermfg=130
" a boolean constant
hi Boolean gui=none cterm=none guibg=bg ctermbg=bg guifg=#005faf ctermfg=25
" a floating point constant
hi Float gui=none cterm=none guibg=bg ctermbg=bg guifg=#af5f00 ctermfg=130

" any variable name
hi Identifier gui=none cterm=none guibg=bg ctermbg=bg guifg=#5f5fd7 ctermfg=62
" function name (also: methods for classes)
hi Function gui=none cterm=none guibg=bg ctermbg=bg guifg=#00875f ctermfg=29

" any statement
hi Statement gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" if, then, else, endif, switch, etc.
hi Conditional gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" for, do, while, repeat, etc.
hi Repeat gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" case, default, etc.
hi Label gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" sizeof, +, *, etc.
hi Operator gui=none cterm=none guibg=bg ctermbg=bg guifg=#b2b2b2 ctermfg=249
" any other keyword
hi Keyword gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" try, catch, throw
hi Exception gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24

" generic preprocessor
hi PreProc gui=none cterm=none guibg=bg ctermbg=bg guifg=#00875f ctermfg=29
" preprocessor include
hi Include gui=none cterm=none guibg=bg ctermbg=bg guifg=#00875f ctermfg=29
" preprocessor define
hi Define gui=none cterm=none guibg=bg ctermbg=bg guifg=#00875f ctermfg=29
" same as define
hi Macro gui=none cterm=none guibg=bg ctermbg=bg guifg=#00875f ctermfg=29
" preprocessor #if, #else, #endif, etc.
hi PreCondit gui=none cterm=none guibg=bg ctermbg=bg guifg=#00875f ctermfg=29

" int, long, char, etc.
hi Type gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" static, register, volatile, etc.
hi StorageClass gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" struct, union, enum, etc.
hi Structure gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" a typedef
hi Typedef gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24

" any special symbol
hi Special gui=none cterm=none guibg=bg ctermbg=bg guifg=#00875f ctermfg=29
" special character in a constant
hi SpecialChar gui=none cterm=none guibg=bg ctermbg=bg guifg=#878700 ctermfg=100
" you can use CTRL-] on this
hi Tag gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" character that needs attention
hi Delimiter gui=none cterm=none guibg=bg ctermbg=bg guifg=#b2b2b2 ctermfg=249
" special things inside a comment
hi SpecialComment gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" debugging statements
hi Debug gui=none cterm=none guibg=bg ctermbg=bg guifg=#b2b2b2 ctermfg=249

" text that stands out, HTML links
hi Underlined gui=underline cterm=underline guibg=bg ctermbg=bg guifg=fg ctermfg=fg

" left blank, hidden
hi Ignore gui=none cterm=none guibg=bg ctermbg=bg guifg=fg ctermfg=fg

" any erroneous construct
hi Error gui=none cterm=none guibg=#121212 ctermbg=233 guifg=#d70000 ctermfg=160

" anything that needs extra attention; mostly the keywords TODO FIXME and XXX
hi Todo gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24

" docblock comment
hi DocComment gui=none cterm=none guibg=bg ctermbg=bg guifg=#585858 ctermfg=240
" docblock tag
hi DocTags gui=none cterm=none guibg=bg ctermbg=bg guifg=#005f87 ctermfg=24
" support functions
hi SupportFunction gui=none cterm=none guibg=bg ctermbg=bg guifg=#00875f ctermfg=29
" classes, interfaces, traits
hi Class gui=none cterm=none guibg=bg ctermbg=bg guifg=#b2b2b2 ctermfg=249
" namespaces
hi Namespace gui=none cterm=none guibg=bg ctermbg=bg guifg=#b2b2b2 ctermfg=249
" class member
hi ClassMember gui=none cterm=none guibg=bg ctermbg=bg guifg=#5f5fd7 ctermfg=62

" php links
hi link phpDocComment DocComment
hi link phpDocTags DocTags
hi link phpFunctions SupportFunction
hi link phpClasses Class
hi link phpClass Class
hi link phpStaticClasses Class
hi link phpInterface Class
hi link phpTrait Class
hi link phpUsing Class
hi link phpExtends Class
hi link phpImplements Class
hi link phpNamespace Namespace
hi link phpMethodsVar ClassMember
