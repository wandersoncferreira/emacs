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

;; define consolas as default font
(when (member "Consolas" (font-family-list))
  (set-face-attribute 'default nil :font "Consolas" :height 130))
