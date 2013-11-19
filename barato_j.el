;;
;; .emacs for shared emacs setup
;;
;; Made by jules baratoux
;; Login   <barato_j@epitech.net>
;;
;; Started on  Wed Jun  6 13:27:55 2012 jules baratoux
;; Last update Mon Nov 11 12:24:22 2013 jules baratoux
;;

;; ┌─────────────────────────────────────────────────────────────────────────┐
;; │                         DO NOT MODIFY THIS PART                         │
;; └─────────────────────────────────────────────────────────────────────────┘
;; Here are shared settings and libaries loading

(load-file "~/.emacs.d/lib.el")		; Loading library
(load-file "~/.emacs.d/shared.el")	; Loading shared settings


;; ┌─────────────────────────────────────────────────────────────────────────┐
;; │                            PERSONNAL SETTINGS                           │
;; └─────────────────────────────────────────────────────────────────────────┘
;; Here are your personal settings. Those overwrites the shared ones


;; Overwrite on selection
(delete-selection-mode t)

;; Auto reload buffers
(global-auto-revert-mode t)		; Can cause erratic data writing.

;; Disable line numbers
(global-linum-mode 0)

;; Syntax coloring
(set-face-foreground	'show-paren-match "cyan")
(make-face-bold		'show-paren-match t)
(set-face-background	'show-paren-match "black")

;; Highlight current line
(set-face-background	'highlight-current-line-face "black")

;;; snippets for c-mode
(yas/define-snippets
 'cc-mode
 '(
   ("int" "${1:int}			$2($3)\n{\n	$0\n	return ${4:0};\n}\n" ".. ..(..) { .. .. }" nil nil nil nil nil)
   ("once" "#pargma once" nil nil nil nil nil)
  )
  ;; Type
  ;; ("int" "int\t${1:Name};" "int (...)" nil nil nil nil nil)
  ;; ("double" "double\t${1:Name};" "double (...)" nil nil nil nil nil)
  '(text-mode)
)

;; Enable php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))


;; (hs-minor-mode nil)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(hs-minor-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(safe-local-variable-values (quote ((eval compilation-shell-minor-mode))))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:foreground "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(linum ((t (:inherit (shadow default) :background "black" :foreground "white")))))

;; INDETATION
(setq c-default-style "linux" c-basic-offset 4) ; style
(c-set-offset 'case-label '+)			; switch case
(c-set-offset 'inline-open '0)			; nested declaration
(c-set-offset 'access-label '0)			; class specifier keyword

(add-hook 'before-save-hook 'delete-trailing-whitespace) ; delete trailing whitespace on save

(require 'cl) ; If you don't have it already

(defun* get-closest-pathname (&optional (file "Makefile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (expand-file-name file
		            (loop
			     for d = default-directory then (expand-file-name ".." d)
			     if (file-exists-p (expand-file-name file d))
			     return d
			     if (equal d root)
			     return nil))))
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

(yas/load-directory "~/.emacs.d/snippets/")


; fix ubuntu
(defadvice terminal-init-xterm (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))

(add-hook 'term-mode-hook 'ansi-color-for-comint-mode-on)