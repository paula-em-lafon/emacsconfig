(add-to-list
 'load-path
 (expand-file-name "settings" user-emacs-directory))

(require 'my-package)
(require 'my-navigation)

(require 'my-code)
(require 'my-projects)
(require 'my-javascript)

(ensure-package-installed
 'whole-line-or-region
 'tronesque-theme)

(add-hook
 'eshell-mode-hook
 (lambda ()
   (setenv "TERM" "dumb") ; enable colors
  ))

(load-theme 'tronesque)
(tronesque-mode-line)
 
(scroll-bar-mode 0)

(whole-line-or-region-mode)

;; Disable backup and autosave files
(setq-default
 indent-tabs-mode nil
 auto-save-default nil
 make-backup-files nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" default)))
 '(erc-lurker-hide-list (quote ("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE")))
 '(erc-lurker-threshold-time 14400))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 150 :family "Courier Prime Code")))))
