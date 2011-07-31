(provide 'my-env)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/git/bin"))
(setq exec-path (append exec-path '("/usr/local/git/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/sw/bin"))
(setq exec-path (append exec-path '("/sw/bin")))


(setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin"))
(setq exec-path (append exec-path '("/opt/local/bin")))

