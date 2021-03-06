
(load-file "~/emacs/base/bk-base-package.el")

(defun bk/clean-ledger ()
  "Bring back timeline structure to the whole file."
  (interactive)
  (if (eq major-mode 'ledger-mode)
      (let ((curr-line (line-number-at-pos)))
        (ledger-mode-clean-buffer)
        (line-move (- curr-line 1)))))

(use-package ledger-mode
  :ensure t
  :mode ("\\ledger$" . ledger-mode)
  :config
  (setq ledger-reports
        '(("food" "ledger [[ledger-mode-flags]] -f /home/wanderson/documents/ledger -X R$ --current bal ^expenses:food")
          ("apartamento-morumbi" "ledger [[ledger-mode-flags]] -f /home/wanderson/documents/ledger -X R$ --current bal ^expenses:house")
          ("creta" "ledger [[ledger-mode-flags]] -f /home/wanderson/documents/ledger -X R$ --current bal ^expenses:car:creta ^equity:car:creta")
          ("netcash" "ledger [[ledger-mode-flags]] -f /home/wanderson/documents/ledger -R -X R$ --current bal ^assets:bank liabilities:card")
          ("networth" "ledger [[ledger-mode-flags]] -f /home/wanderson/documents/ledger -X R$ --current bal ^assets:bank liabilities equity:apartment")
          ("spent-vs-earned" "ledger [[ledger-mode-flags]] -f /home/wanderson/documents/ledger bal -X BRL --period=\"last 4 weeks\" ^Expenses ^Income --invert -S amount")
          ("budget" "ledger [[ledger-mode-flags]] -f /home/wanderson/documents/ledger -X R$ --current bal ^assets:bank:checking:budget liabilities:card")
          ("taxes" "ledger [[ledger-mode-flags]] -f /home/wanderson/documents/ledger -R -X R$ --current bal ^expenses:taxes")
          ("bal" "%(binary) -f %(ledger-file) bal")
          ("reg" "%(binary) -f %(ledger-file) reg")
          ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
          ("account" "%(binary) -f %(ledger-file) reg %(account)"))))

(use-package flycheck-ledger
  :ensure t
  :config
  (add-hook 'ledger-mode-hook 'flycheck-mode))

(set-register ?l '(file . "~/documents/ledger"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-ledger ledger-mode exec-path-from-shell markdown-mode diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
