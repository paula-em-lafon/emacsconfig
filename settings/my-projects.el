(ensure-package-installed
 'helm
 'helm-ag
 'projectile
 'helm-projectile
 'github-browse-file
 'magit)

;; Helmify everything
(helm-mode 1)
(setq-default
 helm-recentf-fuzzy-match 't
 helm-buffers-fuzzy-match 't
 helm-locate-fuzzy-match 't
 helm-M-x-fuzzy-match 't
 helm-imenu-fuzzy-match 't
 helm-apropos-fuzzy-match 't
 helm-lisp-completion-at-point 't)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x g") 'magit-status)

;;; Enable projectile in all buffers
(add-hook 'after-init-hook 'projectile-global-mode)

(helm-projectile-on)

(setq-default
 projectile-completion-system 'helm
 vc-follow-symlinks 't)

(eval-after-load
 'helm
 '(helm-autoresize-mode 1))

(provide 'my-projects)
