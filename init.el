(add-to-list
 'load-path
 (expand-file-name "settings" user-emacs-directory))

(require 'my-package)
(require 'my-navigation)
(require 'my-code)
(require 'my-projects)
(require 'language-javascript)
(require 'language-lisp)

(ensure-package-installed
 'whole-line-or-region
 'which-key
 'company
 'tronesque-theme)

;; Set terminal environment variable to dumb
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setenv "TERM" "dumb")))

;; Enable which-key mode globally
(add-hook
 'after-init-hook
 (lambda ()
   (which-key-mode 1)
   (global-company-mode 1)
   (global-linum-mode 1)))

(eval-after-load
    'company-mode
  (lambda ()
    ;; Slightly better autocomplete on tab
    (define-key company-active-map [tab] 'company-complete-common-or-cycle)
    (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)))

(setq-default
 company-idle-delay 0.1)

;; Transparent emacs yay!
(set-frame-parameter (selected-frame) 'alpha '(98 95))

;; (load-theme 'tronesque)
;; (tronesque-mode-line)

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(whole-line-or-region-mode)

;; Disable backup and autosave files
(setq-default
 indent-tabs-mode nil
 auto-save-default nil
 make-backup-files nil)

;; Disable annoying messages in ERC
(setq-default
 erc-lurker-hide-list '("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE")
 erc-lurker-threshold-time 14400)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height '150
                    :weight 'normal)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
