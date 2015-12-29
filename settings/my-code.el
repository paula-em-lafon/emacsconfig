(ensure-package-installed
 'flycheck
 'diff-hl
 'rainbow-delimiters)

(add-hook
 'prog-mode-hook
 'my-code-mode-init)

(defun my-code-mode-init ()
  (rainbow-delimiters-mode 1)
  (flycheck-mode 1)
  (diff-hl-mode 1)
  (linum-mode 1)
  (show-paren-mode 1)
  (electric-indent-mode 1)
  (electric-pair-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(provide 'my-code)
;;; my-code.el ends here
