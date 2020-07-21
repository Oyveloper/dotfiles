(package-initialize)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "SF Mono" :size 14))

(use-package avy
  :ensure t)

(setq mac-option-modifier nil
      mac-command-modifier 'meta)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; Setting the kill shortcut
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

     (use-package popup-kill-ring
       :ensure t
       :bind ("M-p" . popup-kill-ring))

(global-set-key (kbd "M-\"") 'insert-pair)
(global-set-key (kbd "M-\'") 'insert-pair)

  (setq rainbow-delimiters-max-face-count 9)

(use-package dart-mode
  ;; Optional
  :hook (dart-mode . flutter-test-mode))

(use-package flutter
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload))
  :custom
  (flutter-sdk-path "/Users/oyvind/flutter/"))

;; Optional
(use-package flutter-l10n-flycheck
  :after flutter
  :config
  (flutter-l10n-flycheck-setup))

  (use-package yasnippet
    :ensure t
    :config
    (use-package yasnippet-snippets
      :ensure t
      )
    (yas-reload-all)
    (setq yas-also-auto-indent-first-line t))

  (add-hook 'python-mode-hook 'yas-minor-mode)
  (add-hook 'js-mode-hook 'yas-minor-mode)
  (add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
  (add-hook 'org-mode-hook 'yas-minor-mode)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq org-agenda-files '("~/org/todo"))
(setq +org-capture-todo-file "~/org/todo/todo.org")

(after! org
    (setq org-capture-templates
          '(("t" "Personal todo" entry
            (file+headline +org-capture-todo-file "Inbox")
            "* TODO %?\n%i\n%a" :prepend t)
            ("n" "Personal notes" entry
            (file+headline +org-capture-notes-file "Inbox")
            "* %u %?\n%i\n%a" :prepend t)
            ("j" "Journal" entry
            (file+olp+datetree +org-capture-journal-file)
            "* %U %?\n%i\n%a" :prepend t)
            ("p" "Templates for projects")
            ("pt" "Project-local todo" entry
            (file+headline +org-capture-project-todo-file "Inbox")
            "* TODO %?\n%i\n%a" :prepend t)
            ("pn" "Project-local notes" entry
            (file+headline +org-capture-project-notes-file "Inbox")
            "* %U %?\n%i\n%a" :prepend t)
            ("pc" "Project-local changelog" entry
            (file+headline +org-capture-project-changelog-file "Unreleased")
            "* %U %?\n%i\n%a" :prepend t)
            ("o" "Centralized templates for projects")
            ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
            ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
            ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t))))

    (defun split-and-follow-horizontally ()
      (interactive)
      (split-window-below)
      (balance-windows)
      (other-window 1))
    (defun split-and-follow-vertically ()
      (interactive)
      (split-window-right)
      (balance-windows)
      (other-window 1))

(map!
 :leader
 (:prefix "w"
  :desc "split vertical and follow" "v" #'split-and-follow-vertically
  :desc "split horizontal and follow" "s" #'split-and-follow-horizontally))

(map!
 :leader
 (:prefix "w"
  :desc "ace-other-window" "w" #'ace-window))

(use-package company
  :diminish ""
  :bind (:map company-active-map
         ("<escape>" . company-abort)
         ("<tab>" . yas-expand))
  :config
  (setq
   company-idle-delay 0.2
   company-minimum-prefix-length 1
   company-show-numbers t
   company-require-match 'never
   company-selection-wrap-around t
   ))

;; (use-package company-box
;;   :init
;;   (setq
;;    company-box-icons-alist 'company-box-icons-all-the-icons
;;    window-resize-pixelwize nil)
;;   :hook (company-mode . company-box-mode))

(use-package lsp
  :hook
  ;; (js2-mode . lsp)
  (java-mode . lsp)
  (lsp . company-mode)
  :config
  (setq
   lsp-javascript-suggest-complete-function-calls t
   lsp-auto-guess-root t
   lsp-javascript-references-code-lens-enabled t
   lsp-prefer-capf t
   company-lsp-filter-candidates t))

(use-package lsp-ui
  :ensure t
  :after (lsp)
  :custom
    ;; lsp-ui-doc
    (lsp-ui-doc-enable nil)
    (lsp-ui-doc-header nil)
    (lsp-ui-doc-include-signature nil)
    (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
    (lsp-ui-doc-max-width 120)
    (lsp-ui-doc-max-height 30)
    (lsp-ui-doc-use-childframe t)
    (lsp-ui-doc-use-webkit nil)
  :config
  (global-set-key (kbd "M-RET") #'lsp-ui-sideline-apply-code-actions)
  :hook
  (lsp-ui-mode . lsp-ui-doc-mode))

(map!
 :leader
 (:prefix "c"
  :desc "Jump to implementation" "i" #'tide-jump-to-implementation))

(use-package css-autoprefixer
  :ensure  t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-tcl
  :ensure t)

  (global-set-key (kbd "C-c h e") (lambda () (interactive)(find-file"/ssh:pi@home:/home/homeassistant/.homeassistant/configuration.yaml")))

(defun insert-jsdoc-type-annotation ()
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (previous-line)
  (yas-expand-snippet (yas-lookup-snippet "type-inline-comment"))
  )

(use-package js-doc
  :ensure t)
(map!
 :leader
 (:prefix "j"
  :desc "Insert jsdoc template" "d" #'js-doc-insert-function-doc-snippet
  :desc "Insert jsdoc typeannotation" "t" #'insert-jsdoc-type-annotation))

(use-package prettier-js
  :ensure t
  :after (js2-mode)
  :hook (js2-mode-hook . prettier-js-mode))

(use-package lsp-java
  :ensure t)

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Øyvind Monsen"
      user-mail-address "yvind.monsen@gmail.com")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(evilem-default-keybindings "ø")
