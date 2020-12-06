;; keep emacs custom-settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; tab also complete
(setq tab-always-indent 'complete)

;; create lockfiles
(setq create-lockfiles nil)

;; deal with backups
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; yes-or-no into y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; activate dired
(require 'dired)
(global-set-key (kbd "C-x C-j") 'dired-jump)
