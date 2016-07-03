;;;; yasnippet.el

(el-get-bundle yasnippet)
(use-package yasnippet
  :bind (("C-c C-s" . yas-insert-snippet))
  :config
  (setq yas-snippet-dirs
        (list (locate-user-emacs-file "mysnippets")
              (locate-user-emacs-file "el-get/yasnippet/snippets")))
  (yas-reload-all)
  (yas-global-mode 1)

  ;; コメントやリテラルではスニペットを展開しない
  ;; (removed)

  ;; yasnippet展開中はflymakeを無効にする
  ;; (removed)
)
