(local bg (or vim.g.froggy_default_bg :NONE))

(fn set-hl [group attrs]
  (vim.api.nvim_set_hl 0 group attrs))

(fn stylize [attrs]
  (let [style attrs.style
        set-style #(tset attrs $ true)]
    (set attrs.style nil)
    (match (type style)
      :string (set-style style)
      :table (let [color style.color]
               (when color
                 (set attrs.sp color)
                 (set style.color nil))
               (vim.tbl_map set-style style)))
    attrs))

(fn hi! [group attrs]
  (if (= (type attrs) :string) (set-hl group {:link attrs})
      (let [attrs (or attrs {})
            bg (if (= :Normal group) bg :NONE)]
        (if (not attrs.bg) (set attrs.bg bg))
        (set-hl group (stylize attrs)))))

(fn [highlights]
  (when highlights.Normal ; needs to be applied 1st
    (hi! :Normal highlights.Normal)
    (set highlights.Normal nil))
  (each [group attrs (pairs highlights)]
    (hi! group attrs)))

