(set vim.g.colors_name :popping)

;; `and locking` clone

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
(let [b :bold
      i :italic
      inv :reverse
      ul :underline
      uc :undercurl]
  {;; Normal
   :Normal {:fg "#ebdbb2"}
   :Conceal :Statement
   ;; Float
   :NormalFloat {:fg "#bdae93" :bg "#3c3836"}
   :FloatBorder {:fg "#d5c4a1" :bg "#3c3836"}
   ;; Text Analysis
   :Comment {:fg "#666677" :style i}
   :NonText {:fg "#77bbca"}
   :EndOfBuffer :NonText
   :Whitespace :NonText
   ;; Literals
   :Constant {:fg "#f4c069"}
   :String {:fg "#b8bb26"}
   :Character {:fg "#C678DD"}
   :Number {:fg "#f08290"}
   :Boolean {:fg "#f08290"}
   :Float :Number
   ;; Identifiers
   :Identifier {:fg "#87cbca"}
   :Function {:fg "#fabd2f"}
   ;; Syntax
   :Statement {:fg "#e02730"}
   :Conditional {:fg "#e02730" :style i}
   :Repeat {:fg "#e02730"}
   :Label {:fg "#BD93BD" :style i}
   :Operator {:fg "#77bbca"}
   :Keyword {:fg "#e02730"}
   :Exception {:fg "#e02730" :style b}
   :Noise :Delimiter
   ;; Semantics
   :StorageClass {:fg "#fe8019"}
   :Structure {:fg "#77bbca" :style b}
   :Type {:fg "#f4c069"}
   :Typedef {:fg "#8ec07c" :style i}
   ;; Metatextual Information
   :Define {:fg "#77bbca"}
   :Include {:fg "#77bbca"}
   :PreProc {:fg "#f4c069"}
   :Macro {:fg "#77bbca" :style i}
   :PreCondit {:fg "#f4c069" :style i}
   ;; Edge Cases
   :Debug :WarningMsg
   :Delimiter {:fg "#bdae93"}
   :Special {:fg "#d5508f" :style b}
   :SpecialChar {:fg "#ff4090" :style i}
   :SpecialComment {:fg "#928374" :style b}
   :SpecialKey :Character
   :Tag :Underlined
   ;; Help Syntax
   :Underlined {:fg "#2bff99" :style ul}
   :Ignore {:fg "#928374"}
   :Error {:fg "#ff5943"}
   :Todo {:fg "#f4c069" :style b}
   :helpHyperTextJump :Underlined
   :helpSpecial :Special
   :Hint {:fg "#41624d"}
   :Info {:fg "#41424d"}
   :Warning {:fg "#71626d"}
   ;; Cursor
   :Cursor {:style inv}
   :CursorColumn {:bg "#3c3836"}
   :CursorIM :Cursor
   :CursorLine {:bg "#242a32"}
   :CursorLineNr {:bg "#242a32" :fg "#ebdbb2"}
   ;; Statusline
   :StatusLine {:fg :White :style ul}
   :StatusLineNC {:fg "#77bbca" :style ul}
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
   :DiffAdd {:fg "#50de60" :style inv}
   :DiffChange {:fg "#fabd2f" :style inv}
   :DiffDelete {:fg "#e02730" :style inv}
   :DiffText {:style inv}
   ;; Folds
   :FoldColumn {:bg "#242a32" :style b}
   :Folded {:fg "#77bbca" :style i}
   ;; Popup Menu
   :Pmenu {:bg "#242a32" :fg "#ebdbb2"}
   :PmenuSbar {:fg "#242a32"}
   :PmenuSel {:style b :fg "#3c3836" :bg "#77bbca"}
   :PmenuThumb {:bg "#7c6f64"}
   :WildMenu {}
   ;; Separators
   :Title {:fg "#fe8019"}
   :TabLine {:bg "#242a32" :fg "#7c6f64"}
   :TabLineFill {:bg "#77bbca"}
   :TabLineSel {:fg "#bdae93"}
   :VertSplit {:fg "#77bbca"}
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
   :SpellBad {:style {1 uc :color "#e02730"}}
   :SpellCap {:style {1 uc :color "#fabd2f"}}
   :SpellLocal {:style {1 uc :color "#fabd2f"}}
   :SpellRare {:style {1 uc :color "#fe8019"}}
   ;; Messages
   :ErrorMsg {:fg "#e02730" :style b}
   :HintMsg {:fg "#d5508f" :style b}
   :InfoMsg {:fg "#fabd2f"}
   :ModeMsg {:fg "#fabd2f"}
   :WarningMsg {:fg "#fe8019"}
   :Question {:fg "#f0af00" :style ul}
   ;; Misc
   :Directory {:fg "#49a0f0" :style b}
   :Builtin {:fg "#e02730" :style b}
   ;; LSP
   :DiagnosticError :Error
   :DiagnosticHint :Hint
   :DiagnosticInfo :Info
   :DiagnosticWarn :Warning
   :DiagnosticUnderlineError {:style {1 uc :color "#e02730"}}
   :DiagnosticUnderlineWarn {:style {1 uc :color "#71626d"}}
   :DiagnosticUnderlineInfo {:style {1 uc :color "#61525d"}}
   :DiagnosticUnderlineHint {:style {1 uc :color :Green}}
   :LspReferenceRead {:fg "#FFCA33" :style [b inv]}
   :LspReferenceText {:fg "#FFAA33" :style [b inv]}
   :LspReferenceWrite {:fg "#FF8A33" :style [b inv]}
   :LspCodeLens {:fg "#00d0c0" :style i}
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
   :TSStrike {:style ul}
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
   ;TSWarning :Warning
   })

