;;;; basic.el

;; server start for emacs-client
(use-package server)
(unless (server-running-p)
  (server-start))

;; window
(setq inhibit-startup-message t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq frame-title-format (format "%%f - emacs@%s" (system-name)))
(display-time) ;時刻表示
(column-number-mode t) ;バーにカーソル位置表示
(blink-cursor-mode t) ;カーソル点滅
(global-linum-mode t) ;行番号表示
(setq line-move-visual t) ; 物理行移動
(delete-selection-mode 1) ;リージョンをC-hで削除
(setq gc-cons-threshold (* 10 gc-cons-threshold)) ; GCを減らして軽くする

(setq completion-ignore-case t) ;ファイル名補完で大文字小文字を区別しない
(fset 'yes-or-no-p 'y-or-n-p) ; yes-noをy-nに置き換え
(setq echo-keystrokes 0.1) ;; キーストロークのミニバッファへの表示を早く

;; indent
(setq-default tab-width 2)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40))
(setq-default indent-tabs-mode nil) ; タブではなくスペースを使う
(setq-default fill-column 80) ; M-q などで折り返す幅
(setq indent-line-function 'indent-relative-maybe)

;; 行折り返し表示
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;; basic keybinds
(global-set-key (kbd "C-h") 'delete-backward-char) ;C-hでBS
(global-set-key (kbd "C-x ?") 'help-command) ;C-x ? をhelp-command


;;; kill-ring & clipboard
(setq kill-ring-max 1000)
(setq x-select-enable-clipboard t) ; clipbord 共有

;; M-k でカーソルの後ろの空白を全て消す
;; http://d.hatena.ne.jp/syohex/20111017/1318857029
(defun kill-following-spaces ()
  (interactive)
  (let ((orig-point (point)))
    (save-excursion
      (skip-chars-forward " \t\n")
      (delete-region orig-point (point)))))
(define-key global-map (kbd "M-k") 'kill-following-spaces)

;; 同じ文字列を複数 kill-ring に入れない
(defadvice kill-new (before ys:no-kill-new-duplicates activate)
  (setq kill-ring (delete (ad-get-arg 0) kill-ring)))

;; 空白を kill-ring に入れない
(use-package subr-x)
(defun my-kill-new-string-blank-p (string &optional replace)
  (or replace (not (string-blank-p string))))
(advice-add 'kill-new :before-while 'my-kill-new-string-blank-p)


;;; window switch
;; C-c [hjkl] で window切り替え
(setq windmove-wrap-around t)
(define-key global-map (kbd "C-c j") 'windmove-down)
(define-key global-map (kbd "C-c k") 'windmove-up)
(define-key global-map (kbd "C-c h") 'windmove-left)
(define-key global-map (kbd "C-c l") 'windmove-right)
;; C-x p を C-x o の逆順にwindow切り替える
(define-key ctl-x-map "p"
  #'(lambda (arg) (interactive "p") (other-window (- arg))))


;; 同じファイル名のバッファをわかりやすくする
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  (setq uniquify-ignore-buffers-re "*[^*]+*")
  )


;; emacs終了時に確認メッセージを出す。
;; http://blog.livedoor.jp/techblog/archives/64599359.html
(defadvice save-buffers-kill-emacs
  (before safe-save-buffers-kill-emacs activate)
  "safe-save-buffers-kill-emacs"
  (unless (y-or-n-p "Really exit emacs? ")
    (keyboard-quit)))
