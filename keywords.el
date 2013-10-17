; ┌───────────────────────────────────────────────────────────────────────────┐
; │				      KEYWORDS				      │
; └───────────────────────────────────────────────────────────────────────────┘
; Made by Jules Baratoux

(font-lock-add-keywords (and 'c-mode 'c++-mode)
  '(("foreach " . font-lock-keyword-face)
    ("note" . font-lock-keyword-face)
    ("UNUSED" . font-lock-keyword-face)	  ("unused" . font-lock-keyword-face)
    ("NORETURN" . font-lock-keyword-face) ("noreturn" . font-lock-keyword-face)
    ("ALIAS" . font-lock-keyword-face)	  ("alias" . font-lock-keyword-face)
    ))