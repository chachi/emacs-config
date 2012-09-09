(provide 'my-languages)

;(require 'csharp-mode)

(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-c\C-k" 'kill-region)))

(add-hook 'org-mode-hook '(lambda () (visual-line-mode t) ) )

(add-hook 'LaTeX-mode-hook '(lambda () (visual-line-mode 1) ) )
;; (add-hook 'LaTeX-mode-hook '(lambda () (flyspell-mode 1) ) )

(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

;; (require 'ess-site)

;; (require 'auctex)

(setenv "PATH" (concat (getenv "PATH") ":/Applications/Racket\ v5.3/bin"))
(normal-top-level-add-to-load-path '("/Applications/Racket\ v5.3"))
(load-file "~/.emacs.d/emacs-config/plugins/geiser/elisp/geiser.el")
(require 'quack)
