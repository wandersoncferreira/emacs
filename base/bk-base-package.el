(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-pinned-packages '())

(package-initialize)

(unless (file-exists-p (expand-file-name "elpa/archives/melpa" user-emacs-directory))
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish))

(use-package markdown-mode
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-arguments nil)
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))




