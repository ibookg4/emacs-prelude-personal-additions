;; point / cursor color
(set-cursor-color "red")
;; highlight selected
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")

;; which key - fixing C-h or ? paging options in C-h
;; All discussed in 1.8.4 Paging Options of
;; http://elpa.gnu.org/devel/which-key.html
(define-key help-map "\C-h" 'which-key-C-h-dispatch)

;; Automatically convert line endings to unix:

(defun no-junk-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'unix))))

(add-hook 'find-file-hooks 'no-junk-please-were-unixish)
