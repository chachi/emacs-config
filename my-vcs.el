(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))

(require 'magit)
(global-set-key "\C-x\C-i" 'magit-status)
(setq magit-status-buffer-switch-function 'switch-to-buffer)
(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'my-vcs)
