(ensure-package-installed
 'exec-path-from-shell
 'flycheck
 'diff-hl
 'rainbow-delimiters)

(add-hook
 'prog-mode-hook
 (lambda ()
   (rainbow-delimiters-mode 1)
   (flycheck-mode 1)
   (diff-hl-mode 1)
   ))

;; I may have some variables set in my shell
(exec-path-from-shell-initialize)

(show-paren-mode 1)

(provide 'my-code)
