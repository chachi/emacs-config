(let ((default-directory "~/.emacs.d/"))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))
(server-start)

(require 'tramp)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

;; basic initialization, (require) non-ELPA packages, etc.
(setq package-enable-at-startup nil)
(package-initialize)
;; (require) your ELPA packages, configure them as normal

(require 'my-packages)
(require 'my-moving)
(require 'my-env)
(require 'my-windows)
(require 'my-custom)
(require 'my-interaction)
(require 'my-languages)
(require 'my-vcs)
(require 'my-editing)
(require 'my-projects)
(require 'my-colors)

(cd "~/")
