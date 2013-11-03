;;
;; lib.el for shared emacs setup
;;
;; Made by jules baratoux
;; Login   <barato_j@epitech.net>
;;
;; Started on  Wed Jun  6 13:52:50 2012 jules baratoux
;; Last update Sun Nov  3 19:19:08 2013 jules baratoux
;;

;; Should be loaded by .emacs from shared emacs setup

(load "~/.emacs.d/fix_bug.el")
(load "~/.emacs.d/std_comment.el")
;; (load-file "~/.emacs.d/plugins/highlight-current-line.el") ; redundant
(load-file "~/.emacs.d/keywords.el")
(add-to-list 'load-path "~/.emacs.d/plugins/") ; Load all plugins

;; Dictionary
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins//ac-dict")
(ac-config-default)
(setq ac-ignore-case 't)
(require 'yasnippet-bundle)
(require 'highlight-current-line)


;; Delete trailing whitespace
(add-hook 'c++-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook   'c-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)
  (c-set-offset 'case-label +)))
(add-hook 'lisp-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))

;; Call man page over word
(defun vectra-man-on-word ()
  "Call man page over word"
  (interactive)
  (manual-entry (current-word) ))

;; Indent Whole buffer
(defun indent-buffer ()
    (interactive)
    (save-excursion (indent-region (point-min)
   (point-max) nil)))

;; Count lines
(require 'linum+)
(global-linum-mode 1)
(custom-set-faces '(linum ((t (:inherit (shadow default) :background "black" :foreground "white")))))
(setq linum-disabled-modes-list '(eshell-mode wl-summary-mode compilation-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes-list))
    (linum-mode 1)))


;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-hairy t)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Better indent for CSS
(setq cssm-indent-level 2)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-mirror-mode nil)


;; Made by Nicolas Sadirac
(defun do_insert_time ()
  (interactive)
 (insert-string (current-time-string)))
(set-variable 'c-argdecl-indent   0)

(normal-erase-is-backspace-mode 0)