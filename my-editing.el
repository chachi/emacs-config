(provide 'my-editing)

;; Turn on selection
(setq transient-mark-mode 't highlight-nonselected-windows 't)

;; Pressing backspace during an Isearch will delete the previous
;; character typed (or do a reverse isearch if something matches the
;; current word).  Without this, it will delete the highlighted text.
(define-key isearch-mode-map [backspace] 'isearch-delete-char)

;; Replace highlighted/marked areas
(delete-selection-mode t)

(setq indent-tabs-mode nil)

(global-unset-key "\C-c\C-c")
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

(global-set-key "\C-ck" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-w" 'backward-kill-word)

;; Deletes trailing whitespace on all lines except the current one
;; so we don't affect our current indentation, etc.
;; (defun delete-all-but-whitespace ()
;;   (interactive)
;;   (setq c (current-column))
;;   ;; If the line is empty, we don't want to kill it (it will move our mark)
;;   (setq isEmpty (or (eobp) (looking-at "\s$")))

;;   ;; If we're not looking at an empty line,
;;   ;; add it (and only it) to the kill ring, the delete the current line.
;;   ;; This introduces a blank line, unfortunately, which is later a problem.
;;   (if (not isEmpty)
;;       (progn
;; 	(kill-new (thing-at-point 'line))
;; 	(delete-region (line-beginning-position) (line-end-position))
;; 	 ))

;;   (delete-trailing-whitespace)
;;   (if (not isEmpty)
;;       ;; Put the line back on the screen, delete the blank one, and go
;;       ;; back up a row
;;       (progn (yank)
;; 	     (kill-line)
;; 	     (previous-line)
;; 	     (current-kill 1)))
;;   (move-to-column c)
;;   (setq c nil))
;; (setq delete-all-but-whitespace nil)
;; (remove-hook 'before-save-hook 'delete-all-but-whitespace)
;; Add hook so we delete whitespace every time we save.
;; (add-hook 'before-save-hook
;; 	  (lambda ()
;; 	    (delete-all-but-whitespace)))

(defadvice kill-ring-save (before slick-copy activate compile) "When called
  interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
		 (message "Copied line")
		 (list (line-beginning-position)
		       (line-beginning-position 2)))))

(defadvice yank (before slick-copy activate)
  "Position point when yanking lines."
  (let ((kill (current-kill 0 t)))
    (when (eq ?\n (elt kill (1- (length kill))))
      (beginning-of-line))))

(eval-after-load "ispell"
   (progn
     (setq ispell-extra-args '()
           ispell-silently-savep t
           ispell-dictionary "american")))

(setq-default ispell-program-name "ispell")

(require 'autopair)
(autopair-global-mode 1)


;; Major life saver --- auto-indents yanked code
(dolist (command '(yank yank-pop))
       (eval `(defadvice ,command (after indent-region activate)
                (and (not current-prefix-arg)
                     (member major-mode '(emacs-lisp-mode lisp-mode
                                                          clojure-mode    scheme-mode
                                                          haskell-mode    ruby-mode
                                                          rspec-mode      python-mode
                                                          c-mode          c++-mode
                                                          objc-mode       latex-mode
                                                          plain-tex-mode))
                     (let ((mark-even-if-inactive transient-mark-mode))
                       (indent-region (region-beginning) (region-end) nil))))))

(setq compilation-skip-threshold 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'indent-for-tab-command)
