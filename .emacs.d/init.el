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
    (rainbow-delimiters org-journal ## org-gcal org-bullets evil-org yasnippet airline-themes powerline org org-journal-dir))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 122 :width normal))))
 '(cursor ((t (:background "PeachPuff"))))
 '(hl-line ((t (:background "#454545"))))
 '(linum ((t (:inherit (default shadow) :foreground "light gray" :weight bold))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "white"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "goldenrod"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "dodger blue")))))


(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
;;(package-initialize)

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
(put 'narrow-to-region 'disabled nil)
; Save emacs sessions
(desktop-save-mode 1)

;; Configuration of package 'which-key'
(add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)

;; Don't want a toolbar at the top
(tool-bar-mode -1)

;;Coloured parentheses for lisp
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;Highlight the cursor line.
(global-hl-line-mode)
