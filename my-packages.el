;; Following code adapted from Emacs-Prelude @
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
(defvar my-packages '(
		      ack-and-a-half
		      auctex
		      auto-complete
		      auto-indent-mode
		      clojure-mode
		      cmake-mode
		      coffee-mode
		      color-theme
		      color-theme-solarized
		      cppcheck
		      dash
		      deft
		      desktop
		      expand-region
		      flycheck
		      gist
		      groovy-mode
		      haml-mode
		      handlebars-mode
		      haskell-mode
		      httpd
		      inf-ruby
		      jedi
		      magit
		      magithub
		      markdown-mode
		      multi-term
		      mustache-mode
		      paredit
		      popup
		      projectile
		      python
		      quack
		      rainbow-mode
		      ruby-mode
		      ruby-tools
		      sass-mode
		      scss-mode
		      solarized-theme
		      volatile-highlights
		      workgroups
		      yaml-mode
		      yari
		      yasnippet
		      yasnippet-bundle
		      )
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'my-packages)
;;; my-packages.el ends here
