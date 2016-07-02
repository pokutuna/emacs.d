;; LANG
(setenv "LANG" "ja_JP.UTF-8")

;; SHELL & PATH from shell setting
;; https://github.com/purcell/exec-path-from-shell
(el-get-bundle exec-path-from-shell
  (setq shell-file-name "/usr/local/bin/zsh")
  (when (executable-find shell-file-name)
    (setenv "SHELL" shell-file-name)
    (exec-path-from-shell-initialize)
  ))

;; HOME is default current directory
(cd "~")

;; charset
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
