(provide 'my-colors)

;; set highlight color
(set-face-background 'region "DarkOliveGreen2")

;; Isearch highlight colors
(copy-face 'default  'isearch)
(set-face-background 'isearch "DarkGreen")
(set-face-foreground 'isearch "white")

;; Isearch lazy highlight colors
(if (> emacs-major-version 20)
    (progn (set-face-background 'isearch-lazy-highlight-face "LawnGreen")
	   (set-face-foreground 'isearch-lazy-highlight-face "white")))

;; Some new colors for font-lock
;; For list of colors, use M-x list-colors-display
;; The "nil 1" after the make-face-italic and make-face-bold
;; prevents errors from being reported (I saw this problem
;; with Emacs 20.7.2 in -nw mode).  The errors don't appear
;; on 21.2.1
(copy-face 'default  'font-lock-string-face)
(make-face-italic 'font-lock-string-face nil 1)
(set-face-foreground 'font-lock-string-face "plum4")

(copy-face 'default  'font-lock-variable-name-face)
(set-face-foreground 'font-lock-variable-name-face "RoyalBlue")

(copy-face 'default  'font-lock-preprocessor-face)
(set-face-foreground 'font-lock-preprocessor-face "Red")

(copy-face 'default  'font-lock-function-name-face)
(make-face-bold 'font-lock-function-name-face nil 1)
(set-face-foreground 'font-lock-function-name-face "DarkGreen")

(copy-face 'default  'font-lock-keyword-face)
(set-face-foreground 'font-lock-keyword-face "DarkSlateBlue")

(copy-face 'default  'font-lock-type-face)
(make-face-bold 'font-lock-type-face nil 1)
(set-face-foreground 'font-lock-type-face "LimeGreen")

(copy-face 'default  'font-lock-reference-face)
(set-face-foreground 'font-lock-reference-face "SkyBlue3")

(copy-face 'default  'font-lock-doc-string-face)
(make-face-italic 'font-lock-doc-string-face nil 1)
(set-face-foreground 'font-lock-doc-string-face "sienna4")

(copy-face 'default  'font-lock-constant-face)
(set-face-foreground 'font-lock-constant-face "SkyBlue2")

(copy-face 'default  'font-lock-type-name-face)
(make-face-italic 'font-lock-type-name-face nil 1)
(set-face-foreground 'font-lock-type-name-face "Red")

(copy-face 'default  'font-lock-builtin-face)
(make-face-bold 'font-lock-builtin-face nil 1)
(set-face-foreground 'font-lock-builtin-face "OrangeRed3")

(copy-face 'default  'show-paren-match-face)
(set-face-background 'show-paren-match-face "SandyBrown")

(copy-face 'default  'show-paren-mismatch-face)
(set-face-background 'show-paren-mismatch-face "magenta")

(copy-face 'default  'minibuffer-prompt)
(make-face-bold 'minibuffer-prompt nil 1)
(set-face-foreground 'minibuffer-prompt "IndianRed")

(copy-face 'default  'ediff-even-diff-face-A)
(set-face-foreground 'ediff-even-diff-face-A "white")
(set-face-background 'ediff-even-diff-face-A "gray30")

(copy-face 'default  'ediff-odd-diff-face-A)
(set-face-foreground 'ediff-odd-diff-face-A "white")
(set-face-background 'ediff-odd-diff-face-A "SteelBlue4")

(copy-face 'ediff-even-diff-face-A 'ediff-even-diff-face-B)
(copy-face 'ediff-odd-diff-face-A 'ediff-odd-diff-face-B)
(copy-face 'ediff-even-diff-face-A 'ediff-odd-diff-face-C)
(copy-face 'ediff-odd-diff-face-A 'ediff-odd-diff-face-C)

(copy-face 'default 'ediff-current-diff-face-A)
(set-face-foreground 'ediff-current-diff-face-A "white")
(set-face-background 'ediff-current-diff-face-A "IndianRed4")

(copy-face 'default 'ediff-current-diff-face-B)
(set-face-foreground 'ediff-current-diff-face-B "white")
(set-face-background 'ediff-current-diff-face-B "sienna4")

(copy-face 'default 'ediff-current-diff-face-C)
(set-face-foreground 'ediff-current-diff-face-C "white")
(set-face-background 'ediff-current-diff-face-C "firebrick4")

(copy-face 'default 'ediff-fine-diff-face-A)
(set-face-foreground 'ediff-fine-diff-face-A "white")
(set-face-background 'ediff-fine-diff-face-A "SpringGreen4")

(copy-face 'ediff-fine-diff-face-A 'ediff-fine-diff-face-B)
(copy-face 'ediff-fine-diff-face-A 'ediff-fine-diff-face-C)

(require 'color-theme)
(defun dark-colors ()
  (interactive)
  (progn (color-theme-initialize)
	 (color-theme-dark-laptop)
	 (set-background-color "black")))

;; Turn on pretty font colors
(global-font-lock-mode t)

(setq font-lock-maximum-decoration 3)

