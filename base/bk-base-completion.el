(use-package company
  :ensure t
  :diminish company-mode
  :init
  (setq company-show-numbers t
        company-idle-delay 0.25
        company-echo-delay 0.5
        company-minimum-prefix-length 2
        company-require-match 'never)
  :config
  (define-key company-active-map [(control) (meta) ?s] 'company-search-candidates)
  (define-key company-active-map "\C-s" 'company-filter-candidates)
  (define-key company-active-map (kbd "C-p") #'company-select-previous-or-abort)
  (define-key company-active-map (kbd "C-n") #'company-select-next-or-abort)
  (global-company-mode t))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t
        ivy-case-fold-search-default t
        enable-recursive-minibuffers t
        ivy-initial-inputs-alist nil)
  :config
  (ivy-mode +1))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-m") 'counsel-M-x)
  (global-set-key (kbd "C-c i") 'counsel-imenu))
