;;;; util.el

;; 同じファイル名のバッファをわかりやすくする
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-min-dir-content 1)
  )

;; cua 矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; mark-multiple
(el-get-bundle mark-multiple
  (global-set-key (kbd "C-<") 'mark-previous-like-this)
  (global-set-key (kbd "C->") 'mark-next-like-this)
  (global-set-key (kbd "C-M-m") 'mark-more-like-this)
  (global-set-key (kbd "C-*") 'mark-all-like-this)
  )

;; bookmark 保存先
(setq bookmark-default-file (locate-user-emacs-file "etc/bookmark"))


;; htmlize
;; (removed)

;; thingopt
;; (removed)

;; sound-editor
;; (removed)

;; open Dictionary.app
(when (eq system-type 'darwin)
  (defun search-osx-dictionary ()
    (interactive)
    (let* ((word (read-from-minibuffer "Dictionary.app: " (current-word)))
           (url (concat "dict://" word)))
      (browse-url url)))
  (global-set-key (kbd "C-M-f") 'search-osx-dictionary))


;; open-junk-file
(el-get-bundle open-junk-file
  (setq open-junk-file-format (locate-user-emacs-file "etc/junk/%Y/%m/%d-%H%M%S."))
  (global-set-key (kbd "C-x C-z") 'open-junk-file)
)

;; pyong-pyong.el
;; (removed)

;; replace-region-by-ruby
(el-get-bundle pokutuna/replace-region-by-ruby.el
  :features replace-region-by-ruby)

;; jikanwari.el
(use-package jikanwari)

;; dash-at-point.el
(el-get-bundle dash-at-point
  (global-set-key (kbd "C-c d") 'dash-at-point)
  (global-set-key (kbd "C-c e") 'dash-at-point-with-docset)
)

;; git-gutter-fringe
(el-get-bundle git-gutter-fringe
  (global-git-gutter-mode t)
)

;; magit
(el-get-bundle magit)
