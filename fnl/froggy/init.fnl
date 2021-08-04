(local NONE :NONE)
(local default (or vim.g.froggy_default_bg NONE))
(local ins table.insert)
(local concat table.concat)
(local fmt string.format)

(fn blend [cmd attrs]
  (if attrs.blend (ins cmd (fmt "blend=%s" attrs.blend))))

(fn colorize [cmd attrs]
  (let [bg (or attrs.bg default)
        fg attrs.fg]
    (ins cmd (fmt "guibg=%s guifg=%s" bg fg))
    (blend cmd attrs)))

(fn stylize [cmd style color]
  (ins cmd (fmt "gui=%s" style))
  (if color (ins cmd (fmt "guisp=%s" color))))

;; TODO: https://github.com/neovim/neovim/issues/9876
(fn hi! [group attrs]
  (let [cmd [:hi! group]
        attrs (or attrs {})
        link (if (= (type attrs) :string) attrs false)]
    (if link (vim.cmd (concat [:hi! :link group link] " "))
        (let [style (or (. attrs :style) NONE)]
          (colorize cmd attrs)
          (if (= (type style) :table)
              (stylize cmd (concat style ",") style.color)
              (stylize cmd style))
          (vim.cmd (concat cmd " "))))))

(fn [highlights]
  (let [normal highlights.Normal]
    (when normal ; needs to be applied 1st
      (hi! :Normal normal)
      (set highlights.Normal nil))
    (each [group attrs (pairs highlights)]
      (hi! group attrs))))

