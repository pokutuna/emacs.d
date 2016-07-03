;;;; completion.el

;; smartchr
(el-get-bundle smartchr)
(use-package smartchr
  :config
  (define-key global-map (kbd ">") (smartchr '(">" "=>" "=> '`!!''" "=> \"`!!'\"")))
  (define-key global-map (kbd "`") (smartchr '("`" "``!!'`" "````!!'```")))
)

;; parenthesis
;; http://d.hatena.ne.jp/khiker/20080118/parenthesis
(use-package parenthesis
  :config
  (parenthesis-register-keys "{('\"[" global-map)
  (parenthesis-init))

;; smartparens
;; (removed)
