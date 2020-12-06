(use-package deft
  :ensure t
  :init
  (setq deft-extensions '("org")
        deft-directory "~/documents/notes"
        deft-use-filename-as-title t
        deft-use-filter-string-for-filename t
        deft-auto-save-interval 0
        deft-file-naming-rules '((noslash . "-")
                                 (nospace . "-")
                                 (case-fn . downcase)))
  :config
  (global-set-key (kbd "C-c t n") 'deft)
  (global-set-key (kbd "C-c f n") 'deft-find-file))
