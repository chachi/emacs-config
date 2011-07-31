(provide 'my-interaction)

;; Typing "yes" or "no" takes too long---use "y" or "n"
(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key "\C-x\C-m" 'compile)
(global-set-key (kbd "<f7>") 'recompile)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key (kbd "<f5>") 'linum-mode)

;; make option key meta
(setq mac-command-modifier 'meta)

;;desktop-autosave.el begins here
(provide 'desktop-autosave)
(eval-when-compile
  (require 'cl))

(require 'saveplace)
(setq-default save-place t)

(require 'desktop)

(desktop-save-mode 1) ;; Switch on desktop.el

(defun desktop-autosave-save ()
  (desktop-save-in-desktop-dir))

(ido-mode 1)

(global-set-key "\C-xa" 'windmove-left)
(global-set-key "\C-xs" 'windmove-down)
(global-set-key "\C-xw" 'windmove-up)
(global-set-key "\C-xd" 'windmove-right)

(define-key global-map [f7] 'recompile)
(define-key global-map [f8] 'next-error)

(column-number-mode 1)

(require 'todochiku)
(if (string= system-type "darwin")
    '(todochiku-command "/usr/local/bin/growlnotify")
    )

(setq ring-bell-function 'ignore)

(require 'yasnippet)
(yas/initialize)
;(yas/load-directory "~/.emacs.d/plugins/yasnippet-read-only/snippets")

(add-hook 'auto-save-hook
	  (lambda ()
	    (desktop-autosave-save)))

(require 'auto-complete)

;; show paren matches
(setq blink-matching-paren t)
(setq show-paren-delay 0)
(show-paren-mode t)

(setq search-highlight t)	       ; incremental search highlights
(setq query-replace-highlight t)       ; highlight during query

(global-set-key "\C-x\C-r" 'revert-buffer)

(setq blink-cursor-mode nil)

(put 'upcase-region 'disabled nil)

(put 'dired-find-alternate-file 'disabled nil)

(put 'downcase-region 'disabled nil)

(global-auto-revert-mode)

(global-set-key "\C-c\C-v" 'pyflakes)

(global-set-key "\C-xn" 'flymake-goto-next-error)

(global-set-key "\M-o" 'project-find-file-ido)

;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 		       'flymake-create-temp-inplace))
;; 	   (local-file (file-relative-name
;; 			temp-file
;; 			(file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;; 	       '("\\.py$" flymake-pyflakes-init)))

;; (load-library "flymake-cursor")
;; (add-hook 'python-mode-hook 'flymake-find-file-hook)



