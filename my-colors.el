(provide 'my-colors)

;; Turn on pretty font colors
(global-font-lock-mode t)
(setq font-lock-maximum-decoration 3)

(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-solarized-dark)
