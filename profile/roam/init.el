(load-file "~/emacs/base/bk-base-package.el")
(load-file "~/emacs/base/bk-base-org.el")1

(use-package org-roam
  :ensure t
  :diminish org-roam-mode
  :init
  (setq org-roam-directory "~/documents/zettelkasten")
  :config
  (add-hook 'after-init-hook 'org-roam-mode)
  :bind (:map org-roam-mode-map
              (("C-c z k" . org-roam)
               ("C-c z f" . org-roam-find-file)
               ("C-c z g" . org-roam-graph))
              :map org-mode-map
              (("C-c z i" . org-roam-insert)
               ("C-c z I" . org-roam-insert-immediate))))

(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-export-inline-images t)
  (require 'server)
  (unless (server-running-p)
    (server-start))
  (require 'org-protocol)
  (require 'org-roam-protocol))
