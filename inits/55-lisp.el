;;;; lisp.el

(use-package emacs-lisp-mode :mode "\\.el$")

;; lispxmp
;; add result after `; =>`
;; removed

;; paredit
(el-get-bundle paredit)
(use-package paredit
  :config
  (let ((mode-hook))
    (dolist (mode-hook '(emacs-lisp-mode-hook
                         lisp-interaction-mode-hook
                         lisp-mode-hook
                         ielm-mode-hook))
      (add-hook mode-hook 'enable-paredit-mode))))

;; auto-async-byte-compile
(el-get-bundle auto-async-byte-compile)
(use-package auto-async-byte-compile
  :config
  (setq auto-async-byte-compile-exclude-files-regexp "/inits/\\|/config/\\|/junk/\\|init.el")
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))
