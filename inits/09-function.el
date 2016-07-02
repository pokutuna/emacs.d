;;;; function.el
;;;; global helpers for inits

;; plist をマージする
(defun plist-merge (&rest plists)
  "Create a single property list from all PLISTS. Inspired by `org-combine-plists'."
  (let ((rtn (pop plists)))
    (dolist (plist plists rtn)
      (setq rtn (plist-put rtn
                           (pop plist)
                           (pop plist))))))
