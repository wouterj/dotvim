-------------------------------------------------------------------------
-- TYPEWRITER NORD
--
-- A (mostly) monochrome color theme for Neovim, with a focus on types.
--
-- Based on [Typewriter.vim](https://github.com/logico/typewriter-vim)
-- Inspired by [Nord Theme](https://www.nordtheme.com/)
-- Created by Wouter de Jong, 2023
-------------------------------------------------------------------------

local colors
if vim.o.background == "dark" then
    colors = {
        bg     = "#2e3440",
        cursor = "#81a1c1",
        var    = "#81a1c1",

        -- Whites
        mono01 = "#e2e8f3",
        mono02 = "#d8dee9",
        mono03 = "#ced4df",
        mono04 = "#c4cad5",
        mono05 = "#bac0cb",
        mono06 = "#b0b6c1",
        mono07 = "#a6acb7",

        -- Grays
        mono11 = "#8aa1b7",
        mono12 = "#8097ad",
        mono13 = "#768da3",
        mono14 = "#6c8399",
        mono15 = "#62798f",

        -- Blacks
        mono21 = "#424854",
        mono22 = "#2e3440",
        mono23 = "#242a36",
        mono24 = "#1a202c",
        mono25 = "#060c18",
    }
else
    colors = {
        bg     = "#e5e9f0",
        cursor = "#88c0d0",
        var    = "#5e81ac",

        -- Blacks
        mono01 = "#060c18",
        mono02 = "#1a202c",
        mono03 = "#242a36",
        mono04 = "#2e3440",
        mono05 = "#383e4a",
        mono06 = "#424854",
        mono07 = "#4c525e",

        -- Grays
        mono11 = "#63768a",
        mono12 = "#778a9e",
        mono13 = "#8194a8",
        mono14 = "#8b9eb2",
        mono15 = "#95a8bc",

        -- Whites
        mono21 = "#b0b6c1",
        mono22 = "#c4cad5",
        mono23 = "#ced4df",
        mono24 = "#d8dee9",
        mono25 = "#e2e8f3",
    }
end

colors.red = "#bf616a"
colors.orange = "#d08770"
colors.yellow = "#ebcb8b"
colors.green = "#a3be8c"
colors.magenta = "#b48ead"

local groups = {
    Cursor =          {                     bg = colors.cursor                    },
    Normal =          { fg = colors.mono05, bg = colors.bg                        },
    Directory =       { fg = colors.mono03,                                       },
    Title =           { fg = colors.mono05,                     bold = true       },
    Special =         { fg = colors.mono02,                                       },
    Comment =         { fg = colors.mono15,                     italic = true     },
    Constant =        { fg = colors.mono04,                                       },
    String =          { fg = colors.mono14,                                       },
    Number =          { fg = colors.mono02,                                       },
    htmlTagName =     { fg = colors.mono05,                                       },
    Identifier =      { fg = colors.mono06,                                       },
    Statement =       { fg = colors.mono11,                                       },
    PreProc =         { fg = colors.mono12,                                       },
    Structure =       { fg = colors.mono06,                                       },
    Type =            { fg = colors.mono07,                     bold = true       },
    Function =        { fg = colors.mono07,                                       },
    Repeat =          { fg = colors.mono12,                                       },
    Operator =        { fg = colors.mono06,                                       },
    Error =           { fg = colors.orange,                                       },
    SpellBad =        { fg = colors.orange,                                       },
    TODO =            { fg = colors.red,                        italic = true     },
    LineNr =          { fg = colors.mono21,                                       },
    CursorLine =      {                                                           },
    CursorLineNr =    { fg = colors.mono01,                                       },
    Search =          { fg = "#383e4a",     bg = colors.yellow,                   },
    IncSearch =       { fg = "#383e4a",     bg = colors.yellow,                   },
    WildMenu =        { fg = colors.mono05,                                       },
    Folded =          { fg = colors.mono15,                     bold = true       },

    ModeMsg =         { fg = colors.mono05,                                       },
    MoreMsg =         { fg = colors.mono05,                                       },
    WarningMsg =      { fg = colors.orange,                                       },
    ErrorMsg =        { fg = colors.red,                        italic = true     },
    
    Visual =          { fg = "#383e4a", bg = "#8fbcbb"                        },
    SpecialKey =      {                                                           },
    NonText =         { fg = colors.mono25                                        },
    MatchParen =      { fg = colors.mono02, bg = colors.mono23                    },
    Pmenu =           { fg = colors.mono05, bg = colors.mono24                    },
    PmenuSel =        { fg = colors.mono25, bg = colors.mono02                    },
    VertSplit =       { fg = colors.mono15                                        },
    ColorColumn =     { bg = colors.mono24                                        },
    Underlined =      { fg = "#949494",                         underline = true  },

    SignColumn =      {                                                           },
    StatusLine =      {                     bg = colors.mono24                    },
    StatusLineNC =    { link = "StatusLine" },

    character =       { link = "constant"   },
    number =          { link = "constant"   },
    boolean =         { link = "Type"       },
    Boolean =         { link = "Type"       },
    Float =           { link = "Number"     },
    Conditional =     { link = "Repeat"     },
    Label =           { link = "Statement"  },
    Keyword =         { link = "Statement"  },
    Exception =       { link = "Statement"  },
    Include =         { link = "PreProc"    },
    Define =          { link = "PreProc"    },
    Macro =           { link = "PreProc"    },
    PreCondit =       { link = "PreProc"    },
    StorageClass =    { link = "Structure"  },
    Typedef =         { link = "Type"       },
    htmlTag =         { link = "Special"    },
    Tag =             { link = "Special"    },
    SpecialChar =     { link = "Special"    },
    Delimiter =       { link = "Special"    },
    SpecialComment =  { link = "Special"    },
    Debug =           { link = "Special"    },

    DiagnosticError = { link = "ErrorMsg"   },
    DiagnosticWarn =  { link = "WarningMsg" },
    DiagnosticInfo =  { link = "Normal"     },

    ["@type.qualifier"] = { italic = true },
    ["@constructor"]    = { link = "Type" },
    ["@variable"]       = { fg = colors.var },
    ["@constant.builtin"] = { link = "Type" },
}

vim.cmd.hi("clear")
vim.cmd.syntax("reset")

vim.g.colors_name = "nord-typewriter"
for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
end
