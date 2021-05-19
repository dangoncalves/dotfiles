(eval-when-compile
  (require 'solarized-palettes))
(defun get-solarized-color (color)
  "Return solarized colors from dark solarized palette"
  (cdr (assoc color solarized-dark-color-palette-alist)))


(when (version<= "26.0.50" emacs-version)
  (require 'display-line-numbers)
  (defcustom display-line-numbers-exempt-modes '(vterm-mode
                                                 eshell-mode
                                                 shell-mode
                                                 term-mode
                                                 ansi-term-mode
                                                 ibuffer-mode
                                                 help-mode
                                                 Info-mode
                                                 mu4e~update-mail-mode
                                                 mu4e-headers-mode
                                                 mu4e-main-mode
                                                 magit-status-mode)
    "Major modes on which to disable the linum mode, exempts them from global requirement"
    :group 'display-line-numbers
    :type 'list
    :version "green")
  (defcustom display-line-numbers-exempt-buffer-name '(" *NeoTree*")
    "Buffer names on which to disable the linum mode, exempts them from global requirement"
    :group 'display-line-numbers
    :type 'list
    :version "green")

  (defun display-line-numbers--turn-on ()
    "turn on line numbers but exempting certain major modes defined in `display-line-numbers-exempt-modes'"
    (if (and
         (not (member major-mode display-line-numbers-exempt-modes))
         (not (member (buffer-name) display-line-numbers-exempt-buffer-name))
         (not (minibufferp)))
        (display-line-numbers-mode)))
  (global-display-line-numbers-mode)
  (global-hl-line-mode))

;; For solarized theme
(set-face-inverse-video-p 'vertical-border nil)
(set-face-background 'vertical-border (face-background 'default))
(set-face-foreground 'vertical-border (get-solarized-color 'base00))
(set-display-table-slot standard-display-table
			'vertical-border
                        (make-glyph-code ?\u2502))
(set-face-background 'line-number (get-solarized-color 'default))
(set-face-foreground 'line-number (get-solarized-color 'base01))
(set-face-background 'line-number-current-line (get-solarized-color 'base02))
(set-face-background 'hl-line (get-solarized-color 'base02))

;; Disable any background
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)



(provide 'custom-variables-faces)
