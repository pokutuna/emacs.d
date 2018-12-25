;; Do not depend on ` ~/.emacs.d` and use `locate-user-emacs-file` to reference files
;; To load other init.el is `$ emacs -q -l ~/other/init.el`
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))


;; add load-path with relative path from `user-emacs-directory`(`.emacs.d`)
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))


;; el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; el-get-lock
;; https://github.com/tarao/el-get-lock
(el-get-bundle tarao/el-get-lock)
(el-get-lock)

;; `elisp/` is not in the control of el-get
(add-to-load-path "elisp")


;; use-package
;; https://github.com/jwiegley/use-package
;; http://qiita.com/kai2nenobu/items/5dfae3767514584f5220
(el-get-bundle use-package)


;; init-loader
;; 0* : core & global configs
;; 1* : utilities
;; 3* : general & important extentions
;; 5* : programming languages
;; 9* : misc
(el-get-bundle init-loader)
(init-loader-load (locate-user-emacs-file "inits"))
(put 'upcase-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (rainbow-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
