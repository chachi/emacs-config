;(require 'csharp-mode)

(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-c\C-k" 'kill-region)))

(add-hook 'org-mode-hook '(lambda () (visual-line-mode t) ) )

(add-hook 'LaTeX-mode-hook '(lambda ()
                              (visual-line-mode 1)
                              (sentence-highlight-mode)) )
(setq-default indent-tabs-mode nil)

;; (add-hook 'LaTeX-mode-hook '(lambda () (flyspell-mode 1) ) )

(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("Rakefile" . ruby-mode)
                ("\\.cmake\\'" . cmake-mode)
                ("\\.md\\'" . markdown-mode))
              auto-mode-alist))

(require 'rainbow-delimiters)

;; (require 'ess-site)

;; (require 'auctex)

;(setenv "PATH" (concat (getenv "PATH") ":/Applications/Racket\ v5.3/bin"))
;(normal-top-level-add-to-load-path '("/Applications/Racket\ v5.3"))
;(load-file "~/.emacs.d/emacs-config/plugins/geiser/elisp/geiser.el")
;(require 'quack)


;;; C++ mode hacks for broken font locking

(require 'font-lock)

(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))

(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
             'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
             'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
             'font-lock-comment-face)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)


(add-hook 'c++-mode-hook
          '(lambda()
             ;; In theory, we could place some regexes into `c-mode-common-hook'. But note that their
             ;; evaluation order matters.
             (font-lock-add-keywords
              nil '(;; complete some fundamental keywords
                    ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
                    ;; add the new C++11 keywords
                    ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
                    ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
                    ;; PREPROCESSOR_CONSTANT
                    ("\\<[A-Z]*_[A-Z_]+\\>" . font-lock-constant-face)
                    ;; hexadecimal numbers
                    ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
                    ;; integer/float/scientific numbers
                    ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
                    ;; ;; user-defined types (customizable)
                    ;; ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
                    ;; some explicit typenames (customizable)
                    ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
                    ))
             ) t)

(require 'jedi)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(require 'markdown-mode)
(require 'yaml-mode)
(require 'protobuf-mode)

;;(require 'cpputils-cmake)
;;(add-hook 'c-mode-hook (lambda () (cppcm-reload-all)))
;;(add-hook 'c++-mode-hook (lambda () (cppcm-reload-all)))

;; OPTIONAL, somebody reported that they can use this package with Fortran
;;(add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))

;;; Configure cpputils-cmake for use with rpg-cmake (def_library/def_executable)
(setq cppcm-cmake-target-regex
      "^\s*[^#]*\s*\\(\\(?:add\\|def\\)_\\(?:executable\\|library\\)\\)\s*(\\(\s*[^\s]+\\)")
(setq cppcm-cmake-exe-regex "^\\(?:def\\|add\\)_executable")

(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)
(require 'andersl-cmake-font-lock)
(add-hook 'cmake-mode-hook 'andersl-cmake-font-lock-activate)

(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(global-company-mode 1)

(require 'company-capf)
(push 'company-capf company-backends)

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(setq rust-format-on-save t)

(setq lsp-keymap-prefix "s-l")
(require 'lsp-mode)
(require 'which-key)

(add-hook 'rust-mode-hook #'lsp)

(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2

(with-eval-after-load 'lsp-mode
  ;; :project/:workspace/:file
  (setq lsp-diagnostics-modeline-scope :project)
  (add-hook 'lsp-managed-mode-hook 'lsp-diagnostics-modeline-mode)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;;; Refresh CIDER's REPL
(defun cider-namespace-refresh ()
  (interactive)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl)
    (clojure.tools.namespace.repl/refresh)"))
(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map (kbd "M-r")
               'cider-namespace-refresh)))
(add-hook 'clojure-mode-hook #'paredit-mode)


(provide 'my-languages)
;;; my-languages.el ends here
