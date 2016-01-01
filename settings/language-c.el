(ensure-package-installed
 'company-c-headers
 'helm-gtags)

(defun my-c-mode ()
  (helm-gtags-mode 1)

  (setq
   company-backends
   '(
     'company-c-headers
     'company-gtags
     )
   )

  ;; (add-to-list 'company-backends 'company-c-headers)
  ;; (add-to-list 'company-backends 'company-gtags)
  )

(add-hook 'c-mode-hook 'my-c-mode)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(provide 'language-c)
;;; language-c.el ends here
