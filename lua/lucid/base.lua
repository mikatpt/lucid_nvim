-- stylua: ignore start
-- For usage guides, see :h lush or :LushRunTutorial
--
--       Basically, name your file,
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--  `:Lushify`

local lush = require('lush')

-- Colors
local c = require'lucid.colors'

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    Comment      { fg = c.light_grey },
    ColorColumn  { fg = c.magenta }, -- used for the columns set with 'colorcolumn'
    Conceal      { fg = c.ivory }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { fg = c.white, bg = c.grey }, -- character under the cursor
    lCursor      { Cursor }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { Cursor }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = c.deep_blue2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = c.deep_blue2 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = c.olive, bg = c.deep_blue }, -- directory names (and other special names in listings)
    DiffAdd      { fg = c.dark_green },
    DiffChange   { fg = c.gold },
    DiffDelete   { fg = c.dark_red },
    DiffText     { fg = c.magenta }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = c.grey }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor   { bg = c.grey }, -- cursor in a focused terminal
    TermCursorNC { bg = c.grey }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = c.red, gui = 'bold' },
    VertSplit    { fg = c.light_blue2, bg = c.deep_blue }, -- the column separating vertically split windows
    Folded       { fg = c.cyan, bg = c.deep_blue }, -- line used for closed folds
    FoldColumn   { bg = c.deep_blue}, -- 'foldcolumn'
    SignColumn   { FoldColumn }, -- column where |signs| are displayed
    IncSearch    { fg = c.black, bg = c.yellow }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { IncSearch }, -- |:substitute| replacement text highlighting
    LineNr       { fg = c.light_grey, }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = c.light_grey }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = c.black, bg = c.magenta }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    -- Change these colors?
    ModeMsg      { fg = c.white }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { bg = c.deep_blue }, -- Area for messages and cmdline
    MsgSeparator { fg = c.deep_blue2, bg = c.deep_blue2 }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = c.jade }, -- |more-prompt|
    NonText      { fg = c.magenta }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = c.white, bg = c.deep_blue }, -- normal text
    NormalFloat  { fg = c.white, bg = c.deep_blue }, -- Normal text in floating windows.
    NormalNC     { fg = c.white, bg = c.deep_blue }, -- normal text in non-current windows
    FloatBorder  { fg = c.cyan2 },

    -- Maybe restyle popup menus
    Pmenu        { fg = c.white, bg = c.dark_grey }, -- Popup menu: normal item.
    PmenuSel     { bg = c.deep_blue3 }, -- Popup menu: selected item.
    PmenuSbar    { bg = c.dark_grey }, -- Popup menu: scrollbar.
    PmenuThumb   { bg = c.grey }, -- Popup menu: Thumb of the scrollbar.

    Question     { fg = c.green }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { IncSearch }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { IncSearch }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey   { fg = c.cyan3 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { fg = c.yellow }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { SpellBad }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { SpellBad }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { SpellBad }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    StatusLine   { fg = lush.hsl('#12131A'), bg = lush.hsl('#12131A') }, -- status line of current window
    StatusLineNC { fg = lush.hsl('#12131A'), bg = lush.hsl('#12131A') }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    -- Revisit this when we use tabs
    TabLine      { fg = c.black, bg = c.light_grey }, -- tab pages line, not active tab page label
    TabLineFill  { fg = c.black, bg = c.light_grey }, -- tab pages line, where there are no labels
    TabLineSel   { fg = c.black, bg = c.light_grey, gui = 'bold'}, -- tab pages line, active tab page label
    Title        { fg = c.magenta }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { fg = c.black, bg = c.olive}, -- Visual mode selection
    VisualNOS    { fg = c.yellow, bg = c.magenta}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = c.yellow, gui = 'bold' }, -- warning messages
    Whitespace   { fg = c.grey }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { fg = c.black, bg = c.yellow }, -- current match in 'wildmenu' completion

    ----- [[ ------- ]] -----
    ---       SYNTAX      ---
    ----- [[ ------- ]] -----

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = c.dark_blue }, -- (preferred) any constant
    String         { fg = c.olive }, --   a string constant: "this is a string"
    Character      { fg = c.olive }, --  a character constant: 'c', '\n'
    Number         { fg = c.olive }, --   a number constant: 234, 0xff
    Boolean        { Constant }, --  a boolean constant: TRUE, false
    Float          { Number }, --    a floating point constant: 2.3e10

    Identifier     { fg = c.white }, -- (preferred) any variable name
    Function       { fg = c.light_blue }, -- function name (also: methods for classes)
    Statement      { fg = c.purple }, -- (preferred) any statement
    Conditional    { fg = c.jade }, --  if, then, else, endif, switch, etc.
    Repeat         { fg = c.jade }, --   for, do, while, etc.
    Label          { fg = c.jade }, --    case, default, etc.
    Operator       { fg = c.magenta }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = c.purple }, --  any other keyword
    Exception      { Operator }, --  try, catch, throw

    PreProc        { fg = c.purple }, -- (preferred) generic Preprocessor
    Include        { PreProc }, --  preprocessor #include
    Define         { PreProc }, --   preprocessor #define
    Macro          { PreProc }, --    same as Define
    PreCondit      { PreProc }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = c.jade }, -- (preferred) int, long, char, etc.
    StorageClass   { Type }, -- static, register, volatile, etc.
    Structure      { Type }, --  struct, union, enum, etc.
    Typedef        { fg = c.ivory }, --  A typedef

    Special        { fg = c.magenta }, -- (preferred) any special symbol
    SpecialChar    { Special }, --  special character in a constant
    Tag            { Special }, --    you can use CTRL-] on this
    Delimiter      { Special }, --  character that needs attention
    SpecialComment { Special }, -- special things inside a comment
    Debug          { Special }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error          { fg = c.red }, -- (preferred) any erroneous construct

    Todo           { fg = c.magenta, gui = 'bold' }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    LspReferenceText                     { fg = c.black, bg = c.magenta }, -- used for highlighting "text" references
    LspReferenceRead                     { fg = c.black, bg = c.magenta }, -- used for highlighting "read" references
    LspReferenceWrite                    { fg = c.black, bg = c.magenta }, -- used for highlighting "write" references

    DiagnosticError                      { Error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticWarn                       { fg = c.yellow }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticInfo                       { fg = c.cyan }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticHint                       { fg = c.cyan }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    DiagnosticVirtualTextError           { Error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn            { fg = c.yellow }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo            { fg = c.cyan }, -- Used for "Info" diagnostic virtual text
    DiagnosticVirtualTextHint            { fg = c.cyan }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError             { gui = 'undercurl', sp = c.red }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn              { gui = 'undercurl', sp = c.yellow }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo              { gui = 'undercurl', sp = c.cyan }, -- Used to underline "Info" diagnostics
    DiagnosticUnderlineHint              { gui = 'undercurl', sp = c.cyan }, -- Used to underline "Hint" diagnostics

    DiagnosticFloatingError              { Error }, -- Used to color "Error" diagnostic messages in diagnostics float
    DiagnosticFloatingWarn               { fg = c.yellow }, -- Used to color "Warning" diagnostic messages in diagnostics float
    DiagnosticFloatingInfo               { fg = c.cyan }, -- Used to color "Info" diagnostic messages in diagnostics float
    DiagnosticFloatingHint               { fg = c.cyan }, -- Used to color "Hint" diagnostic messages in diagnostics float

    DiagnosticSignError                  { Error }, -- Used for "Error" signs in sign column
    DiagnosticSignWarn                   { fg = c.yellow }, -- Used for "Warning" signs in sign column
    DiagnosticSignInfo                   { fg = c.cyan }, -- Used for "Info" signs in sign column
    DiagnosticSignHint                   { fg = c.cyan }, -- Used for "Hint" signs in sign column

    -- TODO: Deprecate!
    LspDiagnosticsDefaultError           { Error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning         { fg = c.yellow }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation     { fg = c.cyan }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint            { fg = c.cyan }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    LspDiagnosticsVirtualTextError       { Error }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning     { fg = c.yellow }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation { fg = c.cyan }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint        { fg = c.cyan }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError         { gui = 'undercurl', sp = c.red }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning       { gui = 'undercurl', sp = c.yellow }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation   { gui = 'undercurl', sp = c.cyan }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint          { gui = 'undercurl', sp = c.cyan }, -- Used to underline "Hint" diagnostics

    LspDiagnosticsFloatingError          { Error }, -- Used to color "Error" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingWarning        { fg = c.yellow }, -- Used to color "Warning" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingInformation    { fg = c.cyan }, -- Used to color "Information" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingHint           { fg = c.cyan }, -- Used to color "Hint" diagnostic messages in diagnostics float

    LspDiagnosticsSignError              { Error }, -- Used for "Error" signs in sign column
    LspDiagnosticsSignWarning            { fg = c.yellow }, -- Used for "Warning" signs in sign column
    LspDiagnosticsSignInformation        { fg = c.cyan }, -- Used for "Information" signs in sign column
    LspDiagnosticsSignHint               { fg = c.cyan }, -- Used for "Hint" signs in sign column

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    TSAnnotation         { Special };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute          { Special };    -- (unstable) TODO: docs
    TSBoolean            { Boolean };    -- For booleans.
    TSCharacter          { Character };    -- For characters.
    TSComment            { Comment };    -- For comment blocks.
    TSConstructor        { fg = c.jade };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    TSConditional        { Conditional };    -- For keywords related to conditionnals.
    TSConstant           { fg = c.dark_blue };    -- For constants
    TSConstBuiltin       { Special };    -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro         { Special };    -- For constants that are defined by macros: `NULL` in C.
    TSError              { Error };    -- For syntax/parser errors.
    TSException          { Exception };    -- For exception related keywords.
    TSField              { fg = c.cyan};    -- For fields.
    TSFloat              { Float };    -- For floats.
    TSFunction           { Function };    -- For function (calls and definitions).
    TSFuncBuiltin        { fg = c.purple };    -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro          { Special };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude            { Include };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword            { Statement };    -- For keywords that don't fall in previous categories.
    TSKeywordFunction    { Statement };    -- For keywords used to define a fuction.
    TSLabel              { Label };    -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod             { Function };    -- For method calls and definitions.
    TSNamespace          { Statement };    -- For identifiers referring to modules and namespaces.
    TSNone               { Comment };    -- TODO: docs
    TSNumber             { Number };    -- For all numbers
    TSOperator           { Operator };    -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter          { Identifier };    -- For parameters of a function.
    TSParameterReference { Identifier };    -- For references to parameters of a function.
    TSProperty           { fg = c.cyan };    -- Same as `TSField`.
    TSPunctDelimiter     { Delimiter };    -- For delimiters ie: `.`
    TSPunctBracket       { Delimiter };    -- For brackets and parens.
    TSPunctSpecial       { Delimiter };    -- For special punctutation that does not fall in the catagories before.
    TSRepeat             { Repeat };    -- For keywords related to loops.
    TSString             { String };    -- For strings.
    TSStringRegex        { String };    -- For regexes.
    TSStringEscape       { SpecialChar };    -- For escape characters within a string.
    TSSymbol             { SpecialChar };    -- For identifiers referring to symbols or atoms.
    TSType               { Type };    -- For types.
    TSTypeBuiltin        { Type };    -- For builtin types.
    TSVariable           { Identifier };    -- Any variable name that does not have another highlight.
    TSVariableBuiltin    { Special };    -- Variable names that are defined by the languages, like `this` or `self`.

    TSTag                { Structure };    -- Tags like html tag names.
    TSTagDelimiter       { Delimiter };    -- Tag delimiter like `<` `>` `/`
    TSText               { Identifier };    -- For strings considered text in a markup language.
    TSEmphasis           { gui = 'bold' };    -- For text to be represented with emphasis.
    TSUnderline          { gui = 'underline' };    -- For text to be represented with an underline.
    TSStrike             { gui = 'strikethrough' };    -- For strikethrough text.
    TSTitle              { Special };    -- Text that is part of a title.
    TSLiteral            { String };    -- Literal text.
    TSURI                { Constant };    -- Any URI like a link or email.
  }
end)

-- return our parsed theme for extension or use else where.
return theme
--- vi:nowrap
