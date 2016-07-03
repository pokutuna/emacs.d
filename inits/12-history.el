;;;; history.el

;; undo-hist
(el-get-bundle undohist
  :features undohist
  (undohist-initialize)
)

;; undo-tree
;; C-x u で履歴を視覚化したバッファが出る
(el-get-bundle undo-tree
  (global-undo-tree-mode)
  (global-set-key (kbd "C-'") 'redo) ;; redo は undo-tree で提供される
)

;; point-undo
;; カーソル位置の undo/redo
(el-get-bundle point-undo
  :features point-undo
  (define-key global-map [f6] 'point-undo)
  (define-key global-map [f8] 'point-redo))
