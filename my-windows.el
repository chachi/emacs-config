(provide 'my-windows)

;; if using a graphical window (ie. not using -nw)
(if window-system

    (progn
      ;; Put scroll bar on the right side
      (set-scroll-bar-mode 'right)
      (scroll-bar-mode 0)

      ;; Remove graphical toolbar (if version 21 or higher)
      (tool-bar-mode 0)

      ;; If Emacs "hangs" for a few seconds while starting, you might have
      ;; to comment out or change the following line that tries to set the
      ;; font to a fixed width font:
      ;;(set-default-font "fixed")
      ;;(set-default-font "9x15")  ;; high resolution monitor, bigger fonts
      ;;(set-default-font "-xos4-terminus-bold-r-normal--14-140-72-72-c-80-iso8859-1")


      ;; don't show tooltips
      (tooltip-mode 0)

      ;; use mouse wheel to scroll
      (mouse-wheel-mode t)

      ;; Default: scroll with middle,  page-up with left click, page down with right
      ;; Scroll with left mouse button
      ;; This only works with the plain scroll bar, not the Xaw3d variety
      (global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)

      ;; Page down with middle button
      (global-set-key [vertical-scroll-bar mouse-2] 'scroll-bar-scroll-up)
      (global-set-key [vertical-scroll-bar drag-mouse-2] 'scroll-bar-scroll-up)
      (global-unset-key [vertical-scroll-bar down-mouse-2])

      ;; Page up with right button
      (global-set-key [vertical-scroll-bar mouse-3] 'scroll-bar-scroll-down)
      (global-set-key [vertical-scroll-bar drag-mouse-3] 'scroll-bar-scroll-down)

      ;; basic colors
      (setq default-frame-alist '((cursor-color . "RoyalBlue")
				  (cursor-type . box)
				  (foreground-color . "black")
				  (background-color . "white")))

      ;; modeline colors
      (set-face-background 'modeline "DarkOliveGreen2")
      (set-face-foreground 'modeline "black")

      ;;  (mouse-avoidance-mode 'animate) ;; Cool...but annoying


      (defun toggle-fullscreen (&optional f)
	(interactive)
	(let ((current-value (frame-parameter nil 'fullscreen)))
	  (set-frame-parameter nil 'fullscreen
			       (if (equal 'fullboth current-value)
				   (if (boundp 'old-fullscreen) old-fullscreen nil)
				 (progn (setq old-fullscreen current-value)
					'fullboth)))))
      (global-set-key [f11] 'toggle-fullscreen)

      (setq frame-title-format
	    '(:eval
	      (if buffer-file-name
		  (replace-regexp-in-string
		   (getenv "HOME") "~"
		   (concat (file-name-directory buffer-file-name) "%b") )
		(buffer-name)
		)))
      (menu-bar-mode t)

      )) ;; end if window-system


(setq display-buffer-function nil)
(setq display-buffer-reuse-frames t)
(setq pop-up-windows nil)


(require 'workgroups)
(workgroups-mode 1)

(setq wg-prefix-key (kbd "C-z"))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'midnight)
(clean-buffer-list)
