;;
;; init.el for shared emacs setup
;;
;; Made by jules baratoux
;; Login   <barato_j@epitech.net>
;;
;; Started on  Wed Jun  6 13:52:50 2012 jules baratoux
;; Last update Tue Jun 11 14:40:49 2013 jules baratoux
;;

;; This file should be loaded by .emacs from shared emacs setup

;; ┌─────────────────────────────────────────────────────────────────────────┐
;; │                              VARIABLES                                  │
;; └─────────────────────────────────────────────────────────────────────────┘

(menu-bar-mode -1)					; Hide menu bar
(highlight-current-line-on t)				; Highligh current line
(show-paren-mode t)					; Highlight parentheses
(column-number-mode 1)					; Show cursor column number in the bottom bar
(setq-default indicate-empty-lines t)			; Show empty lines
(fset 'yes-or-no-p 'y-or-n-p)				; yes → y | no → n
(custom-set-variables '(inhibit-startup-screen t))	; Start in note mode
(put 'downcase-region 'disabled nil)			; Enable downcase-region

;; ┌─────────────────────────────────────────────────────────────────────────┐
;; │                             KEY BINDINGS                                │
;; └─────────────────────────────────────────────────────────────────────────┘

(windmove-default-keybindings 'meta)			; Move between windows	Alt ← ↑ →



(global-set-key "" 'backward-delete-char)
(global-set-key "" 'compile)
;(global-set-key "" 'goto-line)

(global-set-key    "[H"	'beginning-of-line)	; go to	begin		Start
(global-set-key    "[F"	'end-of-line)		; go to end		End

(global-set-key    "\C-x\C-b"	'electric-buffer-list)	; Show buffers		C-x C-b
(global-set-key	   "\C-x\o"	'electric-buffer-list)	;			C-x o
(global-set-key	(kbd "C-x <up>")'electric-buffer-list)	;			C-x ↑

(global-set-key	   "\C-r"	'query-replace)		; Query replace		C-r
(global-set-key    "\C-x\C-r"	'tags-query-replace)	; Tags query replace	C-x C-r		C-x ù
(global-set-key    "\C-x\ù"	'query-replace-regexp)	;

(global-set-key [f2] 'indent-buffer)			; Indent whole buffer
(global-set-key [f3] 'vectra-man-on-word)		; Man over word
(global-set-key [f9] 'compile)				; Compile		F9		C-c C-c
(global-set-key "\C-c\C-c" 'compile)			;

(global-set-key [backtab] 'yas/expand)			; Yas/expand		Shift-tab


;; ┌─────────────────────────────────────────────────────────────────────────┐
;; │                                COLORS                                   │
;; └─────────────────────────────────────────────────────────────────────────┘

;; (custom-set-faces
;;  '(flymake-errline ((((class color))(:foreground "red"))))
;;  '(flymake-warnline ((((class color)) (:underline "yellow")))))
