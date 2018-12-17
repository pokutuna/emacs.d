;;;; markup.el
;;;; configs for markup languages

;; web-mode
(el-get-bundle web-mode)
(use-package web-mode
  :mode (("\\.html?$" . web-mode)
         ("\\.tx$" . web-mode))
  :config
  (setq web-mode-engines-alist
        '(("template-toolkit" . "\\.html?\\'" )))
  (setq web-mode-markup-indent-offset 2)
  )

;; emmet-mode (new zencoding)
;; TODO setting
(el-get-bundle emmet-mode)
(use-package emmet-mode)

;; markdown
(el-get-bundle markdown-mode)
(use-package markdown-mode
  :mode (("\\.md$" . gfm-mode)
         ("\\.markdown$" . gfm-mode))
  :config
  (use-package parenthesis
    :config (parenthesis-register-keys "{('\"[<`" gfm-mode-map))
  )

;; rainbow
(el-get-bundle rainbow-mode)
(use-package rainbow-mode
  :config
  (let ((mode-hook))
    (dolist (mode-hook '(html-mode-hook
                         css-mode-hook
                         less-mode-hook
                         sass-mode-hook
                         scss-mode-hook))
      (add-hook mode-hook '(lambda () (rainbow-mode t)))))
  )


;; scss
;; TODO check with flymake
(el-get-bundle scss-mode)
(use-package scss-mode
  :mode "\\.scss$"
  :config
  (setq css-indent-offset 2)
  )

;; less
(el-get-bundle less-css-mode)
(use-package less-css-mode
  :mode "\\.less$"
  :config (setq less-css-compile-at-save nil))

;; haml
;; (removed)

;; slim
;; (removed)
