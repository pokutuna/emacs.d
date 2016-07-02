;; save.el
;; ファイルの保存や履歴、バックアップ関連設定

;; backup
(setq make-backup-files t)
(setq backup-directory-alist ; backup先
      (list (cons "" (locate-user-emacs-file "backup"))))
(setq version-control t)
(setq delete-old-versions t)
(setq vc-make-backup-files t)


;;recentf
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 100)

;; カーソルを前回編集していた位置に戻す
(load "saveplace")
(setq-default save-place t)


;; ファイル保存時の整形
;;; 行末の whitespace を削除
(setq delete-trailing-whitespace-exclude-patterns
      (list "\\.md$" "\\.markdown$"))
(require 'cl)
(eval-when-compile (require 'cl))
(defun delete-trailing-whitespace-with-exclude-pattern ()
  (interactive)
  (cond ((equal nil (loop for pattern in delete-trailing-whitespace-exclude-patterns
                          thereis (string-match pattern buffer-file-name)))
         (delete-trailing-whitespace))))

;; ファイル保存時にファイル末尾の改行を削除
;; http://www.emacswiki.org/emacs/DeletingWhitespace
(defun my-delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))

;; ファイル保存時に空のファイルなら消すかどうか聞く
(defun delete-file-if-no-contents ()
  (when (and
         (buffer-file-name (current-buffer))
         (= (point-min) (point-max)))
    (when (y-or-n-p "Delete file and kill buffer?")
      (delete-file
       (buffer-file-name (current-buffer)))
      (kill-buffer (current-buffer)))))

(add-hook 'before-save-hook
          '(lambda ()
	     (delete-trailing-whitespace-with-exclude-pattern)
	     (my-delete-trailing-blank-lines)
	     (delete-file-if-no-contents)
	     ))
