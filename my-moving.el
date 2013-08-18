;;----Moving around---
;; Scroll one line at a time
(setq scroll-step 1)


;; Set C-c, g to goto-line
(global-set-key "\C-cg" 'goto-line)

;; Set up home/end keys
(global-set-key [end] 'end-of-buffer)
(global-set-key [home] 'beginning-of-buffer)

;; Moving around more easily
(global-set-key [C-right] 'forward-word)
(global-set-key [C-left] 'backward-word)

;; Scroll faster, colors won't appear correctly right away
(setq lazy-lock-defer-on-scrolling t)
(setq lazy-lock-continuity-time 0.3)

;; Don't insert new lines when scrolling
(setq next-line-add-newlines nil)

(global-set-key "\C-xr" 'rgrep)

(provide 'my-moving)
