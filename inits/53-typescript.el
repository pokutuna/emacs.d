;;;; typescript.el

(el-get-bundle typescript-mode)
(el-get-bundle tide)

(use-package typescript-mode :mode "\\.ts")

(use-package tide
  :config
  (defun my-ts-mode-hook ()
    (tide-setup)
    (flycheck-mode t)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode t)
    (company-mode +1))
  (add-hook 'typescript-mode-hook 'my-ts-mode-hook))
