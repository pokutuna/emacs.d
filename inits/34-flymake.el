;;;; flymake.el

(use-package flymake
  :init
  (add-hook
   'flymake-mode-hook
   '(lambda ()
      (local-set-key (kbd "M-n") 'flymake-goto-next-error)
      (local-set-key (kbd "M-p") 'flymake-goto-prev-error)))
  :config
  (setq flymake-gui-warnings-enabled nil)
)
