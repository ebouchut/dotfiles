(setq load-path (cons (expand-file-name "~/.emacs.d/elisp") load-path))

; allows syntax highlighting to work
(global-font-lock-mode 1)

; stops me killing emacs by accident!
(setq confirm-kill-emacs 'yes-or-no-p)

(setq inhibit-splash-screen t)

;; ~~~~~~~~~~~~
;; Color Theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)
     )
)

;;~~~~~~~~~~~~
;; Load CEDET.
;; This is required by ECB which will be loaded later.
;; See cedet/common/cedet.info for configuration details.
(load-file "~/.emacs.d/elisp/cedet-1.0/common/cedet.el")

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;;~~~~~~~~~~~~~~~~~~~~~~~~
;; ECB
(add-to-list 'load-path "~/.emacs.d/elisp/ecb-2.40")
(load-file "~/.emacs.d/elisp/ecb-2.40/ecb.el")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(ecb-layout-name "left14")
  '(ecb-layout-window-sizes (quote (("left14" (0.2564102564102564 . 0.6949152542372882) (0.2564102564102564 . 0.23728813559322035)))))
  '(ecb-source-path (quote ("~dev")))

  ;; Use the left mouse button to open file
  '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))

  ;; No Tip of the day
  '(ecb-tip-of-the-day nil)
  '(ecb-tree-buffer-style (quote ascii-guides))
  '(ecb-options-version "2.40")
)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )



; ~~~~~~~~~~~~~~~~~~~~~~~~
; loads Ruby mode when a .rb file is opened.
;(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
;(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
;(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))
(add-hook 'ruby-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
                  '(lambda()
                     (save-excursion
                       (untabify (point-min) (point-max))
                       (delete-trailing-whitespace)
                       )))
        (set (make-local-variable 'indent-tabs-mode) 'nil)
        (set (make-local-variable 'tab-width) 2)
        (imenu-add-to-menubar "IMENU")
        (define-key ruby-mode-map "\C-m" 'newline-and-indent) ;Not sure if this line is 100% right!
        (require 'ruby-electric)
        (ruby-electric-mode t)
        ))

;;~~~~~~~~~~~~~
;;; rhtml mode
(add-to-list 'load-path "~/.emacs.d/elisp/rhtml")
(require 'rhtml-mode)

; ~~~~~~~~~~~~~~~~~~~~~~~~
; Install mode-compile to give friendlier compiling support!
(autoload 'mode-compile "mode-compile"
	  "Command to compile current buffer file based on the major mode" t)
 (global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
	  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)


; ~~~~~~~~~~~~
; emacs_rails
;
(setq load-path (cons (expand-file-name "~/.emacs.d/elisp/rails-reloaded") load-path))
(require 'rails-autoload)

