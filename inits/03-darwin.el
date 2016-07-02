;;;; darwin.el
;;;; settings for OSX
(when (eq system-type 'darwin)

  ;;; with window-system
  (when (eq window-system 'ns)

    ;; disable dialog
    (setq use-dialog-box nil)
    (defalias 'message-box 'message)

    ;; option <-> command
    (setq ns-command-modifier (quote meta))
    (setq ns-alternate-modifier (quote super))

    ;; open file by drag & drop
    (define-key global-map [ns-drag-file] 'ns-find-file)

    ;; disable Japanese input on focus to minibuffer
    (when (fboundp 'mac-auto-ascii-mode)
      (mac-auto-ascii-mode 1))

    ))
