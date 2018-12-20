;;;; face.el

(transient-mark-mode t) ;regionに色を付ける

;;; color-theme
(el-get-bundle color-theme)
(use-package color-theme
  :config
  (color-theme-initialize)

  (when (window-system)
    (color-theme-gnome2)
    (set-face-foreground 'highlight nil)
    (set-face-background 'highlight "DarkCyan"))

  ;; themeの背景に応じたカーソル行強調
  (defface my-hl-line
    '((((class color) (background dark))
       (:background "MidnightBlue" t))
      (((class color) (background light))
       (:background "LightGoldenrodYellow" t))
      (t (:bold t)))
    "hl-line's my face")

  (setq hl-line-face 'my-hl-line)
  (global-hl-line-mode t)
  )

;; paren
(show-paren-mode t) ;カッコ強調表示
(setq show-paren-delay 0) ;カッコ強調表示ディレイ0
(setq show-paren-style 'expression) ;カッコ内強調表示
(set-face-attribute
 'show-paren-match nil
 :background (face-attribute 'default :background) ;カッコ内背景強調オフ
 :underline "yellow"                               ;カッコ内アンダーライン
 )


;; カーソル縦軸ハイライト
(el-get-bundle col-highlight)
(use-package col-highlight
  :config
  (col-highlight-set-interval 1)
  (col-highlight-toggle-when-idle t)
  (setq col-highlight-face 'my-hl-line)
)

;; カーソル強調
(set-cursor-color "orange")
(setq blink-cursor-interval 0.2)
(setq blink-cursor-delay 0.2)
(blink-cursor-mode 1)


;;; 全角SPC、tab、行末スペースを強調表示
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "red" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
     ("　" 0 my-face-b-1 append)
     ("\t" 0 my-face-b-2 append)
     ("[ ]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode nil
                                (font-lock-mode t))) t)

;; Font
(when window-system
  (let* ((size 130)
         (asciifont "VL Gothic")
         (jpfont "VL Gothic")
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont)))
    (set-face-attribute 'default nil :family asciifont :height size)
    (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
    (set-fontset-font nil '(#x0080 . #x024F) fontspec)
    (set-fontset-font nil '(#x0370 . #x03FF) fontspec))
  )
