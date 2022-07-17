;; test and set bool is a mac
(defconst *is-a-mac* (eq system-type 'darwin))

;; point / cursor color
(set-cursor-color "red")
;; highlight selected
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")



;; which key - fixing C-h or ? paging options in C-h
;; All discussed in 1.8.4 Paging Options of
;; http://elpa.gnu.org/devel/which-key.html
(define-key help-map "\C-h" 'which-key-C-h-dispatch)

;; Mac specific

;; Automatically convert line endings to unix:
(if *is-a-mac*
    (progn
      (defun no-junk-please-were-unixish ()
        (let ((coding-str (symbol-name buffer-file-coding-system)))
          (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
            (set-buffer-file-coding-system 'unix))))

      (add-hook 'find-file-hook 'no-junk-please-were-unixish)))

;; load emacspeak
;; I have set in bash profile export DTK_PROGRAM=mac and EMACSPEAK_DIR=~/emacspeak

(if *is-a-mac*
  (progn
   (defconst *emacspeak-src-dir* "~/emacspeak")
   (defconst *emacspeak-server* "~/emacspeak/servers/mac"))
  (defconst *emacspeak-src-dir* "~/emacspeak")
  (defconst *emacspeak-server* "~/emacspeak/servers/outloud"))

(add-to-list 'Info-default-directory-list (concat *emacspeak-src-dir* "/info"))

(defvar org-ans2 nil)

(add-to-list 'load-path *emacspeak-src-dir*)
(setenv "EMACSPEAK_DIR" *emacspeak-src-dir*)
(setq dtk-program *emacspeak-server*)
(setenv "DTK_PROGRAM" *emacspeak-server*)

(setq emacspeak-aumix-multichannel-capable-p nil)
(setq tts-default-speech-rate 90)
(setq outloud-default-speech-rate 90)
;;(setq emacspeak-vm-use-raman-settings nil)
(setq mac-default-speech-rate 225)
;;(setq emacspeak-erc-my-nick "codeofdusk")
;;(setq emacspeak-erc-speak-all-participants t)

;; I tried sox  play no luck
(setq emacspeak-play-program "/usr/local/bin/mplayer")


;; stopping emacspeak from loading
(load-file (concat *emacspeak-src-dir* "/lisp/emacspeak-setup.el"))
(load-file "~/emacspeak/lisp/mac-voices.el")

;;;;(emacspeak-toggle-auditory-icons t)
;; some said that this fixed their problems
;;(emacspeak-auditory-icon-function 'emacspeak-queue-auditory-icon t)



;; set keys for Apple keyboard, for emacs in OS X
;; http://xahlee.info/emacs/emacs/emacs_hyper_super_keys.html
;;(setq mac-command-modifier 'meta) ; make cmd key do Meta
;;(setq mac-option-modifier 'super) ; make opt key do Super
;;(setq mac-control-modifier 'control) ; make Control key do Control
;;(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper
;; put the modifiers keys back to normal because emacs-mac breaks super
;; set keys for Apple keyboard, for emacs in OS X
(setq mac-command-modifier 'super) ; make cmd key do Meta
(setq mac-option-modifier 'meta) ; make opt key do Super
(setq mac-control-modifier 'control) ; make Control key do Control
;;(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper

;; karabiner return as control
;; https://emacsredux.com/blog/2017/12/31/a-crazy-productivity-boost-remapping-return-to-control-2017-edition/
