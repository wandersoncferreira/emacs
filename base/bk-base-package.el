(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-pinned-packages '())

(package-initialize)

(unless (file-exists-p (expand-file-name "elpa/archives/melpa" user-emacs-directory))
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish))
