(use-package popup :ensure t)

;; temporary fix for error args-out-of-range
;; https://github.com/atykhonov/google-translate/issues/98
(defun google-translate-json-suggestion (json)
  "Retrieve from JSON (which returns by the
`google-translate-request' function) suggestion. This function
does matter when translating misspelled word. So instead of
translation it is possible to get suggestion."
  (let ((info (aref json 7)))
    (if (and info (> (length info) 0))
        (aref info 1)
      nil)))

(use-package google-translate
  :ensure t
  :init
  (setq google-translate-default-source-language "pt"
        google-translate-default-target-language "eng"
        google-translate-pop-up-buffer-set-focus t
        google-translate-enable-ido-completion nil)
  
  (setq google-translate-base-url "https://translate.google.com/translate_a/single"
        google-translate--tkk-url "https://translate.google.com/")
  :config
  (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))
  (require 'google-translate-smooth-ui))
