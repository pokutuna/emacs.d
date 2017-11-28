(el-get-bundle python-mode)
(el-get-bundle jedi)
(el-get-bundle virtualenvwrapper)
(el-get-bundle auto-virtualenvwrapper
  :url "git@github.com:robert-zaremba/auto-virtualenvwrapper.el.git")

(use-package python-mode
  :mode (("\\.py$" . python-mode))
  :config
  )

(use-package jedi
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  :config
  (setq jedi:complete-on-dot t)
  ;; M-x jedi:install-server
)


(use-package virtualenvwrapper)
(use-package auto-virtualenvwrapper
  :init
  (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate))
