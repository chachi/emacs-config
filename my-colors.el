;; Turn on pretty font colors
(global-font-lock-mode t)
(setq font-lock-maximum-decoration 3)

(require 'color-theme)
(require 'color-theme-solarized)

(global-set-key (kbd "<f12>") 'color-theme-solarized-dark)

;; hl-line: highlight the current line
;; (when (fboundp 'global-hl-line-mode)
;;   (global-hl-line-mode t))
;; turn it on for all modes by default

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'my-colors)
;;; my-colors.el ends here

