;;;; find.el

;; grep
;; grep, lgrep, rgrep
(use-package grep)

;; grep-edit
;; C-c C-e で編集を反映 C-x s ! で全部保存
(el-get-bundle grep-edit
  :features grep-edit
)

;; moccur
;; (removed)

;; migemo
;; $ brew install cmigemo
(el-get-bundle migemo)
(use-package migemo
  :if (executable-find "cmigemo")
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-user-pattern-alist t)
  (setq migemo-use-frequent-pattern-alist t)
  (setq migemo-pattern-alist-length 1000)
  (setq migemo-coding-system 'utf-8-unix)
  (migemo-init)
)

;; find from region
;; リージョン選択中に C-s で選択範囲がクエリに入る
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))
