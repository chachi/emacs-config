(provide 'my-projects)

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

;; (project-def "tool"
;;           '((basedir "~/robocup/nbites/src/tool/")
;;             (src-patterns ("*.java" "*.h" "*.cpp"))
;;             (ignore-patterns ("*.class"))
;;             (tags-file "~/robocup/nbites/src/tool/TAGS")
;;             (file-list-cache "~/robocup/nbites/src/tool/files")
;;             (open-files-cache "~/robocup/nbites/src/tool/open-files")
;;             (vcs git)
;;             (compile-cmd "ant -emacs -f ~/robocup/nbites/src/tool/build.xml compile visionlink")
;;             (ack-args nil)
;;             (startup-hook nil)
;;             (shutdown-hook nil)
;;             ))

;; (project-def "man"
;;           '((basedir "~/robocup/nbites/src/man/")
;;             (src-patterns ("*.py" "*.h" "*.cpp" "*.s"))
;;             (ignore-patterns ("*.o" "*.html"))
;;             (tags-file "~/robocup/nbites/src/man/TAGS")
;;             (file-list-cache "~/robocup/nbites/src/man/files")
;;             (open-files-cache "~/robocup/nbites/src/man/open-files")
;;             (vcs git)
;;             (compile-cmd "make -j4 -k -C ~/robocup/nbites/build/man/straight/ --no-print-directory")
;;             (ack-args "--java --cpp --python")
;;             (startup-hook nil)
;;             (shutdown-hook nil)
;;             ))

;; (project-def "remote"
;;           '((basedir "~/robocup/nbites/src/remote/")
;;             (src-patterns ("*.java"))
;;             (ignore-patterns ("*.class" "*.html"))
;;             (tags-file "~/robocup/nbites/src/remote/TAGS")
;;             (file-list-cache "~/robocup/nbites/src/remote/files")
;;             (open-files-cache "~/robocup/nbites/src/remote/open-files")
;;             (vcs git)
;;             (compile-cmd "ant -f ~/robocup/nbites/src/remote/build.xml")
;;             (ack-args "--java")
;;             (startup-hook nil)
;;             (shutdown-hook nil)
;;             ))
;; (project-def "thesis"
;;           '((basedir "~/Dropbox/Bowdoin/Senior/Honors/thesis/")
;;             (src-patterns ("*.tex"))
;;             (ignore-patterns ("*.html"))
;;             (tags-file "~/Dropbox/Bowdoin/Senior/Honors/thesis/TAGS")
;;             (file-list-cache "~/Dropbox/Bowdoin/Senior/Honors/thesis/files")
;;             (open-files-cache "~/Dropbox/Bowdoin/Senior/Honors/thesis/open-files")
;;             (vcs git)
;;             (compile-cmd "make -C ~/Dropbox/Bowdoin/Senior/Honors/thesis/ clean && make -C ~/Dropbox/Bowdoin/Senior/Honors/thesis/")
;;             (ack-args nil)
;;             (startup-hook nil)
;;             (shutdown-hook nil)
;;             ))

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

(project-def "slam"
             '((basedir "~/src/fmvot")
               (src-patterns ("*.h" "*.cc" "*.hpp" "*.cpp" "*.s" "*.py" "*.sh" "*.md" "*.txt" "*.cmake"))
               (ignore-patterns ("*.o" "*.html" "*/build/*" " *.d" "#*" "*~"))
               (ignore-dirs ("bin" "include" "share" "build" "docs" "lib64"))
               (tags-file "~/src/fmvot/TAGS")
               (file-list-cache "~/src/fmvot/files")
               (open-files-cache "~/src/fmvot/open-files")
               (vcs git)
               (compile-cmd "make -j25 -k -C ~/src/fmvot/ --no-print-directory")
               (src-find-cmd find-fmvot-files)
               (grep-find-cmd find-fmvot-files)
               (index-find-cmd find-fmvot-files)
               (ack-args "--cpp")
               (startup-hook setup-slam-test)
               (shutdown-hook nil)
               ))


(defun setup-slam-test ()
  (interactive)
  (setq unit-test-command
        (lambda ()
          (setenv "MSPCCS_DATA" "/home/jack/src/slam.git/main/Dependencies/geotrans3.0/data")
          (setenv "LD_LIBRARY_PATH" "/home/jack/src/slam.git/main/Dependencies/svs/bin:/home/jack/src/slam.git/main/Dependencies/swissRanger/lib:/home/jack/src/slam.git/main/Dependencies/opencv/cv/src/.libs:/home/jack/src/slam.git/main/Dependencies/opencv/cxcore/src/.libs:/home/jack/src/slam.git/main/Dependencies/opencv/highgui/.libs:/home/jack/src/slam.git/main/Dependencies/ptam_deps/lib:/home/jack/src/slam.git/main/Dependencies/ptam_deps/lib64:/home/jack/src/fmvot/libs/lib64" )
          (shell-command "cd /home/jack/src/fmvot/libs/libmisb/tests/ && ./test_misb"))
        ))

(defun switch-between-h-and-cc ()
  "Switch between a header (.h) and an C++ implementation (.cc) file using mk-project support"
  (interactive)
  (let ((file (file-name-base))
        (ext (file-name-extension (buffer-file-name)))
        (project-files (ffip-project-files)))
    (message (concat "ext: " ext))
    (message (concat file (if (equalp ext "h") "\.cc" "\.h")))
    (project-find-file (concat "/" file (if (equalp ext "h") "\.cc" "\.h")))))

(global-set-key (kbd "M-s") 'switch-between-h-and-cc)
