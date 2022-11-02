-- stylua: ignore start
local lush = require'lush'
local c = require'lucid.colors'

local M = {}

local base = require'lucid.base'
-- See options at:
-- :help nvim_tree_highlight
---@diagnostic disable: undefined-global
M = lush(function()
    return {

    NvimTreeRootFolder       { fg = c.dark_purple },
    NvimTreeFolderIcon       { fg = c.light_blue },
    NvimTreeFolderName       { fg = c.olive },
    NvimTreeGitDirty         { fg = c.beige },
    NvimTreeOpenedFile       { fg = c.jade },
    NvimTreeOpenedFolderName { fg = c.olive },
    NvimTreeGitStaged        { base.DiffAdd },
    NvimTreeGitNew           { fg = c.dark_green2 },
    NvimTreeGitDeleted       { base.DiffDelete },
    NvimTreeSpecialFile      { base.Special },

    dashboardHeader          { fg = c.light_blue },
    dashboardFooter          { fg = c.dark_green },
    dashboardCenter          { fg = c.olive},
    dashboardShortCut        { fg = c.jade},

    GitSignsAdd              { base.DiffAdd },
    GitSignsChange           { base.DiffChange },
    GitSignsDelete           { base.DiffDelete },

    CmpItemAbbrDeprecated    { fg = c.light_grey, gui = 'strikethrough' },

    CmpItemAbbrMatch         { base.Special },
    CmpItemAbbrMatchFuzzy    { CmpItemAbbrMatch },

    CmpItemKindText          { base.Comment },
    CmpItemKindVariable      { base.TSField },
    CmpItemKindField         { base.TSField },
    CmpItemKindProperty      { base.TSField },
    CmpItemKindFunction      { base.Function },
    CmpItemKindMethod        { base.Function },
    CmpItemKindConstructor   { base.TSConstBuiltin },
    CmpItemKindKeyword       { base.Special },
    CmpItemKindOperator      { base.Special },
    CmpItemKindFile          { base.Special },
    CmpItemKindValue         { base.Type },
    CmpItemKindStruct        { base.Type },
    CmpItemKindTypeParameter { base.Type },
    CmpItemKindEnum          { base.Typedef },
    CmpItemKindEnumMember    { base.Typedef },
    CmpItemKindClass         { base.Typedef },
    CmpItemKindSnippet       { base.Typedef },
    CmpItemKindEvent         { base.Typedef },
    CmpItemKindInterface     { base.Keyword },
    CmpItemKindModule        { base.TSInclude },
    CmpItemKindReference     { base.TSInclude },
    CmpItemKindFolder        { base.Constant },
    CmpItemKindConstant      { base.Constant },
    CmpItemKindUnit          { base.Identifier },
    CmpItemKindColor         { base.Identifier },

    LspSignatureActiveParameter     { base.Visual },
    LspSagaDiagnosticBorder         { fg = c.dark_purple },
    LspSagaDiagnosticHeader         { fg = c.dark_purple },
    LspSagaDiagnosticTruncateLine   { fg = c.dark_purple },
    LspSagaShTruncateLine           { fg = c.cyan2 },
    LspSagaSignatureHelpBorder      { fg = c.cyan2 },
    LspSagaHoverBorder              { fg = c.cyan2 },
    LspSagaDocTruncateLine          { fg = c.cyan2 },
    LspSagaCodeActionTitle          { fg = c.light_blue },
    LspSagaCodeActionBorder         { fg = c.cyan2 },
    LspSagaCodeActionTruncateLine   { fg = c.cyan2 },
    LspSagaCodeActionContent        { fg = c.olive},
    LspSagaRenameBorder             { fg = c.cyan2},
    LspSagaDefPreviewBorder         { fg = c.dark_purple},
    LspLinesDiagBorder              { fg = c.dark_purple },
    -- LspSagaAutoPreview {},
    -- LspFloatWinBorder { fg = c.dark_purple },
    -- LspSagaBorderTitle {base.Title},
    -- TargetWord {base.Error},
    -- ReferencesCount {base.Title},
    -- ReferencesIcon {base.Special},
    -- DefinitionCount {base.Title},
    -- TargetFileName {base.Comment},
    -- DefinitionIcon {base.Special},
    -- ProviderTruncateLine { fg = c.dark_purple },
    -- DefinitionPreviewTitle { base.Title },

    diffLine                    { fg = c.purple },
    diffRemoved                 { fg = c.dark_red },
    diffAdded                   { fg = c.dark_green2 },
    diffNoEOL                   { fg = c.magenta },
    fugitiveHeading             { fg = c.cyan },
    fugitiveUntrackedHeading    { base.DiffChange },
    fugitiveUnstagedHeading     { diffRemoved },
    fugitiveStagedHeading       { diffAdded },
    fugitiveModifier            { fg = c.jade },
    fugitiveUntrackedModifier   { base.DiffChange },
    fugitiveUnstagedModifier    { diffRemoved },
    fugitiveStagedModifier      { diffAdded },
    fugitiveStop                { diffRemoved },
    fugitiveDone                { diffAdded },
    fugitiveHash                { fg = c.magenta },
    fugitiveInstruction         { fg = c.red },
    fugitiveHunk                { fg = c.white },

    gitcommitSummary            { fg = c.jade },
    gitcommitSelectedType       { fg = c.red },
    gitcommitSelectedFile       { diffAdded },

    javascriptNumber            { base.Number },
    javascriptBoolean           { base.Boolean },
    javascriptNull              { base.Boolean },
    javascriptMessage           { base.Function },
    javascriptGlobal            { base.Special },
    javascriptConstant          { base.Constant },
    javaScriptIdentifier        { base.Statement },
    javaScriptFunction          { base.Function },
    javascriptBraces            { base.Delimiter },
    javascriptParens            { base.Delimiter },

    }
end)

-- For live debugging with :Lushify, comment out this line
return M

-- ..and uncomment these two lines.
-- require('feline').reset_highlights()
-- return lush.merge({M, base})
