(ensure-package-installed
 'flycheck
 'exec-path-from-shell
 'paredit
 'rainbow-delimiters)

(add-hook 'after-init-hook #'global-flycheck-mode)

;;;; rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; on OS-X call exec path from shell
(exec-path-from-shell-initialize)

(show-paren-mode 1)

(provide 'my-code)
