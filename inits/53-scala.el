;;;; scala.el

(el-get-bundle hvesalai/scala-mode2)
(el-get-bundle ensime)

(use-package scala-mode2
  :config

  (defun my-scala-mode-hook ()
    (use-package yasnippet
      :config (yas-minor-mode-on))
    (use-package parenthesis
      :config (parenthesis-register-keys "{(\"[" scala-mode-map))
    (local-set-key (kbd "C-m") 'newline-and-indent)
    (local-set-key (kbd "C-j") 'reindent-then-newline-and-indent)
    )
  (add-hook 'scala-mode-hook 'my-scala-mode-hook)

  ;; ac-sources
  ;; TODO 動作確認
  (defun my-ac-scala-source ()
    (add-to-list 'ac-sources 'ac-source-dictionary)
    (add-to-list 'ac-sources 'ac-source-yasnippet)
    (add-to-list 'ac-sources 'ac-source-words-in-buffer)
    (setq ac-sources (reverse ac-sources)))

  (add-hook 'scala-mode-hook 'my-ac-scala-source)
  (add-hook 'ensime-mode-hook 'my-ac-scala-source)
)

(use-package ensime
  :config
  ;; (setq ensime-completion-style 'auto-complete) ; trying to use company
  (setq ensime-goto-test-config-defaults
        (plist-merge ensime-goto-test-config-defaults
                     '(:test-class-suffixes ("Spec" "Test" "Check"))))
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
)
