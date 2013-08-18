;;; We define modes for c++, python, and java
(defun jack-c++-mode ()
  "C++ mode made to fit the way I like it."
  (interactive)
  (c++-mode)
  (subword-mode)
  (c-set-style "my-c-style")
  (setq tab-width 4)
  (setq c-basic-offset 4)
  ;(setq compile-command "make install -j2 -k -C ~/jack/nao-man/ ")
  (which-func-mode 1)
  (setq indent-tabs-mode nil)
  (whitespace-mode 1)
  )

(defun jack-c-mode ()
  "C++ mode made to fit the way I like it."
  (interactive)
  (c-mode)
  (subword-mode)
  (c-set-style "my-c-style")
  (setq tab-width 4)
  (setq c-basic-offset 4)
  ;(setq compile-command "make install -j2 -k -C ~/jack/nao-man/ ")
  (which-func-mode 1)
  (setq indent-tabs-mode nil)
  (whitespace-mode 1)
  )

(defun jack-python-mode ()
  (interactive)
  (python-mode)
  (subword-mode)
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (which-func-mode 1)
  (setq indent-tabs-mode nil)
  (whitespace-mode 1)
  )

(defun jack-java-mode ()		; For the TOOL
  (interactive)
  (java-mode)
  (subword-mode)    ; Uncomment to treat camelText words as separate
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (which-func-mode 1)
  (setq indent-tabs-mode nil)
  ;(setq compile-command "ant compile")
  (whitespace-mode 1)
  )

;;; We set the jack modes as default for the appropraite files
;;;
;;; To make this apply only in jack directories add a path to the settings
;;; i.e. ("~/src/jack/.*\\.cpp$" . jack-c++-mode)
(setq auto-mode-alist (append '(("\\.cpp$" . jack-c++-mode)
				("\\.cc$" . jack-c++-mode)
				("\\.hpp$" . jack-c++-mode)
				("\\.h$" . jack-c++-mode)
				("\\.py$" . jack-python-mode)
				("\\.java$" . jack-java-mode)
				) auto-mode-alist))

(setq auto-mode-alist (append '(("\\.c$" . jack-c-mode)) auto-mode-alist))

;; CUSTOM STYLES

(c-add-style "my-c-style"
             '("BSD"
	       (c-offsets-alist .
				((innamespace . 0))
				)))
;; (add-hook 'c-mode-common-hook
;; 	  '(c-set-style "my-c-style"))
;; (add-hook 'c++-mode-hook
;; 	  '(c-set-style "my-c-style"))
(setq-default c-basic-offset 4)
(setq c-default-style "my-c-style")

(setq c-doc-comment-style 'javadoc)

(provide 'my-custom)
;;; my-custom.el ends here

