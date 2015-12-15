(ensure-package-installed
 'paredit)

(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (paredit-mode 1)))

(provide 'language-lisp)
