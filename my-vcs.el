(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))

(require 'magit)
(global-set-key "\C-x\C-i" 'magit-status)

(provide 'my-vcs)
