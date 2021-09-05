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
    NvimTreeGitStaged        { fg = c.dark_green },
    NvimTreeGitNew           { fg = c.dark_green2 },
    NvimTreeGitDeleted       { fg = c.dark_red },
    NvimTreeSpecialFile      { fg = c.magenta },

    dashboardHeader          { fg = c.light_blue },
    dashboardFooter          { fg = c.dark_green},
    dashboardCenter          { fg = c.olive},
    dashboardShortCut        { fg = c.jade},

    GitSignsAdd              { fg = c.dark_green },
    GitSignsChange           { fg = c.gold },
    GitSignsDelete           { fg = c.dark_red },

    LspSagaDiagnosticBorder         { fg = c.dark_purple },
    LspSagaDiagnosticHeader         { fg = c.dark_purple },
    LspSagaDiagnosticTruncateLine   { fg = c.dark_purple },
    LspSagaShTruncateLine           { fg = c.cyan2},
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

    fugitiveHeading             { fg = c.cyan },
    fugitiveUntrackedHeading    { fg = c.gold },
    fugitiveUnstagedHeading     { fg = c.dark_red },
    fugitiveStagedHeading       { fg = c.dark_green2 },
    fugitiveModifier            { fg = c.jade },
    fugitiveUntrackedModifier   { fg = c.gold },
    fugitiveUnstagedModifier    { fg = c.dark_red },
    fugitiveStagedModifier      { fg = c.dark_green2 },
    fugitiveStop                { fg = c.dark_red },
    fugitiveDone                { fg = c.dark_green2 },
    fugitiveHash                { fg = c.magenta },
    fugitiveInstruction {fg = c.red},
    fugitiveHunk                { fg = c.white },
    diffLine                    { fg = c.purple },
    diffRemoved                 { fg = c.dark_red },
    diffAdded                   { fg = c.dark_green2 },
    diffNoEOL                   { fg = c.magenta },

    gitcommitSummary            { fg = c.jade },
    gitcommitSelectedType       { fg = c.red },
    gitcommitSelectedFile       { fg = c.dark_green2 }

    }
end)

-- For live debugging with :Lushify, comment out this line
return M

-- ..and uncomment these two lines.
-- require('feline').reset_highlights()
-- return lush.merge({M, base})
