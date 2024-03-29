; melpa rackages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "org-protocol-capture-html")

; mac osx start up
(require 'cl) 

; visual line mode
(add-hook 'text-mode-hook 'visual-line-mode)

; pandoc location
(add-to-list 'exec-path "/usr/local/bin")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin/pandoc"))

; server start
(server-start)

; hide start up screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
; hide toolbar
;(tool-bar-mode -1)
; hide scrollbar
(scroll-bar-mode -1)

; mac swap ctrl and cmd
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'super)

; backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

; change prompt from yes or no, to y or n
(fset 'yes-or-no-p 'y-or-n-p)

; case insensitive search
(setq read-file-name-completion-ignore-case t)
(setq pcomplete-ignore-case t)
; place headers on the left
(setq markdown-asymmetric-header t)

; markdown preview using pandoc
(setq markdown-command "/usr/local/bin/pandoc -f markdown -t html -s -S --mathjax --highlight-style=pygments")

; gfm mode
(setq auto-mode-alist (cons '("\\.mdt$" . gfm-mode) auto-mode-alist))
; fix tab in evil for org mode
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

; org mode
(require 'org)
(require 'org-protocol)
(require 'org-capture)
(require 'org-protocol-capture-html)
(setq org-agenda-files '("~/org/"))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

; org-capture
(global-set-key "\C-cc" 'org-capture)

;(defadvice org-capture
;    (after make-full-window-frame activate)
;  "Advise capture to be the only window when used as a popup"
;  (if (equal "emacs-capture" (frame-parameter nil 'name))
;      (delete-other-windows)))
;
;(defadvice org-capture-finalize
;    (after delete-capture-frame activate)
;  "Advise capture-finalize to close the frame"
;  (if (equal "emacs-capture" (frame-parameter nil 'name))
;      (delete-frame)))

; org capture templates
(setq org-capture-templates
    '(("t" "Todo" entry
      (file+headline "~/org/todo.org" "Tasks")
      (file "~/org/templates/tpl-todo.txt")
      :empty-lines-before 1)
      ("w" "Web site" entry (file+olp "~/org/web.org" "Web")
      (file "~/org/templates/tpl-web.txt")
      :empty-lines-before 1)))

; custom faces
(custom-set-faces)

;; Prepare stuff for org-export-backends
(setq org-export-backends '(org latex icalendar html ascii))

; todo keywords
(setq org-todo-keywords
      '((sequence "TODO(t@/!)" "IN-PROGRESS(p/!)" "WAITING(w@/!)" " | " "DONE(d@)")))
(setq org-log-done t)

; org todo logbook
(setq org-log-into-drawer t)

; powerline-evil
(require 'powerline)
(powerline-default-theme)
(display-time-mode t)

; magit 
(global-set-key (kbd "C-x g") 'magit-status)

