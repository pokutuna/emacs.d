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
  (add-hook 'typescript-mode-hook 'my-ts-mode-hook)

  ;; use project's tsserver if exists
  (defun my-set-project-tsserver ()
    (let ((project-tsserver-path (concat tide-project-root "node_modules/typescript/bin/tsserver")))
      (when (file-exists-p project-tsserver-path)
        (setq-local tide-tsserver-executable project-tsserver-path))
      ))
  (advice-add 'tide-start-server :before 'my-set-project-tsserver)

  )
