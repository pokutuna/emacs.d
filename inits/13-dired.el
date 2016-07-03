;;;; dired.el

;; wdired
;; dired バッファで r で rename
(use-package wdired
  :bind (:map dired-mode-map
              ("r" . wdired-change-to-wdired-mode))
)

;; direx
(el-get-bundle direx)
(use-package direx
  :commands (my:direx-iikanzi)
  :bind (( "C-x C-j" . my:direx-iikanzi))
  :config
  (require 'direx-project)
  (defun my:direx-iikanzi ()
    (interactive)
    (if (direx-project:find-project-root-noselect
         (or buffer-file-name default-directory))
        (direx-project:jump-to-project-root-other-window)
      (direx:jump-to-directory-other-window)))
)


;; tramp
(use-package tramp
  :config
  (setq tramp-default-method "ssh")
  (setq tramp-shell-prompt-pattern "^.*[#$%>] *"))
