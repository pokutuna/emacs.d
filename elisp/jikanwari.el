(when (require 'time nil t)
 (defun jikanwari (&optional time)
   (destructuring-bind (sec min hour &rest) (decode-time (or time (current-time)))
     (let ((hourmin (+ (* hour 100) min)))
       (cond
         ((and (>= hourmin 1000)
               (<  hourmin 1040))
          (format "朝の会@%d" (- 40 min)))
         ((and (>= hourmin 1050)
               (<  hourmin 1150))
          (format "1時限目@%d" (- (+ (* (- 11 hour) 60) 50) min)))
         ((and (>= hourmin 1200)
               (<  hourmin 1300))
          (format "2時限目@%d" (- 60 min)))
         ((and (>= hourmin 1300)
               (<  hourmin 1400))
          "昼休み")
         ((and (>= hourmin 1400)
               (<  hourmin 1500))
          (format "3時限目@%d" (- 60 min)))
         ((and (>= hourmin 1510)
               (<  hourmin 1610))
          (format "4時限目@%d" (- (+ (* (- 16 hour) 60) 10) min)))
         ((and (>= hourmin 1620)
               (<  hourmin 1720))
          (format "5時限目@%d" (- (+ (* (- 17 hour) 60) 20) min)))
         ((and (>= hourmin 1730)
               (<  hourmin 1830))
          (format "6時限目@%d" (- (+ (* (- 18 hour) 60) 30) min)))
         ((and (>= hourmin 1840)
               (<  hourmin 1900))
          "帰りの会")
         ((= hour 19) "放課後")
         ((and (>= hour 10)
               (< hour 19))
          "休み時間")))))
  (defvar original-display-time-string-forms display-time-string-forms)
  (defadvice display-time-update (before display-time-update-with-teiji activate)
    (setq display-time-string-forms
          (append original-display-time-string-forms
                  `(" " ,(jikanwari) " "))))
  (display-time))

(provide 'jikanwari)
