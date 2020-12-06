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

(use-package winner
  :init
  (setq winner-dont-bind-my-keys t
        winner-boring-buffers
        '("*Completions*"
          "*Compile-Log*"
          "*inferior-lisp*"
          "*Fuzzy Completions*"
          "*Apropos*"
          "*Help*"
          "*cvs*"
          "*Buffer List*"
          "*Ibuffer*"
          "*esh command on file*"))
  :config
  (winner-mode +1)
  (global-set-key (kbd "C-x 4 u") 'winner-undo)
  (global-set-key (kbd "C-x 4 U") 'winner-redo))

;; add the system clipboard to the emacs kill-ring
(setq save-interprogram-paste-before-kill t)

;; complete
(setq tab-always-indent 'complete)

;;; basics
(setq tab-always-indent 'complete
      vc-follow-symlinks t
      create-lockfiles nil
      backup-directory-alist `(("." . ,(expand-file-name
                                        (concat user-emacs-directory "backups")))))

;;; start recentf
(recentf-mode +1)

;;; visible bell
(setq visible-bell nil
      ring-bell-function nil)

;;; uniquify
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      uniquify-separator " * "
      uniquify-after-kill-buffer-p t
      uniquify-strip-common-suffix t
      uniquify-ignore-buffers-re "^\\*")

;;; dired
(setq dired-dwim-target t)

;;; go back to last marked place
(global-set-key (kbd "C-x p") 'pop-to-mark-command)

;;; abbreviate yes-or-no questions
(fset 'yes-or-no-p 'y-or-n-p)

;;; don't use tabs to indent
(setq-default indent-tabs-mode nil)

;;; advices
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (when (eq last-command 'save-region-or-current-line)
      ad-do-it
      ad-do-it
      ad-do-it)
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))

(use-package tramp
  :config
  (setq projectile-mode-line "Projectile"))

(use-package dired
  :config
  (require 'dired-x)
  (global-set-key (kbd "C-x C-j") 'dired-jump))
