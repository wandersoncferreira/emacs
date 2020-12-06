(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; no splash screen
(setq inhibit-startup-message t)

;; setup custom themes
(setq custom-theme-directory (concat user-emacs-directory "themes")
      custom-safe-themes t)

(dolist (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

;; activate paren highlight
(show-paren-mode +1)

(bk/set-consolas-font)

;;; move between window
(windmove-default-keybindings)

(use-package windresize
  :ensure t)

;;; moving between tmux panes
(defun bk/windmove (windmove-fn tmux-param)
  "Base function to move windows from WINDMOVE-FN or using TMUX-PARAM."
  (interactive)
  (condition-case nil
      (funcall windmove-fn)
    (error (shell-command (concat "tmux select-pane " tmux-param)))))

(defun bk/windmove-up ()
  "Move up."
  (interactive)
  (bk/windmove 'windmove-up "-U"))

(defun bk/windmove-down ()
  "Move down."
  (interactive)
  (bk/windmove 'windmove-down "-D"))

(defun bk/windmove-left ()
  "Move left."
  (interactive)
  (bk/windmove 'windmove-left "-L"))

(defun bk/windmove-right ()
  "Move right."
  (interactive)
  (bk/windmove 'windmove-right "-R"))

(global-set-key (kbd "S-<down>") 'bk/windmove-down)
(global-set-key (kbd "S-<up>") 'bk/windmove-up)
(global-set-key (kbd "S-<left>") 'bk/windmove-left)
(global-set-key (kbd "S-<right>") 'bk/windmove-right)

