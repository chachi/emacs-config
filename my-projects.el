(global-set-key (kbd "C-c p c") 'project-compile)
(global-set-key (kbd "C-c p l") 'project-load)
(global-set-key (kbd "C-c p g") 'project-grep)
(global-set-key (kbd "C-c p a") 'project-ack)
(global-set-key (kbd "C-c p u") 'project-unload)
(global-set-key (kbd "C-c p f") 'project-find-file) ; or project-find-file-ido
(global-set-key (kbd "C-c p i") 'project-index)
(global-set-key (kbd "C-c p s") 'project-status)
(global-set-key (kbd "C-c p h") 'project-home)
(global-set-key (kbd "C-c p d") 'project-dired)
(global-set-key (kbd "C-c p t") 'project-tags)

(require 'mk-project)

(defun find-fmvot-files (context)
  (concat "find /home/jack/src/fmvot/ -type d"
          " \\( -name \"*build\" -o -name \"*bin\" -o -wholename \"*share\" "
          " -o -name \"*ortho_sessions*\" \\) -prune "
          " -o -name \"*~\""
          " -o \\( -name \"*.cc\" -o -name \"*.h\" -o -name \"*Makefile*\" -o -name \"*.xml\" "
          " -o -name \"*.ui\" -o -name \"*.md\" -o -name \"*.py\""
          " -o -name \"*.txt\" -o -name \"*.cmake\" -o -name \"*.make\" -o -name \"*.sh\" \\) "
          " -print" )
  )

(setq my-project-source-patterns
      '("*.h" "*.cc" "*.hpp" "*.cpp" "*.s" "*.py" "*.sh" "*.md" "*.txt" "*.cmake"))

(setq my-project-ignore-patterns
      '("*.o" "*.html" "*/build/*" " *.d" "#*" "*~" ".pyc"))

(setq sfmpy-base-dir (expand-file-name "~/src/sfmpy/"))
(project-def "sfmpy"
             `((basedir ,sfmpy-base-dir)
               (src-patterns ,my-project-source-patterns)
               (ignore-patterns ,my-project-ignore-patterns)
               (ignore-dirs '())
               (tags-file ,(concat sfmpy-base-dir "TAGS"))
               (file-list-cache ,(concat sfmpy-base-dir "files"))
               (open-files-cache ,(concat sfmpy-base-dir "open-files"))
               (vcs git)
               (compile-cmd "")
               (ack-args "--py")
               (startup-hook nil)
               (shutdown-hook nil)
               ))

(setq rslam-base-dir (expand-file-name "~/src/rslam/"))
(project-def "rslam"
             `((basedir ,rslam-base-dir)
               (src-patterns ,my-project-source-patterns)
               (ignore-patterns ,my-project-ignore-patterns)
               (ignore-dirs '())
               (tags-file ,(concat rslam-base-dir "TAGS"))
               (file-list-cache ,(concat rslam-base-dir "files"))
               (open-files-cache ,(concat rslam-base-dir "open-files"))
               (vcs git)
               (compile-cmd "rake -f ~/src/Rakefile test_rslam")
               (ack-args "--cpp")
               (startup-hook nil)
               (shutdown-hook nil)
	       (tags-cmd "ctags -e --extra=fq -L - -o TAGS")
               ))

(defun switch-between-h-and-cc ()
  "Switch between a header (.h) and an C++ implementation (.cc) file using mk-project support"
  (interactive)
  (let ((file (file-name-base))
        (ext (file-name-extension (buffer-file-name))))
    (message (concat file (if (equalp ext "h") "\.cpp" "\.h")))
    (project-find-file (concat "/" file (if (equalp ext "h") "\.cpp" "\.h")))))

(global-set-key (kbd "M-s") 'switch-between-h-and-cc)

(provide 'my-projects)
;;; my-projects.el ends here

