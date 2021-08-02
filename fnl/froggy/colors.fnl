(set vim.g.colors_name :froggy)

(local NONE :NONE)
(local b :bold)
(local i :italic)
(local st :strikethrough)
(local inv :inverse)
(local ul :underline)
(local uc :undercurl)
(local noc :nocombine)

(local black "#2C323B")
(local gray-dark "#3c3836")
(local gray-darker "#242a32")
(local gray "#928374")
(local gray-light "#c0c0c0")
(local white "#ffffff")
(local dsdark0 "#2C323B")
(local dsdark1 "#3c3836")
(local dsdark2 "#242a32")
(local dsdark3 "#666677")
(local dsdark4 "#7c6f64")
(local ds-column "#35312f")
(local dslight0 "#d2d2d2")
(local dslight1 "#ebdbb2")
(local dslight2 "#d5c4a1")
(local dslight3 "#bdae93")
(local dslight4 "#a89984")
(local tan "#f4c069")
(local red "#fb4934")
(local red-dark "#D80000")
(local red-light "#ff4090")
(local orange "#fe8019")
(local orange-light "#f0af00")
(local yellow "#fabd2f")
(local green-dark "#50de60")
(local green-darker :Green)
(local green "#98C379")
(local green-light "#a0ff70")
(local blue "#83a598")
(local cyan "#8ec07c")
(local ice "#49a0f0")
(local teal "#00d0c0")
(local turqoise "#2bff99")
(local magenta "#d5508f")
(local magenta-dark "#bb0099")
(local pink "#ffa6ff")
(local pink-light :Pink)
(local purple "#C678DD")
(local purple-light "#A8D5E2")
(local magenta-light1 "#BD93BD")
(local magenta-light2 "#A7A2A9")
(local navyblue "#6699CC")

;; <highlight group name> {
;;   :bg <color>      ;; The color for the background, `NONE`, `FG` or `BG`
;;   :fg <color>      ;; The color for the foreground, `NONE`, `FG` or `BG`
;;   :blend <integer> ;; The |highlight-blend| value, if one is desired.
;;                    ;; Style can be 'bold', 'italic', and more.
;;                    ;; See |attr-list| for more information.
;;                    ;; It can also have a color, and/or multiple <cterm>s.
;;   :style <cterm>|{<cterm> [, <cterm>] [color=<color>]})
;; }
;; 
;; You can also link one highlight group to another:
;; <highlight group name> '<highlight group name>'

{;;
 ;; Normal
 :Normal {:fg dslight1}
 :Conceal :Statement
 ;; Float
 :NormalFloat {:fg dslight3 :bg dsdark1}
 :FloatBorder {:fg dslight2 :bg dsdark1}
 ;; Text Analysis
 :Comment {:fg dsdark3 :style i}
 :NonText {:fg blue}
 :EndOfBuffer :NonText
 :Whitespace :NonText
 ;; Literals
 :Constant {:fg tan}
 :String {:fg green}
 :Character {:fg purple}
 :Number {:fg red}
 :Boolean {:fg turqoise}
 :Float :Number
 ;; Identifiers
 :Identifier {:fg blue}
 :Function {:fg green :style b}
 ;; Syntax
 :Statement {:fg red}
 :Conditional {:fg red :style i}
 :Repeat {:fg red}
 :Label {:fg magenta-light1 :style i}
 :Operator {:fg blue}
 :Keyword {:fg red}
 :Exception {:fg red :style b}
 :Noise :Delimiter
 ;; Semantics
 :StorageClass {:fg orange}
 :Structure {:fg blue :style b}
 :Type {:fg tan}
 :Typedef {:fg cyan :style i}
 ;; Metatextual Information
 :Define {:fg blue :style noc}
 :Include {:fg blue :style noc}
 :PreProc {:fg tan}
 :Macro {:fg blue :style i}
 :PreCondit {:fg tan :style i}
 ;; Edge Cases
 :Debug :WarningMsg
 :Delimiter {:fg dslight3}
 :Special {:fg magenta :style b}
 :SpecialChar {:fg red-light :style i}
 :SpecialComment {:fg gray :style [b noc]}
 :SpecialKey :Character
 :Tag :Underlined
 ;; Help Syntax
 :Underlined {:fg turqoise :style ul}
 :Ignore {:fg gray}
 :Error {:fg red}
 :Todo {:fg tan :style b}
 :helpHyperTextJump :Underlined
 :helpSpecial :Special
 :Hint {:fg green-darker}
 :Info {:fg pink-light}
 :Warning {:fg orange}
 ;; Cursor
 :Cursor {:style inv}
 :CursorColumn {:bg gray-dark}
 :CursorIM :Cursor
 :CursorLine {:bg gray-darker}
 :CursorLineNr {:bg gray-darker :fg dslight1}
 ;; Statusline
 :StatusLine {:fg white :style ul}
 :StatusLineNC {:fg blue :style ul}
 :StatusLineTerm :StatusLine
 :StatusLineTermNC :StatusLineNC
 ;; Notify
 :EchoDEBUG {:fg :Olive}
 :EchoERROR :Error
 :EchoINFO :Info
 :EchoTRACE {:fg turqoise}
 :EchoWARN :Warning
 ;; Conditional Column Highlighting
 :ColorColumn {:bg ds-column}
 :SignColumn {:bg NONE}
 ;; Diffs
 :DiffAdd {:fg green-dark :style inv}
 :DiffChange {:fg yellow :style inv}
 :DiffDelete {:fg red :style inv}
 :DiffText {:style inv}
 ;; Folds
 :FoldColumn {:bg gray-darker :style b}
 :Folded {:fg blue :style i}
 ;; Popup Menu
 :Pmenu {:bg dsdark2 :fg dslight1}
 :PmenuSbar {:fg dsdark2}
 :PmenuSel {:style b :fg dsdark1 :bg blue}
 :PmenuThumb {:bg dsdark4}
 :WildMenu {}
 ;; Separators
 :Title {:fg orange}
 :TabLine {:bg gray-darker :fg dsdark4}
 :TabLineFill {:bg blue}
 :TabLineSel {:fg dslight3}
 :VertSplit {:fg blue}
 ;; Conceal
 :LineNr {:fg gray}
 :QuickFixLine {:bg gray-darker}
 :Visual {:style inv}
 :VisualNOS {:bg gray-darker}
 :debugBreakpoint :ErrorMsg
 :debugPC :ColorColumn
 ;; Searching
 :IncSearch {:style inv}
 :MatchParen {:fg yellow :style b}
 :Search {:bg yellow :fg dsdark2}
 ;; Spelling
 :SpellBad {:style {1 uc :color red}}
 :SpellCap {:style {1 uc :color yellow}}
 :SpellLocal {:style {1 uc :color green}}
 :SpellRare {:style {1 uc :color orange}}
 ;; Messages
 :ErrorMsg {:fg red :style b}
 :HintMsg {:fg magenta :style b}
 :InfoMsg {:fg green}
 :ModeMsg {:fg yellow}
 :WarningMsg {:fg orange}
 :Question {:fg orange-light :style ul}
 ;; Misc
 :Directory {:fg ice :style b}
 :Builtin {:fg red :style b}
 ;; LSP
 :LspDiagnosticsSignError :LspDiagnosticsVirtualTextError
 :LspDiagnosticsSignHint :LspDiagnosticsVirtualTextHint
 :LspDiagnosticsSignInformation :LspDiagnosticsVirtualTextInformation
 :LspDiagnosticsSignWarning :LspDiagnosticsVirtualTextWarning
 :LspDiagnosticsVirtualTextError :Error
 :LspDiagnosticsVirtualTextHint :Hint
 :LspDiagnosticsVirtualTextInformation :Info
 :LspDiagnosticsVirtualTextWarning :Warning
 :LspReferenceRead {:fg "#FFCA33" :style b}
 :LspReferenceText {:fg "#FFAA33" :style b}
 :LspReferenceWrite {:fg "#FF8A33" :style b}
 ;; TreeSitter (:he nvim-treesitter-highlights)
 :TSAnnotation :PreProc
 :TSAttribute :PreProc
 :TSBoolean :Boolean
 :TSCharacter :Character
 :TSConditional :Conditional
 :TSConstBuiltin :Constant
 :TSConstMacro :Define
 :TSConstant :Constant
 :TSConstructor :Identifier
 :TSDanger :WarningMsg
 :TSEmphasis {:style i}
 :TSEnviroment :Macro
 :TSEnviromentName :Type
 :TSError :Error
 :TSException :Exception
 :TSField :Identifier
 :TSFloat :Float
 :TSFuncBuiltin :Function
 :TSFuncMacro :Macro
 :TSFunction :Function
 :TSInclude :Include
 :TSKeyword :Keyword
 :TSKeywordFunction :Keyword
 :TSKeywordOperator :Operator
 :TSLabel :Label
 :TSLiteral :String
 :TSMath :Special
 :TSMethod :Method
 :TSNamespace :Include
 :TSNone {}
 :TSNote :Note
 :TSNumber :Number
 :TSOperator :Operator
 :TSParameter :Argument
 :TSParameterReference :Argument
 :TSProperty :Identifier
 :TSPunctBracket :Delimiter
 :TSPunctDelimiter :Delimiter
 :TSPunctSpecial :Delimiter
 :TSRepeat :Repeat
 :TSStrike {:style st}
 :TSString :String
 :TSStringEscape :SpecialChar
 :TSStringRegex :String
 :TSStrong {:style b}
 :TSSymbol :Symbol
 :TSTag :Label
 :TSTagDelimiter :Delimiter
 :TSText :Text
 :TSTextReference :Constant
 :TSTitle :Title
 :TSType :Type
 :TSTypeBuiltin :Type
 :TSURI :Underlined
 :TSUnderline {:style ul}
 :TSVariable :Normal
 :TSVariableBuiltin :Special
 ;TSWarning = "Warning"
 }

