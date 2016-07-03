;;;; go.el

(el-get-bundle go-mode)
(el-get-bundle go-autocomplete)

(use-package go-mode
  :mode "\\.go$"
  :config
  (use-package go-autocomplete)
  (add-hook 'go-mode-hook 'go-eldoc-setup)

  (use-package smartchr
    :config
    (define-key go-mode-map (kbd ":") (smartchr '(":" ":=")))
    )

  ;; `goimports` required
  ;; $ go get golang.org/x/tools/cmd/goimports
  (when (executable-find "goimports")
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save))
)
