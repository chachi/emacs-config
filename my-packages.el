;; Following code adapted from Emacs-Prelude @
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
(require 'cl-lib)
(defvar my-packages '(anything
                      auctex
                      auto-complete
                      auto-indent-mode
                      autopair
                      cider
                      clojure-mode
                      cmake-mode
                      coffee-mode
                      color-theme
                      color-theme-sanityinc-solarized
                      company
                      cpputils-cmake
                                        ;cuda-mode
                      dash
                      deft
                      desktop
                      expand-region
                      exec-path-from-shell
                      flycheck
                      gist
                      git-gutter
                      groovy-mode
                      haml-mode
                      handlebars-mode
                      haskell-mode
                      inf-ruby
                      jedi
                      magit
                      matlab-mode
                      markdown-mode
                      multi-term
                      mustache-mode
                      paredit
                      popup
                      projectile
                      protobuf-mode
                      rainbow-mode
                      rainbow-delimiters
                      ruby-mode
                      ruby-tools
                      sass-mode
                      scss-mode
                      solarized-theme
                      volatile-highlights
                      which-key
                      workgroups
                      yaml-mode
                      yari
                      yasnippet
                      )
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (catch 'not-found
    (dolist (p my-packages)
      (message "p: %s" p)
      (unless (package-installed-p p))
      (throw 'not-found nil))
    t))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (message "Installing %s" p)
      (package-install p))))

(provide 'my-packages)
;;; my-packages.el ends here
