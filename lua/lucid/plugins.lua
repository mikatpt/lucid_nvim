local lush = require'lush'
local c = require'lucid.colors'

local M = {}

-- See options at:
-- :help nvim_tree_highlight
---@diagnostic disable: undefined-global
M = lush(function()
    return {

    NvimTreeRootFolder { fg = c.dark_purple },
    NvimTreeFolderIcon      { fg = c.light_blue },
    NvimTreeFolderName      { fg = c.olive },
    NvimTreeGitDirty        { fg = c.beige },
    NvimTreeOpenedFile      { fg = c.jade },
    NvimTreeOpenedFolderName { fg = c.olive },
    NvimTreeGitStaged       { fg = c.dark_green },
    NvimTreeGitNew          { fg = c.dark_green2 },
    NvimTreeGitDeleted      { fg = c.dark_red },
    NvimTreeSpecialFile     { fg = c.magenta },
        -- dashboardFooter 
        -- dashboardHeader
        -- dashboardCenter
        -- dashboardShortCut

    }
end)
-- return M

-- For live debugging:
local base = require'lucid.base'
return lush.merge({M, base})
