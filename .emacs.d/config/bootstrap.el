(require 'use-package)

;; Configure magit
(use-package magit
  :bind (("C-g" . magit-status))
  :ensure t)

;; Configure rust-mode
(use-package rust-mode
  :ensure t)

;; Configure yaml-mode
(use-package yaml-mode
  :ensure t)

;; Configure Neotree
(use-package neotree
  :init
  (setq neo-window-width 50)
  :bind (("C-x C-n" . neotree-toggle))
  :ensure t
  :commands (neotree-toggle))

;; Configure Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; Configure Editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; Configure Company
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; Configure org-reveal
(use-package ox-reveal
  :ensure t)
(setq org-reveal-root "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.8.0/")
(setq org-reveal-mathjax t)
(use-package htmlize
  :ensure t)

;; Configure fill-column-indicator
(use-package fill-column-indicator
  :ensure t)

;; Configure try
(use-package try
  :ensure t)

;; Configure solarized-theme
(use-package solarized-theme
  :ensure t)

;; Configure Better Defaults
(use-package better-defaults
  :ensure t)

;; Configure fish-mode
(use-package fish-mode
  :ensure t)

(provide 'bootstrap)
