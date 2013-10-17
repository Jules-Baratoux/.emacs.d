;;
;; .emacs for shared emacs setup
;;
;; Made by jules baratoux
;; Login   <barato_j@epitech.net>
;;
;; Started on  Wed Jun  6 13:27:55 2012 jules baratoux
;; Last update Sun Sep 15 11:44:52 2013 jules baratoux
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

(set-face-background 'highlight-current-line-face "black") ; Current line bg
(ido-mode 1)					  ; Use ido to manage buffer

;; (setq-default show-trailing-whitespace t)		 ; Show trailing whitespace
;; (add-hook 'before-save-hook 'delete-trailing-whitespace) ; Delete trailing whitespace upon save

(defadvice terminal-init-xterm (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))

(load-theme 'wombat)			; theme

;; Enable php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))


;; Overwrite on selection
(delete-selection-mode t)

;; by JULES from Piscine parsing
(global-linum-mode 0)
(require 'cl) ; If you don't have it already
(require 'compile)
(add-hook 'c-mode-hook (lambda () (set (make-local-variable 'compile-command) (format "cd `dirname %s` && make" (get-closest-pathname)))))

(add-hook 'c-mode-hook '(lambda ()
			    (local-unset-key "\C-c\C-c")
			    (global-set-key "\C-c\C-c" 'compile)))
(add-hook 'c++-mode-hook '(lambda ()
			    (local-unset-key "\C-c\C-c")
			    (global-set-key "\C-c\C-c" 'compile)))
(add-hook 'python-mode-hook '(lambda ()
			    (local-unset-key "\C-c\C-c")
			    (global-set-key "\C-c\C-c" 'python-check)))