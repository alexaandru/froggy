-- luacheck: globals vim
vim.g.colors_name = "froggy"

-- LuaFormatter off
local NONE = "NONE"
local b    = "bold"
local i    = "italic"
local inv  = "inverse"
local ul   = "underline"
local uc   = "undercurl"
local noc  = "nocombine"

local black          = "#2C323B"
local gray_dark      = "#3c3836"
local gray_darker    = "#242a32"
local gray           = "#928374"
local gray_light     = "#c0c0c0"
local white          = "#ffffff"
local dsdark0        = "#2C323B"
local dsdark1        = "#3c3836"
local dsdark2        = "#242a32"
local dsdark3        = "#666677"
local dsdark4        = "#7c6f64"
local dsColumn       = "#35312f"
local dslight0       = "#d2d2d2"
local dslight1       = "#ebdbb2"
local dslight2       = "#d5c4a1"
local dslight3       = "#bdae93"
local dslight4       = "#a89984"
local tan            = "#f4c069"
local red            = "#fb4934"
local red_dark       = "#D80000"
local red_light      = "#ff4090"
local orange         = "#fe8019"
local orange_light   = "#f0af00"
local yellow         = "#fabd2f"
local green_dark     = "#50de60"
local green_darker   = "Green"
local green          = "#98C379"
local green_light    = "#a0ff70"
local blue           = "#83a598"
local cyan           = "#8ec07c"
local ice            = "#49a0f0"
local teal           = "#00d0c0"
local turqoise       = "#2bff99"
local magenta        = "#d5508f"
local magenta_dark   = "#bb0099"
local pink           = "#ffa6ff"
local pink_light     = "Pink"
local purple         = "#C678DD"
local purple_light   = "#A8D5E2"
local magenta_light1 = "#BD93BD"
local magenta_light2 = "#A7A2A9"
local navyblue       = "#6699CC"
-- LuaFormatter on

--[[
  <highlight group name> = {
    bg=<color>, -- The color for the background, `NONE`, `FG` or `BG`
    fg=<color>, -- The color for the foreground, `NONE`, `FG` or `BG`
    blend=<integer> -- The |highlight-blend| value, if one is desired.
    -- Style can be 'bold', 'italic', and more. See |attr-list| for more information.
    -- It can also have a color, and/or multiple <cterm>s.
    style=<cterm>|{<cterm> [, <cterm>] [color=<color>]})
	}

  You can also link one highlight group to another:
    <highlight group name> = '<highlight group name>'  ]]

return {
  -- Normal
  Normal = {bg = NONE, fg = dslight1},

  -- Text Analysis
  Comment = {fg = dsdark3, style = i},
  NonText = {fg = blue},
  EndOfBuffer = "NonText",
  Whitespace = "NonText",

  -- Literals
  Constant = {fg = orange_light},
  String = {fg = green},
  Character = {fg = purple},
  Number = {fg = purple},
  Boolean = {fg = red_dark},
  Float = "Number",

  -- Identifiers
  Identifier = {fg = blue},
  Function = {fg = green, style = b},

  -- Syntax
  Statement = {fg = red},
  Conditional = {fg = red, style = i},
  Repeat = {fg = red},
  Label = {fg = magenta_light1, style = i},
  Operator = {fg = blue},
  Keyword = {fg = red},
  Exception = {fg = red, style = b},
  Noise = "Delimiter",

  -- Metatextual Information
  PreProc = {fg = tan},
  Include = {fg = blue, style = noc},
  Define = {fg = blue, style = noc},
  Macro = {fg = blue, style = i},
  PreCondit = {fg = tan, style = i},

  -- Semantics
  Type = {fg = yellow},
  StorageClass = {fg = orange},
  Structure = {fg = blue, style = b},
  Typedef = {fg = cyan, style = i},

  -- Edge Cases
  Special = {fg = magenta, style = b},
  SpecialChar = {fg = red_light, style = i},
  SpecialKey = "Character",
  Tag = "Underlined",
  Delimiter = {fg = orange},
  SpecialComment = {fg = gray, style = {b, noc}},
  Debug = "WarningMsg",

  -- Help Syntax
  Underlined = {fg = turqoise, style = ul},
  Ignore = {fg = gray},
  Error = {fg = red_dark},
  Todo = {fg = yellow, style = {b, ul}},
  helpHyperTextJump = "Underlined",
  helpSpecial = "Special",
  Hint = {fg = green_darker},
  Info = {fg = pink_light},
  Warning = {fg = orange},

  -- Status Line
  StatusLine = {fg = white, style = ul},
  StatusLineNC = {fg = blue, style = ul},
  StatusLineTerm = "StatusLine",
  StatusLineTermNC = "StatusLineNC",

  -- Separators
  VertSplit = {fg = blue},
  TabLine = {bg = gray_darker, fg = dsdark4},
  TabLineFill = {bg = blue},
  TabLineSel = {fg = dslight3},
  Title = {fg = dslight3},

  -- Conceal={}
  CursorLine = {bg = gray_darker},
  CursorLineNr = {bg = gray_darker, fg = dslight1},
  debugBreakpoint = "ErrorMsg",
  debugPC = "ColorColumn",
  LineNr = {fg = gray},
  QuickFixLine = {bg = gray_darker},
  Visual = {style = inv},
  VisualNOS = {bg = gray_darker},

  -- Popup Menu
  Pmenu = {bg = dsdark2, fg = dslight1},
  PmenuSbar = {fg = dsdark2},
  PmenuSel = {fg = dsdark1, bg = blue, style = b},
  PmenuThumb = {bg = dsdark4},
  WildMenu = {},

  -- Folds
  FoldColumn = {bg = gray_darker, style = b},
  Folded = {fg = blue, style = i},

  -- Diffs
  DiffAdd = {fg = green_dark, style = inv},
  DiffChange = {fg = yellow, style = inv},
  DiffDelete = {fg = red, style = inv},
  DiffText = {style = inv},

  -- Searching
  IncSearch = {style = inv},
  Search = {bg = yellow, fg = dsdark2},
  MatchParen = {fg = yellow, style = b},

  -- Spelling
  SpellBad = {style = {uc, color = red}},
  SpellCap = {style = {uc, color = yellow}},
  SpellLocal = {style = {uc, color = green}},
  SpellRare = {style = {uc, color = orange}},

  -- Conditional Column Highlighting
  ColorColumn = {bg = dsColumn},
  SignColumn = {bg = NONE},

  -- Messages
  ErrorMsg = {fg = red, style = b},
  HintMsg = {fg = magenta, style = b},
  InfoMsg = {fg = green},
  ModeMsg = {fg = yellow},
  WarningMsg = {fg = orange},
  Question = {fg = orange_light, style = ul},

  -- LSP
  LspDiagnosticsVirtualTextError = "Error",
  LspDiagnosticsVirtualTextWarning = "Warning",
  LspDiagnosticsVirtualTextInformation = "Info",
  LspDiagnosticsVirtualTextHint = "Hint",

  LspDiagnosticsSignError = "LspDiagnosticsVirtualTextError",
  LspDiagnosticsSignWarning = "LspDiagnosticsVirtualTextWarning",
  LspDiagnosticsSignInformation = "LspDiagnosticsVirtualTextInformation",
  LspDiagnosticsSignHint = "LspDiagnosticsVirtualTextHint",

  LspReferenceText = {fg = "#FFAA33", style = b},
  LspReferenceRead = {fg = "#FFCA33", style = b},
  LspReferenceWrite = {fg = "#FF8A33", style = b},

  -- Cursor
  Cursor = {style = inv},
  CursorIM = "Cursor",
  CursorColumn = {bg = gray_dark},

  -- Notify
  EchoERROR = {fg = red_dark},
  EchoWARN = {fg = orange},
  EchoINFO = {fg = pink_light},
  EchoTRACE = {fg = turqoise},
  EchoDEBUG = {fg = "Olive"},

  -- Misc
  Directory = {fg = ice, style = b},
}
