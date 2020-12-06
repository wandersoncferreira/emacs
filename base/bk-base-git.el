(use-package magit
  :ensure t
  :init
  (set-default 'magit-revert-buffers 'silent)
  (set-default 'magit-no-confirm '(stage-all-changes
                                   unstage-all-changes))
  (setq magit-save-repository-buffers t
        magit-auto-revert-mode t
        global-magit-file-mode t ;; enables C-x g, C-x M-g, C-c M-g
        )
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package git-timemachine
  :ensure t
  :after magit)
