;;
;; user.el for shared emacs setup
;; 
;; Made by jules baratoux
;; Login   <barato_j@epitech.net>
;; 
;; Started on  Wed Jun  6 13:52:50 2012 jules baratoux
;; Last update Mon Mar  4 13:21:46 2013 Ouroboros
;;


;; ┌─────────────────────────────────────────────────────────────────────────┐
;; │                  HERE ARE YOUR PERSONNAL SETTINGS                       │
;; └─────────────────────────────────────────────────────────────────────────┘
;; Should be loaded by .emacs from shared emacs setup
;; Those settings overwrites the shared ones


;; Auto reload buffers
(global-auto-revert-mode t)		; Can cause erratic data writing.

;; Disable line numbers
(global-linum-mode 0)

;; Syntax coloring
(set-face-foreground	'show-paren-match "cyan")
(make-face-bold		'show-paren-match t)
(set-face-background	'show-paren-match "black")
;; (set-face-underline-p  'font-lock-type-face t)
;; (set-face-background   'show-paren-match "magenta")
;; (set-face-foreground   'font-lock-function-name-face "blue")
;; (make-face-unbold      'font-lock-function-name-face t)
;; (set-face-foreground   'font-lock-keyword-face "red")

;; Highlight current line
(set-face-background	'highlight-current-line-face "black")


;;; snippets for cc-mode
(yas/define-snippets 'cc-mode
		     '(;("do" "do\n{\n    $0\n} while (${1:condition});" "do { ... } while (...)" nil nil nil nil nil)
		       ;("for" "for (${1:int i = 0}; ${2:i < N}; ${3:++i})\n{\n    $0\n}" "for (...; ...; ...) { ... }" nil nil nil nil nil)
		       ("if" "if (${1:condition})\n{\n    $0\n}" "if (...) { ... }" nil nil nil nil nil)
		       ("else if" "else if (${1:condition})\n{\n    $0\n}" "else if (...) { ... }" nil nil nil nil nil)
		       ("return" "return (${1:Value});" "return (...)" nil nil nil nil nil)
		       ("free" "free(${1:Va});" "free (...)" nil nil nil nil nil)
		       ("def" "# define		${1:MACRO}		${2:value}" "define ...	..." nil nil nil nil nil)
		       ("inc" "#include		<${1:stdio.h}>\n" "#include <...>" nil nil nil nil nil)
		       ;; ("int" "${1:int}		${2:main}(${3:int argc, const char *argv[]})\n{\n	$0\n	return (EXIT_SUCCESS);\n}\n" "func ...	...(...) { ... }" nil nil nil nil nil)
		       ;("xmalloc" "xmalloc(sizeof(${1:Type}));" "xmalloc (...)" nil nil nil nil nil)
		       ;("xread" "xread(${1:Fd}, \"${2:buf}\", ${3:Size_buf});" "xread (..., ..., ...) { ... }" nil nil nil nil nil)
		       ;("xwrite" "xwrite(${1:Out}, \"${2:Text}\", ${3:Size});" "xwrite (..., ..., ...) { ... }" nil nil nil nil nil)
		       ("printf" "printf(\"${1:%s}\\n\", ${2:Var);" "printf (..., ...)" nil nil nil nil nil)
		       ("while" "while (${1:condition})\n{\n    $0\n}" "while (...) { ... }" nil nil nil nil nil)
		       ("myh" "#include	\"my.h\"" "#include" nil nil nil nil nil)
		       ("main" "int		main(int ac, char **av)\n{\n    $0\n    return (0);\n}\n" "int main(ac, av) { ... }" nil nil nil nil nil)
		       ("func" "${1:Type}	${2:Name}(${3:Arguments})\n{\n	$0\n}\n" "func ...	...(...) { ... }" nil nil nil nil nil)
		       ("once" "#ifndef			${1:`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_H_}\n# define		$1\n\n$0\n\n#endif			/* $1 */" "#ifndef XXX; #define XXX; #endif" nil nil nil nil nil)
		       ("struct" "struct	s_${1:name}\n{\n    $0\n};" "struct s_... { ... }" nil nil nil nil nil)
		       ("struct" "typedef struct	 s_${1:name}\n{\n    $0\n} t_$1;" "typedef struct s_... { ... }" nil nil nil nil nil)
		     ("com" "/* <--| ${1:Com} |--> */" "..." nil nil nil nil nil))
		     ;; Type
		     ;; ("int" "int\t${1:Name};" "int (...)" nil nil nil nil nil)
		     ;; ("char" "char\t${1:Name};" "char (...)" nil nil nil nil nil)
		     ;; ("float" "float\t${1:Name};" "float (...)" nil nil nil nil nil)
		     ;; ("double" "double\t${1:Name};" "double (...)" nil nil nil nil nil)
		     '(text-mode))
