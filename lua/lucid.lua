-- stylua: ignore start
-- Enable lush.ify on this file, run:
--  `:Lushify`

local lush = require('lush')
local hsl = require("lush").hsl

-- Colors
local c = {
  white = hsl(258, 27, 98),
  black = hsl(0, 0, 0),
  magenta = hsl(323, 100, 43),
  pink = hsl(348, 40, 57),
  dark_purple = hsl(275, 100, 64),
  light_purple = hsl("#c0caf5"),
  purple = hsl(275, 49, 63),
  dark_red = hsl(0, 100, 27),
  red = hsl(360, 99, 45),
  dark_grey = hsl(210, 44, 7),
  bg_grey = hsl(222, 14, 8),
  grey = hsl(0, 0, 22),
  light_grey = hsl(261, 8, 51),
  light_grey2 = hsl(261, 8, 41),
  dark_green = hsl(120, 100, 18),
  dark_green2 = hsl(120, 100, 28),
  green = hsl(120, 100, 43),
  jade = hsl(158, 56, 52),
  dark_jade = hsl(158, 56, 27),
  olive = hsl(107, 100, 88),
  gold = hsl(60, 100, 37),
  beige = hsl(41, 70, 62),
  yellow = hsl(60, 100, 50),
  ivory = hsl(47, 96, 81),
  deep_blue = hsl(210, 100, 4),
  deep_blue2 = hsl(206, 100, 8),
  deep_blue3 = hsl(230, 120, 10),
  dark_blue = hsl(210, 95, 38),
  blue = hsl(212, 67, 51),
  light_blue = hsl(212, 46, 67),
  light_blue2 = hsl(210, 100, 13),
  cyan = hsl(178, 100, 82),
  cyan2 = hsl(211, 35, 63),
  cyan3 = hsl("#00FFFF"),
}

---@diagnostic disable: undefined-global
local base = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- Neovim Native (0.8)

    Comment      { fg = c.light_grey },
    ColorColumn  { bg = c.deep_blue3 },              -- Places a column at configured maximum text width, i.e. :set cc+=90
    Conceal      { fg = c.ivory },                   -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { fg = c.white, bg = c.grey },      -- Character under the cursor
    lCursor      { Cursor },                         -- The character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { Cursor },                         -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = c.deep_blue2 },              -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = c.deep_blue2 },              -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = c.olive },                   -- Directory names (and other special names in listings)
    DiffAdd      { fg = c.dark_green },
    DiffChange   { fg = c.beige },
    DiffDelete   { fg = c.dark_red },
    DiffText     { fg = c.magenta },                 -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = c.grey },                    -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor   { bg = c.grey },                    -- cursor in a focused terminal
    TermCursorNC { bg = c.grey },                    -- cursor in an unfocused terminal
    ErrorMsg     { fg = c.red, gui = 'bold' },
    VertSplit    { fg = c.light_blue2, bg = c.deep_blue },  -- the column separating vertically split windows
    Folded       { fg = c.ivory },                          -- line used for closed folds
    FoldColumn   { fg = c.ivory, bg = c.deep_blue},         -- 'foldcolumn'
    SignColumn   { FoldColumn },                            -- column where |signs| are displayed
    IncSearch    { fg = c.light_purple, bg = c.dark_jade }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { IncSearch },                             -- |:substitute| replacement text highlighting
    LineNr       { fg = c.light_grey, },                    -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = c.light_grey },                     -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = c.black, bg = c.magenta },          -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

    ModeMsg      { fg = c.light_purple },                   -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { bg = c.deep_blue },                      -- Area for messages and cmdline
    MsgSeparator { fg = c.deep_blue2, bg = c.deep_blue2 },  -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = c.jade },                           -- |more-prompt|
    NonText      { fg = c.magenta },                        -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = c.white, bg = c.deep_blue },        -- normal text
    NormalFloat  { fg = c.white, bg = c.deep_blue },        -- Normal text in floating windows.
    NormalNC     { fg = c.white, bg = c.deep_blue },        -- normal text in non-current windows
    FloatBorder  { fg = c.cyan2 },

    Pmenu        { fg = c.white, bg = c.dark_grey }, -- Popup menu: normal item.
    PmenuSel     { bg = c.deep_blue3 },              -- Popup menu: selected item.
    PmenuSbar    { bg = c.dark_grey },               -- Popup menu: scrollbar.
    PmenuThumb   { bg = c.grey },                    -- Popup menu: Thumb of the scrollbar.

    Question     { fg = c.green },  -- |hit-enter| prompt and yes/no questions
    QuickFixLine { IncSearch },     -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { IncSearch },     -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey   { fg = c.cyan3 },  -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { fg = c.yellow }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { SpellBad },      -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { SpellBad },      -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { SpellBad },      -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    StatusLine   { bg = lush.hsl('#12131A') }, -- status line of current window
    StatusLineNC { bg = lush.hsl('#12131B') }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    TabLine      { fg = c.light_purple, bg = c.bg_grey },                 -- tab pages line, not active tab page label
    TabLineFill  { bg = c.bg_grey },                                      -- tab pages line, where there are no labels
    TabLineSel   { fg = c.light_purple, bg = c.deep_blue2, gui = 'bold'}, -- tab pages line, active tab page label

    Title        { fg = c.magenta },                   -- titles for output from ":set all", ":autocmd" etc.
    Visual       { fg = c.black, bg = c.olive},        -- Visual mode selection
    VisualNOS    { fg = c.yellow, bg = c.magenta},     -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = c.yellow, gui = 'bold' },      -- warning messages
    Whitespace   { fg = c.grey },                      -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseperator { VertSplit },                        -- Seperator between window splits. Inherits from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { fg = c.black, bg = c.yellow },      -- current match in 'wildmenu' completion

    -- Syntax

    Constant       { fg = c.dark_blue },  -- (preferred) any constant
    String         { fg = c.olive },      -- a string constant: "this is a string"
    Character      { fg = c.olive },      -- a character constant: 'c', '\n'
    Number         { fg = c.olive },      -- a number constant: 234, 0xff
    Boolean        { Constant },          -- a boolean constant: TRUE, false
    Float          { Number },            -- a floating point constant: 2.3e10

    Identifier     { fg = c.white },      -- (preferred) any variable name
    Function       { fg = c.light_blue }, -- function name (also: methods for classes)
    Statement      { fg = c.purple },     -- (preferred) any statement
    Conditional    { fg = c.jade },       -- if, then, else, endif, switch, etc.
    Repeat         { fg = c.jade },       -- for, do, while, etc.
    Label          { fg = c.jade },       -- case, default, etc.
    Operator       { fg = c.magenta },    -- "sizeof", "+", "*", etc.
    Keyword        { fg = c.purple },     -- any other keyword
    Exception      { Operator },          -- try, catch, throw

    PreProc        { fg = c.purple },     -- (preferred) generic Preprocessor
    Include        { PreProc },           -- preprocessor #include
    Define         { PreProc },           -- preprocessor #define
    Macro          { fg = c.magenta },    -- same as Define
    PreCondit      { PreProc },           -- preprocessor #if, #else, #endif, etc.

    Type           { fg = c.jade },       -- (preferred) int, long, char, etc.
    StorageClass   { Type },              -- static, register, volatile, etc.
    Structure      { Type },              -- struct, union, enum, etc.
    Typedef        { fg = c.ivory },      -- A typedef

    Special        { fg = c.magenta },    -- (preferred) any special symbol
    SpecialChar    { Special },           -- special character in a constant
    Tag            { Special },           -- you can use CTRL-] on this
    Delimiter      { Special },           -- character that needs attention
    SpecialComment { Special },           -- special things inside a comment
    Debug          { Special },           -- debugging statements

    Underlined { gui = "underline" },     -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },
    Strike     { gui = "strikethrough" },

    -- ("Ignore", below, may be invisible...)
    Ignore         { fg = c.deep_blue, bg = c.deep_blue }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error          { fg = c.red }, -- (preferred) any erroneous construct
    Todo           { fg = c.magenta, gui = 'bold' }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- LSP

    LspReferenceText              { fg = c.black, bg = c.magenta },           -- used for highlighting "text" references
    LspReferenceRead              { fg = c.black, bg = c.magenta },           -- used for highlighting "read" references
    LspReferenceWrite             { fg = c.black, bg = c.magenta },           -- used for highlighting "write" references
    LspCodeLens                   { fg = c.light_purple } ,                   -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator          { fg = c.light_blue2 } ,                    -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter   { fg = c.light_purple, bg = c.dark_jade } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- Diagnostics
    DiagnosticError               { Error },
    DiagnosticWarn                { fg = c.yellow },
    DiagnosticInfo                { fg = c.cyan },
    DiagnosticHint                { fg = c.cyan },
    DiagnosticVirtualTextError    { DiagnosticError },
    DiagnosticVirtualTextWarn     { DiagnosticWarn },
    DiagnosticVirtualTextInfo     { DiagnosticInfo },
    DiagnosticVirtualTextHint     { DiagnosticHint },
    DiagnosticUnderlineError      { gui = 'undercurl', sp = c.red },
    DiagnosticUnderlineWarn       { gui = 'undercurl', sp = c.yellow },
    DiagnosticUnderlineInfo       { gui = 'undercurl', sp = c.cyan },
    DiagnosticUnderlineHint       { gui = 'undercurl', sp = c.cyan },
    DiagnosticFloatingError       { DiagnosticError },
    DiagnosticFloatingWarn        { DiagnosticWarn },
    DiagnosticFloatingInfo        { DiagnosticInfo },
    DiagnosticFloatingHint        { DiagnosticHint },
    DiagnosticSignError           { DiagnosticError },
    DiagnosticSignWarn            { DiagnosticWarn },
    DiagnosticSignInfo            { DiagnosticInfo },
    DiagnosticSignHint            { DiagnosticHint },

    -- TreeSitter

    sym('@text')                   { Normal },        -- non-structured text
    sym('@text.literal')           { Character },     -- literal or verbatim text
    sym('@text.reference')         { Comment },       -- text references, footnotes, citations, etc.
    sym('@text.uri')               { fg = c.jade, gui = 'underline' },   -- URIs (e.g. hyperlinks)
    sym('@text.underline')         { Underlined },    -- underlined text
    sym('@text.strong')            { Bold },          -- bold text
    sym('@text.emphasis')          { Bold },          -- text with emphasis
    sym('@text.strike')            { Strike },        -- strikethrough text
    sym('@text.title')             { Title },         -- text that is part of a title
    sym('@text.math')              { Define },        -- math environments (e.g. `$ ... $` in LaTeX)
    sym('@text.environment')       { sym('@text') },  -- text environments of markup languages
    sym('@text.environment.name')  { Type },          -- text indicating the type of an environment

    sym('@text.todo')         { Todo },               -- todo notes
    sym('@text.note')         { DiagnosticInfo },     -- info notes
    sym('@text.warning')      { Todo },               -- warning notes
    sym('@text.danger')       { DiagnosticError },    -- danger/error notes
    sym('@text.diff.add')     { DiffAdd },            -- added text (for diff files)
    sym('@text.diff.delete')  { DiffDelete },         -- deleted text (for diff files)

    sym('@comment')      { Comment },       -- line and block comments
    sym('@error')        { Error },         -- syntax/parser errors
    sym('@none')         { Normal },        -- completely disable the highlight
    sym('@preproc')      { PreProc },       -- various preprocessor directives & shebangs
    sym('@define')       { Define },        -- preprocessor definition directives
    sym('@operator')     { Operator },      -- symbolic operators (e.g. `+` / `*`)
    sym('@conditional')  { Conditional },   -- keywords related to conditionals (e.g. `if` / `else`)
    sym('@repeat')       { Repeat },        -- keywords related to loops (e.g. `for` / `while`)
    sym('@debug')        { Special },       -- keywords related to debugging
    sym('@label')        { Label },         -- GOTO and other labels (e.g. `label:` in C)
    sym('@include')      { Include },       -- keywords for including modules (e.g. `import` / `from` in Python)
    sym('@exception')    { Exception },     -- keywords related to exceptions (e.g. `throw` / `catch`)
    sym('@attribute')    { Special },       -- attribute annotations (e.g. Python decorators)
    sym('@field')        { fg = c.cyan },   -- object and struct fields
    sym('@property')     { sym('@field') }, -- similar to `@field`
    sym('@conceal')      { Conceal },       -- for captures that are only used for concealing
    sym('@scope')        { Special },       -- scope block
    -- sym('@reference')    { Identifier },    -- identifier reference

    sym('@variable')          { Identifier },     -- various variable names
    sym('@variable.builtin')  { Special },        -- built-in variable names (e.g. `this`)
    sym('@constant')          { Constant },       -- constant identifiers
    sym('@constant.builtin')  { Special },        -- built-in constant values
    sym('@constant.macro')    { Macro },          -- constants defined by the preprocessor
    sym('@namespace')         { Keyword },        -- modules or namespaces
    sym('@symbol')            { SpecialChar },    -- symbols or atoms

    sym('@punctuation')            { Delimiter },
    sym('@punctuation.delimiter')  { Delimiter }, -- delimiters (e.g. `;` / `.` / `,`)
    sym('@punctuation.bracket')    { Delimiter }, -- brackets (e.g. `()` / `{}` / `[]`)
    sym('@punctuation.special')    { Delimiter }, -- special symbols (e.g. `{}` in string interpolation)

    sym('@string')             { String },       -- string literals
    sym('@string.regex')       { Constant },     -- regular expressions
    sym('@string.escape')      { SpecialChar },  -- escape sequences
    sym('@string.special')     { SpecialChar },  -- other special strings (e.g. dates)
    sym('@character')          { Character },    -- character literals
    sym('@character.special')  { Constant },     -- special characters (e.g. wildcards)
    sym('@boolean')            { Boolean },      -- boolean literals
    sym('@number')             { Number },       -- numeric literals
    sym('@float')              { Number },       -- floating-point number literals

    sym('@function')           { Function },     -- function definitions
    sym('@function.builtin')   { Define },       -- built-in functions
    sym('@function.call')      { Function },     -- function calls
    sym('@function.macro')     { Macro },        -- preprocessor macros
    sym('@method')             { Function },     -- method definitions
    sym('@method.call')        { Function },     -- method calls
    sym('@constructor')        { Type },         -- constructor calls and definitions
    sym('@parameter')          { Identifier },   -- parameters of a function

    sym('@keyword')           { Keyword },       -- various keywords
    sym('@keyword.function')  { Keyword },       -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    sym('@keyword.operator')  { Operator },      -- operators that are English words (e.g. `and` / `or`)
    sym('@keyword.return')    { Keyword },       -- keywords like `return` and `yield`

    sym('@type')              { Type },             -- type or class definitions and annotations
    sym('@type.builtin')      { Type },             -- built-in types
    sym('@type.definition')   { Typedef },          -- type definitions (e.g. `typedef` in C)
    sym('@type.qualifier')    { Type },             -- type qualifiers (e.g. `const`)
    sym('@storageclass')          { StorageClass }, -- visibility/life-time modifiers
    sym('@storageclass.lifetime') { StorageClass }, -- life-time modifiers (e.g. `static`)

    sym('@tag')               { Statement },        -- XML tag names
    sym('@tag.attribute')     { sym('@field') },    -- XML tag attributes
    sym('@tag.delimiter')     { Delimiter },        -- XML tag delimiters

    -- NOTE: This doesn't seem to work properly.
    -- sym('@spell')             { Comment },           -- for defining regions to be spellchecked

    -- Non-standard
    -- These captures are used by some languages but don't have any default highlights. They fall back to the parent capture if they are not manually defined.
    sym('@definition')             { sym('@type.definition') },  -- various definitions
    sym('@definition.constant')    { Constant },                 -- constants
    sym('@definition.function')    { sym('@function') },         -- functions
    sym('@definition.method')      { sym('@method') },           -- methods
    sym('@definition.var')         { sym('@variable') },         -- variables
    sym('@definition.parameter')   { sym('@parameter') },        -- parameters
    sym('@definition.macro')       { sym('@function.macro') },   -- preprocessor macros
    sym('@definition.type')        { sym('@type') },             -- types or classes
    sym('@definition.field')       { sym('@field') },            -- fields or properties
    sym('@definition.enum')        { sym('@type') },             -- enumerations
    sym('@definition.namespace')   { sym('@namespace') },        -- modules or namespaces
    sym('@definition.import')      { sym('@include') },          -- imported names
    sym('@definition.associated')  { sym('@type.definition') },  -- the associated type of a variable
  }
end)

local extensions = lush(function()
  return {
    diffRemoved                { base.DiffDelete },
    diffAdded                  { fg = c.dark_green2 },
    diffNoEOL                  { fg = c.magenta },
    diffLine                   { fg = c.purple },
    GitSignsAdd                { base.DiffAdd },
    GitSignsChange             { base.DiffChange },
    GitSignsDelete             { base.DiffDelete },
    fugitiveHeading            { base.Title },
    fugitiveUntrackedHeading   { base.DiffChange },
    fugitiveUnstagedHeading    { diffRemoved },
    fugitiveStagedHeading      { diffAdded },
    fugitiveModifier           { fg = c.jade },
    fugitiveUntrackedModifier  { base.DiffChange },
    fugitiveUnstagedModifier   { diffRemoved },
    fugitiveStagedModifier     { diffAdded },
    fugitiveStop               { diffRemoved },
    fugitiveDone               { diffAdded },
    fugitiveHash               { fg = c.magenta },
    fugitiveInstruction        { fg = c.red },
    fugitiveHunk               { base.Normal },
    gitcommitSummary           { fg = c.jade },
    gitcommitSelectedType      { fg = c.red },
    gitcommitSelectedFile      { diffAdded },

    NvimTreeRootFolder         { fg = c.dark_purple },
    NvimTreeFolderIcon         { fg = c.light_blue },
    NvimTreeFolderName         { fg = c.olive },
    NvimTreeGitDirty           { base.DiffChange },
    NvimTreeOpenedFile         { fg = c.jade },
    NvimTreeOpenedFolderName   { fg = c.olive },
    NvimTreeGitStaged          { base.DiffAdd },
    NvimTreeGitNew             { fg = c.dark_green2 },
    NvimTreeGitDeleted         { base.DiffDelete },
    NvimTreeSpecialFile        { base.Special },

    dashboardHeader            { fg = c.light_blue },
    dashboardFooter            { fg = c.dark_green },
    dashboardCenter            { fg = c.olive},
    dashboardShortCut          { fg = c.jade},

    CmpItemAbbrDeprecated      { fg = c.light_grey, gui = 'strikethrough' },
    CmpItemAbbrMatch           { base.Special },
    CmpItemAbbrMatchFuzzy      { CmpItemAbbrMatch },
    CmpItemKindText            { base.Comment },
    CmpItemKindVariable        { base.TSField },
    CmpItemKindField           { base.TSField },
    CmpItemKindProperty        { base.TSField },
    CmpItemKindFunction        { base.Function },
    CmpItemKindMethod          { base.Function },
    CmpItemKindConstructor     { base.TSConstBuiltin },
    CmpItemKindKeyword         { base.Special },
    CmpItemKindOperator        { base.Special },
    CmpItemKindFile            { base.Special },
    CmpItemKindValue           { base.Type },
    CmpItemKindStruct          { base.Type },
    CmpItemKindTypeParameter   { base.Type },
    CmpItemKindEnum            { base.Typedef },
    CmpItemKindEnumMember      { base.Typedef },
    CmpItemKindClass           { base.Typedef },
    CmpItemKindSnippet         { base.Typedef },
    CmpItemKindEvent           { base.Typedef },
    CmpItemKindInterface       { base.Keyword },
    CmpItemKindModule          { base.TSInclude },
    CmpItemKindReference       { base.TSInclude },
    CmpItemKindFolder          { base.Constant },
    CmpItemKindConstant        { base.Constant },
    CmpItemKindUnit            { base.Identifier },
    CmpItemKindColor           { base.Identifier },

    javascriptNumber           { base.Number },
    javascriptBoolean          { base.Boolean },
    javascriptNull             { base.Boolean },
    javascriptMessage          { base.Function },
    javascriptGlobal           { base.Special },
    javascriptConstant         { base.Constant },
    javaScriptIdentifier       { base.Statement },
    javaScriptFunction         { base.Function },
    javascriptBraces           { base.Delimiter },
    javascriptParens           { base.Delimiter },

    FzfTabline                 { fg = c.black, bg = c.light_grey },

    SagaBorder                 { fg = c.light_purple },
    TitleString                { fg = c.light_purple, gui = 'bold' },
    TitleSymbol                { fg = c.light_purple },
    CodeActionText             { fg = c.light_purple },
  }
end)

-- require('feline').reset_highlights() -- Uncomment for debugging
return lush.merge({ base, extensions })
--- vi:nowrap
