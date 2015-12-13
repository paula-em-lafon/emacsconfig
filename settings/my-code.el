(ensure-package-installed
 'exec-path-from-shell
 'flycheck
 'company
 'rainbow-delimiters)

;; global modes
(add-hook 'after-init-hook 'global-company-mode)
(add-hook
 'prog-mode-hook
 (lambda ()
   (rainbow-delimiters-mode)
   (flycheck-mode)))

(setq-default
 company-idle-delay 0.1)

;; I may have some variables set in my shell
(exec-path-from-shell-initialize)

(show-paren-mode 1)

(provide 'my-code)
