(ensure-package-installed
 'flycheck
 'diff-hl
 'rainbow-delimiters)

(add-hook
 'prog-mode-hook
 'my-code-mode-init)

(defun my-code-mode-init ()
  (my-turn-modes 1
                 'linum-mode
                 'rainbow-delimiters-mode
                 'flycheck-mode
                 'diff-hl-mode
                 'show-paren-mode
                 'electric-indent-mode
                 'electric-pair-mode)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(provide 'my-code)
;;; my-code.el ends here
