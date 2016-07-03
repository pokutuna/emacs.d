;;;; auto-complete.el

(el-get-bundle auto-complete)
(use-package auto-complete
  :bind (("M-i" . auto-complete)
         ("M-o" . ac-complete-look)
         :map ac-complete-mode-map
         ("M-n" . ac-next)
         ("M-p" . ac-previous)
         ("C-s" . ac-isearch))
  :config
  (ac-config-default)
  (global-auto-complete-mode t)
  (auto-complete-mode t)
  (setq ac-dwim t)
  (setq ac-ignore-case 'smart)
  (setq popup-use-optimized-column-computation t)
  (setq ac-auto-start 2)
  (setq ac-auto-show-menu 0.4)
  (setq ac-menu-height 20)
  (ac-set-trigger-key "TAB")

  ;; dictionary
  (add-to-list 'ac-dictionary-directories
               (expand-file-name (locate-user-emacs-file "ac-dict/")))

  ;; default source
  (setq-default ac-sources (add-to-list 'ac-sources 'ac-source-yasnippet))


  ;; lookで英単語補完
  ;; http://d.hatena.ne.jp/kitokitoki/20101205/p2
  (defun my-ac-look ()
    "look コマンドの出力をリストで返す"
    (interactive)
    (unless (executable-find "look")
      (error "look コマンドがありません"))
    (let ((search-word (thing-at-point 'word)))
      (with-temp-buffer
        (call-process-shell-command "look" nil t 0 search-word)
        (split-string-and-unquote (buffer-string) "\n"))))

  (defun ac-complete-look () (interactive) (auto-complete '(ac-source-look)))
  (defvar ac-source-look '((candidates . my-ac-look) (requires . 2)))
  )
