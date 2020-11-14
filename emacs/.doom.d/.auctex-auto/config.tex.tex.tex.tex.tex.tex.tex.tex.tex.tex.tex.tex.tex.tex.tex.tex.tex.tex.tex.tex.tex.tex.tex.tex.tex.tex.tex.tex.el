(TeX-add-style-hook
 "config.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex.tex"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:org85ca499"
    "sec:org6fdbfd8"
    "sec:org38e4681"
    "sec:org14baae3"
    "sec:org39487dd"
    "sec:org091531f"
    "sec:orgf68b6c6"
    "sec:org707e229"
    "sec:org40d1d19"
    "sec:org39de27c"
    "sec:org6895abf"
    "sec:org32d6555"
    "sec:org9d5e777"
    "sec:org920b677"
    "sec:orgd5f1eda"
    "sec:orgd55c3be"
    "sec:orgf815c3b"
    "sec:org40f336d"
    "sec:orgac34828"
    "sec:org75f0387"
    "sec:org3157493"
    "sec:org41a2658"
    "sec:orgcadadf7"
    "sec:org3c13013"
    "sec:orgfd6a2c6"
    "sec:orgad5f506"
    "sec:org4a08626"
    "sec:org168b6ac"
    "sec:org01aaef9"
    "sec:orgb52228f"
    "sec:orgf881578"
    "sec:org0c71d26"
    "sec:org9bc2bda"
    "sec:orgce7747f"
    "sec:org6970ea3"
    "sec:org55b6e4b"
    "sec:orgdbef18e"
    "sec:org50abb0c"
    "sec:orgac0ce41"
    "sec:org63b69d4"
    "sec:org05d3fff"
    "sec:orgdf67d01"
    "sec:org226fa6a"
    "sec:org4cd393f"
    "sec:org844f905"))
 :latex)

