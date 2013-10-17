;;
;; fix_bug.el for fixbug in /home/duplomt/.emacs.d
;; 
;; Made by Thomas Duplomb
;; Login   <duplomt@epitech.net>
;; 
;; Started on  Sun Jun 19 06:11:36 2011 Thomas Duplomb
;; Last update Sun Jun 19 06:11:38 2011 Thomas Duplomb
;;

;; Fix the xterm issue when shift-up is pressed

(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))
