(use-package plantuml-mode
  :ensure t
  :after org
  :init
  (setq org-plantuml-jar-path "/home/wanderson/documents/dotfiles/plantuml.jar")
  :config
  (require 'ob-plantuml))

(use-package org
  :ensure t
  :init
  (setq org-duration-format (quote h:mm)
        org-return-follows-link t
        org-agenda-files '("/home/wanderson/documents/agenda")
        org-clock-out-when-done t
        org-agenda-log-mode-items '(closed clock state)
        org-agenda-window-setup 'only-window
        org-log-done 'time
        org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w!)" "STARTED(s!)" "|"
                    "DONE(d)" "CANCELED(c@)" "INACTIVE(i@)" "FAIL(f@)"))
        org-capture-templates
        '(("t" "Todo" entry
           (file+headline "/home/wanderson/documents/agenda/todo.org" "Task")
           "* TODO [#D] %^{Title}\n %i %l"
           :clock-in t :clock-resume t)
          ("a" "App Sauce" entry
           (file+headline "/home/wanderson/documents/work-pj/app-sauce.org" "Tasks")
           "* TODO [#D] %^{Title}\n %i %l"
           :clock-in t :clock-resume t)))
  :config
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (add-hook 'org-after-todo-state-change-hook 'lgm/clock-in-when-started)
  (add-hook 'org-after-todo-state-change-hook 'bk/clock-out-when-waiting))

(use-package ox-reveal
  :ensure t
  :config
  (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"))

;;; setup to help me create the invoice
(defun endless/filter-timestamp (trans back _comm)
  "Remove <> around time-stamps."
  (pcase back
    ((or `jekyll `html)
     (replace-regexp-in-string "&[lg]t;" "" trans))
    (`latex
     (replace-regexp-in-string "[<>]" "" trans))))

(add-to-list 'org-export-filter-timestamp-functions #'endless/filter-timestamp)

(setq-default org-display-custom-times t)

;;; Before you ask: No, removing the <> here doesn't work.
(setq org-time-stamp-custom-formats
      '("<%d %b %Y>" . "<%d/%m %H:%M>"))

(setq org-export-with-sub-superscripts nil)

(set-register ?t '(file . "~/documents/agenda/todo.org"))
