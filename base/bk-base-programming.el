(use-package flycheck
  :ensure t
  :init
  (setq flycheck-check-syntax-automatically '(mode-enabled save)
        flycheck-display-errors-delay 0.25)
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package whitespace-cleanup-mode
  :ensure t
  :diminish whitespace-cleanup-mode
  :config
  (whitespace-cleanup-mode +1))

(use-package hl-todo
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'hl-todo-mode))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode +1)
  (define-key yas-minor-mode-map [(tab)] nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand))

(use-package yasnippet-snippets
  :ensure t)

(use-package docker
  :ensure t
  :config
  (global-set-key (kbd "C-c d") 'docker))
