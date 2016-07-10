;;;; perl.el

(defalias 'perl-mode 'cperl-mode)

;; mode-compile.el is unmaintained & not found emacsmirror
(el-get-bundle cperl-mode-without-mode-compile
  :url "https://github.com/jrockway/cperl-mode.git"
  :provide cperl-mode
  :post-init (defalias 'perl-mode 'cperl-mode))

(use-package cperl-mode
  :interpreter "perl"
  :mode (("\\.pl$" . cperl-mode)
         ("\\.pm$" . cperl-mode)
         ("\\.PL$" . cperl-mode)
         ("\\.t$" . cperl-mode)
         ("\\.psgi$" . cperl-mode)
         ("cpanfile" . cperl-mode)
         ("\\.def" . cperl-mode) ; api schema
         )
  :config
  (setq cperl-indent-level 4
        cperl-continued-statement-offset 4
        cperl-close-paren-offset -4
        cperl-label-offset -4
        cperl-comment-column 40
        cperl-highlight-variables-indiscriminately t
        cperl-indent-parens-as-block t
        cperl-tab-always-indent nil
        cperl-font-lock t
        cperl-auto-newline t
        cperl-indent-subs-specially nil
        cperl-electric-paren t)

  ;; parenthesis
  (use-package parenthesis
    :config (parenthesis-register-keys "{('\"[<" cperl-mode-map))

  ;; smartchr
  (use-package smartchr
    :config
    (define-key cperl-mode-map (kbd ".") (smartchr '("->" "." "..")))
    (define-key cperl-mode-map (kbd "-") (smartchr '("-" "->" "->{`!!'}")))
    (define-key cperl-mode-map (kbd ">") (smartchr '(">" "=>" ">>" ">=")))
    (define-key cperl-mode-map (kbd "M") (smartchr '("M" "my $`!!' = ")))
    (define-key cperl-mode-map (kbd "D") (smartchr '("D" "use Data::Dumper; warn Dumper `!!';")))
    (define-key cperl-mode-map (kbd "S") (smartchr '("S" "my ($self) = @_;" "my ($self, $`!!') = @_;")))
    (define-key cperl-mode-map (kbd "|") (smartchr '("||" "|")))
    (define-key cperl-mode-map (kbd "&") (smartchr '("&&" "&")))
    )

  ;; flymake
  ;; (removed)
  ;; TODO settting

  ;; perltidy
  ;; (removed)
)
