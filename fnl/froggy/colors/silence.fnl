(set vim.g.colors_name :silence)

;; <highlight group name> {
;;   :bg <color>      ;; The color for the background
;;   :fg <color>      ;; The color for the foreground
;;   :blend <integer> ;; The |highlight-blend| value, if one is desired.
;;                    ;; Style can be 'bold', 'italic', and more.
;;                    ;; See |attr-list| for more information.
;;                    ;; It can also have a color, and/or multiple <cterm>s.
;;   :style <cterm>|{<cterm> [, <cterm>] [color=<color>]})
;; }
;; 
;; You can also link one highlight group to another:
;; <highlight group name> '<highlight group name>'

;; https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/theme.lua#L266-L280
;; https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/semantic_tokens.lua
;; https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/theme.lua#L255-L272

;; fnlfmt: skip
(let [b :bold
      i :italic
      inv :reverse
      ul :underline
      uc :undercurl
      ud :underdouble
      udd :underdotted
      udh :underdashed]
  {;; Normal
   :Normal {:fg "#dbebb2"}
   :Conceal :Statement
   ;; WinBar
   :WinBar {:fg "#f4c069"}
   :WinBarNC {:fg "#227777"}
   ;; Float
   :NormalFloat :PMenu
   :FloatBorder {:bg "#333363" :fg "#229999" :blend 10}
   :FloatTitle :PMenu
   ;; Text Analysis
   :Comment {:fg "#666677" :style i}
   :NonText {:fg "#83a598"}
   :EndOfBuffer :NonText
   :Whitespace :NonText
   ;; Literals
   :Constant {:fg "#52c9c9" :bg "#2e1c3f"}
   :String :Identifier
   :Character :Identifier
   :Number :Identifier
   :Boolean :Identifier
   :Float :Number
   ;; Identifiers
   :Variable {:fg "#229999"}
   :Identifier {:fg "#666686"}
   :Function :Identifier
   ;; Syntax
   :Statement :Identifier
   :Conditional :Identifier
   :Repeat :Identifier
   :Label :Identifier
   :Operator :Identifier
   :Keyword {:fg "#eeb943"}
   :Exception :Identifier
   :Noise :Delimiter
   ;; Semantics
   :StorageClass :Identifier
   :Structure :Identifier
   :Type :Identifier
   :Typedef :Identifier
   ;; Metatextual Information
   :Namespace {:fg "#ff3183"}
   :Define :Identifier
   :Include :Namespace
   :PreProc :Identifier
   :Macro :Identifier
   :PreCondit :Identifier
   ;; Edge Cases
   :Debug :WarningMsg
   :Delimiter :Identifier
   :Special :Identifier
   :SpecialChar :Identifier
   :SpecialComment :Identifier
   :SpecialKey :Identifier
   :Tag :Identifier
   ;; Help Syntax
   :Underlined {:fg "#2bff99" :style ul}
   :Ignore {:fg "#928374"}
   :Error {:fg "#ff1153" :style b}
   :Todo {:fg "#eeb943" :bg "#551133" :style b}
   "@text.danger" :Todo
   "@text.warning" :Todo
   "@text.note" {:fg "#fff0f0"}
   "@text.uri" {:fg "#91ddff" :style [i ul]}
   :helpHyperTextJump :Underlined
   :helpSpecial :Special
   :Hint {:fg "#41624d"}
   :Info {:fg "#705090"}
   :Warning {:fg "#905070"}
   ;; Cursor
   :Cursor {:style inv}
   :CursorColumn {:bg "#3c3836"}
   :CursorIM :Cursor
   :CursorLine {:bg "#242a32"}
   :CursorLineNr {:bg "#242a32" :fg "#ebdbb2"}
   ;; Statusline
   :StatusLine {:fg :White :style ul}
   :StatusLineNC {:fg "#333c61" :style ul}
   :StatusLineTerm :StatusLine
   :StatusLineTermNC :StatusLineNC
   ;; Notify
   :EchoDEBUG {:fg :Olive}
   :EchoERROR :Error
   :EchoINFO :Info
   :EchoTRACE {:fg "#2bff99"}
   :EchoWARN :Warning
   ;; Conditional Column Highlighting
   :ColorColumn {:bg "#35312f"}
   :SignColumn {:bg nil}
   ;; Diffs
   :diffAdded {:fg "#50de60"}
   :diffChanged {:fg "#faad2f"}
   :diffRemoved {:fg "#FF3777"}
   :diffCommon {:style inv}
   ;; Folds
   :FoldColumn {:bg "#242a32" :style b}
   :Folded {:fg "#83a598" :style i}
   ;; Popup Menu
   :Pmenu {:bg "#333363" :fg "#ebdbb2" :blend 10}
   :PmenuSel {:bg "#22ffff" :fg "#333363" :style b}
   :PmenuSbar {:fg "#ebdbb2" :bg "#537568"}
   :PmenuThumb {:bg "#335548"}
   :WildMenu :Pmenu
   ;; Separators
   :Title {:fg "#fe8019"}
   :TabLine {:bg "#242a32" :fg "#7c6f64"}
   :TabLineFill {:bg "#83a598"}
   :TabLineSel {:fg "#bdae93"}
   :VertSplit {:fg "#83a598"}
   ;; Conceal
   :LineNr {:fg "#928374"}
   :QuickFixLine {:bg "#242a32"}
   :Visual {:style inv}
   :VisualNOS {:bg "#242a32"}
   :debugBreakpoint :ErrorMsg
   :debugPC :ColorColumn
   ;; Searching
   :IncSearch {:style inv}
   :MatchParen {:fg "#fabd2f" :style b}
   :Search {:bg "#fabd2f" :fg "#242a32"}
   ;; Spelling
   :SpellBad {:style {1 uc :color "#227777"}}
   :SpellCap {:style {1 uc :color "#fabd2f"}}
   :SpellLocal {:style {1 uc :color "#98C379"}}
   :SpellRare {:style {1 uc :color "#fe8019"}}
   ;; Messages
   :ErrorMsg {:fg "#227777" :style b}
   :HintMsg {:fg "#d5508f" :style b}
   :InfoMsg {:fg "#98C379"}
   :ModeMsg {:fg "#fabd2f"}
   :WarningMsg {:fg "#fe8019"}
   :Question {:fg "#f0af00" :style ul}
   ;; Misc
   :Directory {:fg "#49a0f0" :style b}
   :Builtin {:fg "#227777" :style b}
   ;; LSP
   :DiagnosticError :Error
   :DiagnosticHint :Hint
   :DiagnosticInfo :Info
   :DiagnosticWarn :Warning
   :DiagnosticUnderlineError {:style {1 uc :color "#ff1153"}}
   :DiagnosticUnderlineWarn {:style {1 uc :color "#fabd2f"}}
   :DiagnosticUnderlineInfo {:style {1 uc :color "#905070"}}
   :DiagnosticUnderlineHint {:style {1 uc :color :Green}}
   :LspReferenceRead {:fg "#FFCA33" :style b}
   :LspReferenceText {:fg "#FFAA33" :style b}
   :LspReferenceWrite {:fg "#FF8A33" :style b}
   :LspCodeLens {:fg "#22ffff" :bg "#3e1c71" :style i}
   :LspCodeLensSeparator nil
   :LspSignatureActiveParameter {:style {1 uc :color "#fabd2f"}}
   :LspInlayHint :Comment
   ;; ZSH
   :zshQuoted :SpecialChar
   :zshPOSIXQuoted :SpecialChar
   :zshStringDelimiter :Delimiter
   :zshString :String
   :zshPOSIXString :zshString
   :zshJobSpec :Special
   :zshNumber :Number
   :zshPrecommand :Special
   :zshDelimiter :Delimiter
   :zshConditional :Conditional
   :zshCase :zshConditional
   :zshCaseWord :zshConditional
   :zshCaseIn :zshConditional
   :zshCasePattern :Constant
   :zshRepeat :Repeat
   :zshVariable :Identifier
   :zshException :Exception
   :zshKeyword :Keyword
   :zshKSHFunction :zshFunction
   :zshFunction :Function
   :zshOperator :Operator
   :zshRedir :Operator
   :zshHereDoc :Special
   :zshVariableDef :zshVariable
   :zshShortDeref :zshDereferencing
   :zshLongDeref :zshDereferencing
   :zshDeref :zshDereferencing
   :zshDollarVar :zshDereferencing
   :zshCommands :Keyword
   :zshOption :Constant
   :zshOptStart :Keyword
   :zshComment :Comment
   :zshTypes :Type
   :zshSubst :PreProc
   :zshOldSubst :zshSubst
   :zshMathSubst :zshSubst
   :zshSubstQuoted :zshSubst
   :zshSubstDelim :zshSubst
   :zshBrackets :Delimiter
   :zshParentheses :Delimiter
   :zshGlob :Constant
   :zshHereDocSync :Special
   :zshHereDocEndSync :Special
   :zshTodo :Todo
   :zshPreProc :PreProc
   :zshDereferencing :PreProc
   :zshSwitches :Special
   ;; TreeSitter (:he nvim-treesitter-highlights)
   ;:TSAnnotation :PreProc
   ;:TSAttribute :PreProc
   ;:TSBoolean :Boolean
   ;:TSCharacter :Character
   ;:TSConditional :Conditional
   ;:TSConstBuiltin :Constant
   ;:TSConstMacro :Define
   ;:TSConstant :Constant
   ;:TSConstructor :Identifier
   ;:TSDanger :WarningMsg
   ;:TSEmphasis {:style i}
   ;:TSEnviroment :Macro
   ;:TSEnviromentName :Type
   ;:TSError :Error
   ;:TSException :Exception
   ;:TSField :Identifier
   ;:TSFloat :Float
   ;:TSFuncBuiltin :Function
   ;:TSFuncMacro :Macro
   ;:TSFunction :Function
   ;:TSInclude :Include
   ;:TSKeyword :Keyword
   ;:TSKeywordFunction :Keyword
   ;:TSKeywordOperator :Operator
   ;:TSLabel :Label
   ;:TSLiteral :String
   ;:TSMath :Special
   ;:TSMethod :Method
   ;:TSNamespace :Include
   ;:TSNone {}
   ;:TSNote :Note
   ;:TSNumber :Number
   ;:TSOperator :Operator
   ;:TSParameter :Argument
   ;:TSParameterReference :Argument
   ;:TSProperty :Identifier
   ;:TSPunctBracket :Delimiter
   ;:TSPunctDelimiter :Delimiter
   ;:TSPunctSpecial :Delimiter
   ;:TSRepeat :Repeat
   ;:TSStrike {:style ul}
   ;:TSString :String
   ;:TSStringEscape :SpecialChar
   ;:TSStringRegex :String
   ;:TSStrong {:style b}
   ;:TSSymbol :Symbol
   ;:TSTag :Label
   ;:TSTagDelimiter :Delimiter
   ;:TSText :Text
   ;:TSTextReference :Constant
   ;:TSTitle :Title
   ;:TSType :Type
   ;:TSTypeBuiltin :Type
   ;:TSURI :Underlined
   ;:TSUnderline {:style ul}
   ;:TSVariable :Normal
   ;:TSVariableBuiltin :Special
   ;TSWarning :Warning
   "@string" {:fg "#f1ff5d"}
   "@variable" :Variable
   "@constant" :Constant
   ;; Semantic Tokens
   ;"@lsp.mod.defaultLibrary" :Special
   ;"@lsp.mod.definition" :Define
   ;"@lsp.typemod.parameter.definition" :Special
   "@lsp.typemod.variable.readonly" :Constant
   "@lsp.type.variable" :Variable
   "@lsp.type.keyword" :Keyword
   "@lsp.type.namespace" :Include
   ;"@lsp.mod.readonly" :Constant
   })

