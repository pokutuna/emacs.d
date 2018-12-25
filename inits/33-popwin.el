;;;; popwin.el
(el-get-bundle popwin)
(use-package popwin
  :config
  (popwin-mode)
  (setq popwin:popup-window-height 0.5)

  ;; helm
  (push '("helm" :regexp t :height 0.5) popwin:special-display-config)

  ;; dired
  (push '(dired-mode :height 0.5) popwin:special-display-config)

  ;; direx
  ;; dedicated で direx バッファ内の切り替えが元のウィンドウになる
  (push '(direx:direx-mode :position left :width 25 :dedicated t)
        popwin:special-display-config)

  ;; undo-tree
  (push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)

  ;; auto-async-byte-compile
  (push '(" *auto-async-byte-compile*" :height 0.3 :stick t) popwin:special-display-config)

  ;; grep
  (push '("*grep*" :height 0.4 :stick t) popwin:special-display-config)

  ;; backtrace
  (push '("*Backtrace*" :height 0.3) popwin:special-display-config)
)
