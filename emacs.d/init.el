(setq load-path (cons (expand-file-name "~/.emacs.d/elisp") load-path))

; allows syntax highlighting to work
(global-font-lock-mode 1)
; Use as much colour as possible
(setq font-lock-maximum-size nil)

; stops me killing emacs by accident!
(setq confirm-kill-emacs 'yes-or-no-p)

(setq inhibit-splash-screen t)

(setq mac-command-modifier 'meta
      mac-option-modifier nil
      mac-allow-anti-aliasing t
      mac-command-key-is-meta t)


;; ~~~~~~~~~~~~~~~
;; Color Theme: requires the package emacs-goodies-el
(add-to-list 'load-path "~/.emacs.d/elisp/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)
     )
)

;; Mettre un titre aux fenêtres
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;; Display the column number
(column-number-mode 1)
(line-number-mode 1)

;; M-g key binding for goto-line
(global-set-key [(meta g)] 'goto-line)

;; Store backup files in a centralized location
(setq backup-directory-alist
      '(("." . "~/.emacs-backup-files/")))

; Recherche automatique des fermetures et ouvertures des parenthèses
;; Voir cette adresse pour quelquechose de plus fin :
;; http://www.linux-france.org/article/appli/emacs/faq/emacs-faq-7.html
(load-library "paren")
(show-paren-mode 1)

;; Recent Files mapped to C-X C-r
;;
(require 'recentf)
(recentf-mode 1)

(defun recentf-open-files-compl ()
      (interactive)
      (let* ((all-files recentf-list)
        (tocpl (mapcar (function 
           (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
        (prompt (append '("File name: ") tocpl))
        (fname (completing-read (car prompt) (cdr prompt) nil nil)))
        (find-file (cdr (assoc-ignore-representation fname tocpl))))) 

(global-set-key "\C-x\C-r" 'recentf-open-files-compl)

; Make buffer names even more unique (using a friendlier name)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)


;;~~~~~~~~~~~~
;; Make dired less verbose.
;;   Use ')' to show hidden ls details and '(' to hide them again.
;;   http://whattheemacsd.com/setup-dired.el-01.html
(add-to-list 'load-path "~/.emacs.d/elisp/external/dired-details")
(add-to-list 'load-path "~/.emacs.d/elisp/external/dired-details-plus")
(require 'dired-details+)
(setq-default dired-details-hidden-string "--- ")


;;~~~~~~~~~~~~
;; IDO Mode - Interactive Do Things (Switch Buffer, Open File)
;; 
(require 'ido)
(ido-mode t)


;;~~~~~~~~~~~~
;; CEDET.
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

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)


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
  '(ecb-source-path (quote ("~/dev")))

  ;; Use the left mouse button to open file
  '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))

  '(ecb-tip-of-the-day nil)
  '(ecb-tree-buffer-style (quote ascii-guides))
  '(ecb-options-version "2.40")
  ;; '(org-agenda-files (quote ("~/.orgmode/index.org")))
)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


; ~~~~~~~~~~~~~~~~~~~~~~~~
; Loads Ruby mode when a .rb file is opened.
;(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
;(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
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
;        (require 'ruby-electric)
;        (ruby-electric-mode t)
        ))


;;~~~~~~~~~~~~~
;;; rhtml mode
(add-to-list 'load-path "~/.emacs.d/elisp/external/rhtml")
(require 'rhtml-mode)

(setq auto-mode-alist  (cons '("\\.erb$" . rhtml-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\.rjs$" . ruby-mode) auto-mode-alist))


;;~~~~~~~~~~~~~
;;; RSpec mode
(add-to-list 'load-path "~/.emacs.d/elisp/external/rspec-mode")
(require 'rspec-mode)

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)


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


;; ~~~~~~~~~~~~~~
;; Org Mode
;; ~~~~~~~~~~~~~~
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done 'time)
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)"  "|" "DONE(d!)" "CANCELED(c@)")))


;;~~~~~~~~~~~~~
;;; Haml mode
(add-to-list 'load-path "~/.emacs.d/elisp/external/haml-mode")
(require 'haml-mode)
(add-hook 'haml-mode-hook
               (lambda ()
                 (setq indent-tabs-mode nil)
                 (define-key haml-mode-map "\C-m" 'newline-and-indent)))


;;~~~~~~~~~~~~~
;;; Sass mode
(add-to-list 'load-path "~/.emacs.d/elisp/external/sass-mode")
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))


;; ~~~~~~~~~~~~~~~~~
;; PHP - HTML - CSS

;; Manuel PHP en français
(setq php-manual-url "http://www.nexen.net/docs/php/annotee/manual.php")

;; Utiliser le html-helper-mode, http://www.gest.unipd.it/~saint/hth.html
(autoload 'php-html-helper-mode "html-helper-mode" "html-helper-mode" t)

;; Ajoute un mode pour éditer du php
;; http://www.ontosys.com/reports/PHP.html
(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php3\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php4\\'" . php-mode))

;; Utiliser le menu expert
(setq html-helper-use-expert-menu t)

;; Auto-indent when pressing <Enter>
(defun my-html-helper-load-hook ()
       (define-key html-mode-map (kbd "RET") 'newline-and-indent))
(add-hook 'html-helper-load-hook 'my-html-helper-load-hook)

;; Use PSGML for SGML, HTML, XML files
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)


;; ~~~~~~~~
;; RVM
(add-to-list 'load-path "~/.emacs.d/elisp/external/rvm.el")
(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session


;; ~~~~~~~~~~~~~~
;; Localization: Use French for dates, dictionnary
;;

;; dictionnaire francais pour la correction orthographique ispell
(setq ispell-dictionary "francais")

;; format jour/mois/an pour le calendrier (M-x calendar)
(setq european-calendar-style t)

;; la semaine commence le lundi
(setq calendar-week-start-day 1)

;; jours et mois en francais dans le calendrier 
(defvar calendar-day-abbrev-array
  ["dim" "lun" "mar" "mer" "jeu" "ven" "sam"])
(defvar calendar-day-name-array
  ["dimanche" "lundi" "mardi" "mercredi" "jeudi" "vendredi" "samedi"])
(defvar calendar-month-abbrev-array
  ["jan" "fév" "mar" "avr" "mai" "jun"
   "jul" "aou" "sep" "oct" "nov" "déc"])
(defvar calendar-month-name-array
  ["janvier" "février" "mars" "avril" "mai" "juin"
   "juillet" "aout" "septembre" "octobre" "novembre" "décembre"])

