;;
;; .emacs for shared emacs setup
;; 
;; Made by jules baratoux
;; Login   <barato_j@epitech.net>
;; 
;; Started on  Wed Jun  6 13:27:55 2012 jules baratoux
;; Last update Tue Feb  5 21:57:04 2013 decantc
;;

;; ┌─────────────────────────────────────────────────────────────────────────┐
;; │                         DO NOT MODIFY THIS PART                         │
;; └─────────────────────────────────────────────────────────────────────────┘
;; Here are shared settings and liberies loading

(load-file "~/.emacs.d/lib.el")		; Loading library
(load-file "~/.emacs.d/shared.el")	; Loading shared settings



;; ┌─────────────────────────────────────────────────────────────────────────┐
;; │                            PERSONNAL SETTINGS                           │
;; └─────────────────────────────────────────────────────────────────────────┘
;; Here are your personal settings. Those overwrites the shared ones

(load-file "~/.emacs.d/std.el")	; Loading shared settings
(load-file "~/.emacs.d/std_comment_decant_c.el")	; Loading shared settings
(delete-selection-mode t)

;; Auto reload buffers
(global-auto-revert-mode t)             ; Can cause erratic data writing.

;; Syntax coloring
(set-face-foreground	'show-paren-match "cyan")
(make-face-bold		'show-paren-match t)
(set-face-background	'show-paren-match "black")

;; Highlight current line
(set-face-background	'highlight-current-line-face "black")

;; Disable line numbers
;; (global-linum-mode 0)

(setq-default show-trailing-whitespace t)	  ; Show trailing whitespace
(set-face-background 'highlight-current-line-face "black") ; Current line bg
(ido-mode 1)					  ; Use ido to manage buffer
(custom-set-variables
 '(hs-minor-mode t)
 ;; '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(show-paren-mode t))
