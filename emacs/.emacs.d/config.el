(add-to-list 'default-frame-alist '(fullscreen . maximized))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)

  (setq dashboard-items '(
                          (projects .5)
                          (bookmarks .5)
                          (recents . 10)))
  (setq dashboard-center-contents t)
  (setq dashboard-banner-logo-title "Hello Øyvind!")
  (setq dashboard-startup-banner 'logo))

(setq mac-option-modifier nil
      mac-command-modifier 'meta)

(setq scroll-conservatively 100)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package ivy
  :ensure t
  :init
  (ivy-mode))

(use-package counsel
  :ensure t
  :diminish counsel-mode
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line-and-call))
  :config
  (counsel-mode))

(setq python-shell-interpreter "python3")

(setq org-src-window-setup 'current-window)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode t))))

(setq org-hide-emphasis-markers t)
(setq org-hide-leading-stars t)

;;     (require 'org-tempo)


  ;   (add-to-list 'org-structure-template-alist '("p" . "src python :results output"))
  ;  (add-to-list 'org-structure-template-alist '("m" . "src emacs-lisp"))
   ; (add-to-list 'org-structure-template-alist '("j" . "#+HEADERS: :classname Main\n#+begin_src java"))

;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; (let* ((variable-tuple
;; 	(cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;; 	      ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;; 	      ((x-list-fonts "Verdana")         '(:font "Verdana"))
;; 	      ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;; 	      (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;        (base-font-color     (face-foreground 'default nil 'default))
;;        (headline           `(:inherit default :weight bold :foreground ,"#ffffff")))

;;   (custom-theme-set-faces
;;    'user
;;    `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))

(require 'ob-java)
(add-to-list 'org-babel-load-languages '(java . t))

(add-hook 'org-mode-hook 'org-indent-mode)

(font-lock-add-keywords 'org-mode
                     '(("^ *\\([-]\\) "
                        (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(setenv "PATH" (concat "/usr/local/bin/autoreconf" (getenv "PATH")))

(use-package pdf-tools
  :ensure t
  :config
  (add-hook 'pdf-tools-enabled-hook 'auto-revert-mode)
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-tools-install))
  (setq pdf-view-use-scaling t)
  (custom-set-variables
    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")
  (pdf-tools-install))

(setenv "PATH" (concat "/Library/TeX/texbin:" (getenv "PATH")))
(setenv "PKG_CONFIG_PATH" "/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig")
(setq exec-path (append '("/Library/TeX/texbin") exec-path))

(use-package latex-preview-pane
    :ensure t)

(setq exec-path (append exec-path '("/usr/local/bin/gs")))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

(global-auto-revert-mode 1)
(setq auto-revert-interval 1) ;; Refresh buffers faster
(auto-revert-set-timer) ;; For updating the auto-refresh.

(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files (list "~/org/todo.org"))

(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(projectile-register-project-type 'npm '("package.json")
                  :compile "npm install"
                  :test "npm run test"
                  :run "npm run start"
                  :test-suffix ".spec")

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

(setq ring-bell-function 'ignore)

(use-package diminish
  :ensure t
  :init
  (diminish 'company)
  (diminish 'rainbow-mode)
  (diminish 'ivy))

(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(defun kill-whole-word ()
  (interactive)
  (backward-word)
  (kill-word 1))

(global-set-key (kbd "C-c w w") 'kill-whole-word)

(global-subword-mode 1)

(when window-system (global-hl-line-mode))

(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode))
(setq highlight-indent-guides-method 'character)

(setq highlight-indent-guides-character ?\|)

(use-package autopair
  :ensure t
  :config
  (autopair-global-mode))

(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))

(global-set-key (kbd "C-c w l") 'copy-whole-line)

(use-package swiper
  :ensure t
  :init
  :bind ("C-s" . swiper))

(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t
    )
  (yas-reload-all))

(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'js-mode-hook 'yas-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'org-mode-hook 'yas-minor-mode)

(setq make-backup-files nil)
(setq auto-save-default nil)

(global-set-key (kbd "C-c p") 'neotree-toggle)

(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))

(use-package emmet-mode
  :ensure t)
(add-hook 'js-mode-hook 'emmet-mode)
(add-hook 'html-mode 'emmet-mode)

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-prefer-flymake nil
        lsp-enable-snippet nil
        lsp-eldoc-enable-hover nil)
  :hook(
        (python-mode . lsp)
        (css-mode .lsp)
        (js-mode . lsp)
        (rjsx-mode . lsp)
        (html-mode . lsp)
        (emacs-lisp-mode . lsp)))
  (global-set-key (kbd "M-g i") 'lsp-describe-thing-at-point)
  (global-set-key (kbd "M-g f") 'lsp-find-references)
  (global-set-key (kbd "M-g r") 'lsp-rename)
  (global-set-key (kbd "M-g t") 'lsp-ui-imenu)

(add-hook 'js-mode-hook (lambda () (define-key js-mode-map (kbd "M-.") 'nil)))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode)
(use-package lsp-ui
  :ensure t
  :requires lsp-mode flycheck
  :config
  (setq lsp-ui-flycheck-enable t
        lsp-ui-flycheck-list-position 'right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :bind
  (:map lsp-mode-map
        ("C-c s"   . lsp-ui-sideline-mode)))

(use-package company
  :ensure t 
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  :init
  :hook (lsp-mode . company-mode))

(use-package company-lsp
  :ensure t
  :requires company
  :config
  (setq company-backends ())
  (push 'company-lsp company-backends)

   ;; Disable client-side cache because the LSP server does a better job.
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-c d") (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c l d") (lambda() (interactive)(load-file "~/.emacs.d/init.el")))

(global-set-key (kbd "C-c c") (lambda () (interactive)(find-file "~/.emacs.d/config.org")))

(setq sh-docset-list '("Python 3"
                       "Flask"
                       "NumPy"
                       "Matplotlib"
                       "Emacs Lisp"
                       "CSS"
                       "HTML"
                       "JavaScript"
                       "React"
                       "Express"
                       "Java"))

(use-package counsel-dash
  :ensure t
  :config
  (setq counsel-dash-common-docsets sh-docset-list
        dash-docs-enable-debugging  t
        counsel-dash-min-length     2)
  (add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("python 3" "NumPy" "Matplotlib"))))
  (add-hook 'js-mode-hook (lambda () (setq-local counsel-dash-docsets '("CSS" "HTML" "JavaScript" "React" "Express"))))
  (add-hook 'css-mode-hook (lambda () (setq-local counsel-dash-docsets '("CSS"))))
  (add-hook 'html-mode-hook (lambda () (setq-local counsel-dash-docsets '("HTML" "CSS" "JavaScript"))))
  (add-hook 'org-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
  (add-hook 'java-mode-hook (lambda () (setq-local counsel-dash-docsets '("Java"))))

  (global-set-key (kbd "M-g d") 'counsel-dash-at-point)
  (global-set-key (kbd "M-g D") 'counsel-dash))

(defun sh-install-docsets (docset-list)
  "Install all docsets in docset-list recursively"
  (dash-docs-install-docset (replace-regexp-in-string " " "_" (car docset-list)))
  (if (cdr docset-list)
      (sh-install-docsets (cdr docset-list))))

(defun sh-install-dash-docsets ()
  "Install all specified docsets in sh-docset-list. This might take a while"
  (interactive)
  (sh-install-docsets sh-docset-list))

(use-package wgrep
  :ensure t
  :bind (("M-g g" . rgrep)
         ("M-g w" . wgrep-change-to-wgrep-mode)
         ("M-g s" . wgrep-save-all-buffers)))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (global-set-key (kbd "M-g b") 'magit-blame)
  (global-set-key (kbd "M-g h") 'magit-log-buffer-file))

(global-set-key (kbd "C-c h e") (lambda () (interactive)(find-file"/ssh:pi@home:/home/homeassistant/.homeassistant/configuration.yaml")))

(defun restart-homeassistant ()
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   (shell-command "ssh home sudo service home-assistant@homeassistant restart")))


(global-set-key (kbd "C-c h r") 'restart-homeassistant)

(use-package yaml-mode
  :ensure t)

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(use-package rainbow-mode
  :ensure t)

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(defun kill-curr-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'kill-curr-buffer)

(use-package switch-window
  :ensure t
  :config
  (setq swtich-window-input-style 'minibuffer)
  (setq switch-window-increase 10)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "g" "h" "w" "e" "ø"))
  :bind
  ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)


(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package mark-multiple
  :ensure t
  :bind
  ("C-c m n" . 'mark-next-like-this)
  ("C-c m a" . 'mark-all-like-this))

(global-set-key (kbd "C-c t") (lambda () (interactive)(ansi-term "/bin/zsh")))
  (use-package exec-path-from-shell
    :ensure t)

(exec-path-from-shell-initialize)
