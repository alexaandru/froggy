(vim.cmd "syntax reset")

(local NONE :NONE)
(local default (or vim.g.froggy_default_bg NONE))

(fn blend [command attrs]
  (if attrs.blend
      (table.insert command (.. :blend= attrs.blend))))

(fn colorize [command attrs]
  (let [bg (or attrs.bg default)
        fg attrs.fg]
    (table.insert command (string.format "guibg=%s guifg=%s" bg fg))
    (blend command attrs)))

(fn stylize [command style color]
  (table.insert command (.. :gui= style))
  (if color
      (table.insert command (.. :guisp= color))))

(fn highlight [highlight-group attrs]
  (var attrs (or attrs {}))
  (let [cmd [:hi! highlight-group]]
    (when (. attrs vim.o.background)
      (set attrs.__index attrs)
      (set attrs (setmetatable (. attrs vim.o.background) attrs)))
    (let [link (or (and (= (type attrs) :string) attrs) attrs.link)]
      (if link (do
                 (tset cmd 3 (. cmd 2))
                 (tset cmd 2 :link)
                 (tset cmd 4 link))
          (do
            (colorize cmd attrs)
            (let [style (or (. attrs :style) NONE)]
              (if (= (type style) :table)
                  (stylize cmd (table.concat style ",") style.color)
                  (stylize cmd style))))))
    (vim.cmd (table.concat cmd " "))))

(fn [highlights]
  (let [normal highlights.Normal]
    (when normal
      (highlight :Normal normal)
      (set highlights.Normal nil))
    (each [hi-group attrs (pairs highlights)]
      (highlight hi-group attrs))))

