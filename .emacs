;; Added by Package.el.  Th must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" default)))
 '(global-linum-mode t)
 '(org-agenda-files
   (quote
    ("~/Dropbox/Apps/Emacs/mylife.org" "~/vim.org" "~/emacs.org" "~/bash.org")))
 '(org-log-into-drawer t)
 '(package-selected-packages
   (quote
    (org-journal ## org-gcal org-bullets evil-org yasnippet airline-themes powerline org org-journal-dir))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 122 :width normal))))
 '(linum ((t (:inherit (default shadow) :foreground "light gray" :weight bold)))))


(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'org)
(define-key org-mode-map (kbd "\C-c a") 'org-agenda)
;(define-key org-mode-map (kbd "\C-c\C-j") 'org-journal-new-entry)
;; <S-left> and <S-right> don't work in konsole so using 'Control' rather than 'Shift' modifier key.
(define-key org-mode-map (kbd "<C-left>") 'org-shiftleft)
(define-key org-mode-map (kbd "<C-right>") 'org-shiftright)
(setq org-icalendar-include-todo t)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; Evil configuration
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode t)

(require 'powerline)
(powerline-center-evil-theme)

(require 'airline-themes)
(load-theme 'airline-light)
;; These lines are required for powerline and airline-themes. Glyphs do not display correctly otherwise.
(setq powerline-utf-8-separator-left        #xe0b0
      powerline-utf-8-separator-right       #xe0b2
      airline-utf-glyph-separator-left      #xe0b0
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)

(if (not (display-graphic-p))
  (ignore)
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;(setq org-journal-dir "/usr/local/docs/journal/")
(require 'org-journal)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/Apps/Emacs/tasks.org" "Tasks")
             "* TODO \n  - %?\n  %i\n  %a")
	("c" "Computing Stuff" entry (file+headline "~/Dropbox/Apps/Emacs/computer_stuff.org" "New Captures")
	                  "* TODO \n  - %?\n  %i\n  %a")
	("d" "Desktop Notes" entry (file+headline "~/Dropbox/Apps/Emacs/desktop_notes.org" "New Captures")
	                  "* TODO \n  - %?\n  %i\n  %a")
	("e" "Emacs" entry (file+headline "~/Dropbox/Apps/Emacs/emacs.org" "New Captures")
	                  "* TODO \n  - %?\n  %i\n  %a")
	("g" "GDB" entry (file+headline "~/Dropbox/Apps/Emacs/gdb.org" "New Capture")
	                  "* TODO \n  - %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/Apps/Emacs/journal.org")
	     "* \n  - %?\nEntered on %U\n  %i\n  %a")
	("m" "Mylife" entry (file+headline "~/Dropbox/Apps/Emacs/mylife.org" "New Captures")
	                  "* TODO \n  - %?\n  %i\n  %a")
	("v" "Vim" entry (file+headline "~/Dropbox/Apps/Emacs/vim.org" "New Capture")
	                  "* TODO \n  - %?\n  %i\n  %a")))

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)
