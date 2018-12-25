;;;; ruby.el

(el-get-bundle ruby-end)
(el-get-bundle ruby-block)

;; ruby-mode
;; (should update to https://github.com/zenspider/enhanced-ruby-mode)
(use-package ruby-mode
  :interpreter "ruby"
  :mode (("\\.rb$" . ruby-mode)
         ("Rakefile" . ruby-mode)
         ("Capfile" . ruby-mode)
         ("Gemfile" . ruby-mode))
  :config
  (defun my-ruby-mode-hook ()
    (setq ruby-indent-level 2
          ruby-indent-tabs-mode nil
          ruby-deep-indent-paren-style nil) ;C-M-\ でindentととのえる

    (use-package parenthesis
      :config (parenthesis-register-keys "(\"['" ruby-mode-map))

    (use-package smartchr
      :config
      (define-key ruby-mode-map (kbd "{") (smartchr '("{`!!'}" "{|`!!'| }" "do |`!!'|\nend"))))

    ;; ruby-block
    (use-package ruby-block
      :config
      (ruby-block-mode t)
      (setq ruby-block-highlight-toggle t))

    ;; ruby-end
    (use-package ruby-end)


    ;; auto-magick-comment
    (defun ruby-insert-magic-comment-if-needed ()
      "バッファのcoding-systemをもとにmagic commentをつける。"
      (when (and (eq major-mode 'ruby-mode)
                 (find-multibyte-characters (point-min) (point-max) 1))
        (save-excursion
          (goto-char 1)
          (when (looking-at "^#!")
            (forward-line 1))
          (if (re-search-forward "^#.+coding" (point-at-eol) t)
              (delete-region (point-at-bol) (point-at-eol))
            (open-line 1))
          (let* ((coding-system (symbol-name buffer-file-coding-system))
                 (encoding (cond ((string-match "japanese-iso-8bit\\|euc-j" coding-system)
                                  "euc-jp")
                                 ((string-match "shift.jis\\|sjis\\|cp932" coding-system)
                                  "shift_jis")
                                 ((string-match "utf-8" coding-system)
                                  "utf-8"))))
            (insert (format "# coding: %s" encoding))))))
    (add-hook 'before-save-hook 'ruby-insert-magic-comment-if-needed)

    ;; flymake for ruby
    ;; http://d.hatena.ne.jp/khiker/20070630/emacs_ruby_flymake
    (require 'flymake)
    (defun flymake-ruby-init ()
      (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-inplace))
             (local-file  (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
        (list "ruby" (list "-c" local-file))))
    (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
    (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
    (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

    ;; RSense
    ;; https://github.com/rsense/rsense
    ;; (maybe this settings are old)
    (use-package rsense
      :bind (:map ruby-mode-map ("M-i" . ac-complete-rsense))
      :config
      (setq rsense-home (expand-file-name (locate-user-emacs-file "etc/rsense-0.3")))
      (add-to-list 'load-path (concat rsense-home "/etc"))
      (add-to-list 'ac-sources 'ac-source-rsense-method)
      (add-to-list 'ac-sources 'ac-source-rsense-constant)

      ;; TODO setting & download rurema
      (setq rsense-rurema-home (concat rsense-home "/rurema"))
      )

    ;; anything-rdefs
    ;; (removed)
    ;; (bind C-@)

    ) ; my-ruby-mode-hook

  (add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
  )
