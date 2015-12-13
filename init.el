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
(tool-bar-mode 0)
(menu-bar-mode 0)

(whole-line-or-region-mode)

;; Disable backup and autosave files
(setq-default
 indent-tabs-mode nil
 auto-save-default nil
 make-backup-files nil)

(setq-default
 erc-lurker-hide-list '("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE")
 erc-lurker-threshold-time 14400)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height '150
                    :weight 'normal)
