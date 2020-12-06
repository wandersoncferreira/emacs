;; load base configuration
(load-file "~/emacs/bk-base.el")
(load-file "~/emacs/base/bk-base-programming.el")
(load-file "~/emacs/base/bk-base-lisps.el")
(load-file "~/emacs/base/bk-base-git.el")
(load-file "~/emacs/base/bk-base-projects.el")
(load-file "~/emacs/base/bk-base-completion.el")

(load-theme 'default-black t)
(bk/set-consolas-font)

(defun bk/nrepl-warn-when-not-connected ()
  "Function to warn me to start the REPL."
  (interactive)
  (message "Oops! You're not connected to an nREPL server.
Please run M-x cider or M-x cider-jack-in to connect"))

(use-package clojure-mode
  :ensure t
  :init
  (setq nrepl-use-ssh-fallback-for-remote-hosts t
        clojure-toplevel-inside-comment-form t)
  :config
  (defalias 'cquit 'cider-quit)
  (define-key clojure-mode-map (kbd "C-c M-j") #'cider-jack-in)
  (define-key clojure-mode-map (kbd "C-x C-e") 'bk/nrepl-warn-when-not-connected)
  (define-key clojure-mode-map (kbd "C-c C-k") 'bk/nrepl-warn-when-not-connected)
  (define-key clojure-mode-map (kbd "C-c C-z") 'bk/nrepl-warn-when-not-connected))

(use-package cider
  :ensure t)

(use-package clj-refactor
  :ensure t
  :diminish clj-refactor-mode
  :init
  (setq cljr-warn-on-eval nil)
  :config
  (add-hook 'clojure-mode-hook #'clj-refactor-mode)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package flycheck-clj-kondo
  :ensure t
  :after clojure-mode
  :config
  (require 'flycheck-clj-kondo))
