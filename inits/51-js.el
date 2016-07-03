;;;; js.el

;; js2-mode
(el-get-bundle js2-mode)
(use-package js2-mode
  :mode "\\.js$"
  :config
  (setq-default js2-basic-offset 4)
)

;; json-mode
(el-get-bundle json-mode)
(use-package json-mode
  :mode "\\.json")
