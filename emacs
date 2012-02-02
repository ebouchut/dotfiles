(setq load-path (cons (expand-file-name "~/.emacs.d/include") load-path))
;(add-to-list ‘load-path "~/.emacs.d/include")

(global-font-lock-mode 1)

; ~~~~~~~~~~~~~~~~~~~~~~~~
; loads ruby mode when a .rb file is opened.
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
;(setq load-path (cons (expand-file-name "~/.emacs.d/rails-reloaded") load-path))
;(require 'rails-autoload)

; ~~~~~~~~~~~~
; color theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))