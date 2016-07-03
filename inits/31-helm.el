;;;; heml.el

;; helm が C-x C-j を上書きするのを防ぐ
(setq dired-bind-jump nil)

(el-get-bundle helm)
(use-package helm
  :bind (("C-;" . helm-for-files)
         ([f7]  . helm-for-files)
         ("M-y"     . helm-show-kill-ring)
         ("M-x"     . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-r" . helm-recentf)
         ("C-x b"   . helm-buffers-list)
         ("C-c i"   . helm-imenu)  ;; imenu でメソッド一覧とか見る
         ("C-M-z"   . helm-resume) ;; 選択する前に戻れる
         ("C-o"     . helm-occur)  ;; バッファ内をインタラクティブに検索

         :map helm-map
         ("C-k" . kill-line)
         ("C-h" . delete-backward-char)
         ("C-p" . helm-previous-line)
         ("C-n" . helm-next-line)
         ("C-v" . helm-next-page)
         ("M-v" . helm-previous-page)
         ("M-n" . helm-next-source)
         ("M-p" . helm-previous-source)

         ;; modes
         :map helm-read-file-map
         ("TAB" . helm-execute-persistent-action)

         :map helm-find-files-map
         ("TAB" . helm-execute-persistent-action)
         ("C-h" . delete-backward-char) ;; cancel overridden
         )
  :config
  (helm-mode 1)
  (setq
   helm-idle-delay 0.02
   helm-input-idle-delay 0.02
   helm-candidate-number-limit 200
   helm-quick-update t
   helm-buffer-max-length 35
   )

  ;; soruces
  (setq helm-for-files-preferred-list
        '(helm-source-buffers-list
          helm-source-files-in-current-dir
          helm-source-recentf
          ;; helm-source-bookmarks
          ;; helm-source-file-cache
          ;; helm-source-locate
          ))

  ;; helm 内で migemo を有効にする
  (helm-migemo-mode)
  )

;; helm-descbinds
(el-get-bundle helm-descbinds
  (helm-descbinds-mode))

;; helm-git-grep
;; (removed)

;; helm-ag
(el-get-bundle helm-ag)
(use-package helm-ag
  :bind (("C-M-o" . helm-do-ag)
         ("C-S-o" . helm-do-ag-buffers)))

;; helm-git-files
(el-get-bundle tarao/helm-git-files-el :depends helm)
(use-package helm-git-files
         :bind (("C-M-;" . helm-git-files)))
