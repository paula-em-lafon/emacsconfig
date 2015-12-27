(add-to-list
 'load-path
 (expand-file-name "settings" user-emacs-directory))

(require 'my-package)
(require 'my-navigation)
(require 'my-code)
(require 'my-engine)
(require 'my-projects)
(require 'my-directory)
(require 'language-javascript)
(require 'language-lisp)

(ensure-package-installed
 'whole-line-or-region
 'which-key
 'company
 'better-defaults
 'ido-vertical-mode
 'exec-path-from-shell
 'base16-theme
 'golden-ratio
 'restclient)

;; I may have some variables set in my shell
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-envs '("THEME" "BACKGROUND"))

;; Set terminal environment variable to dumb
(add-hook
 'eshell-mode-hook
 '(setenv "TERM" "dumb"))

;; Save when focus is lost
(defun my-save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook
 'focus-out-hook
 'my-save-all)

;; Enable global-modes
(which-key-mode 1)
(global-company-mode 1)
(global-hl-line-mode 1)
(ido-vertical-mode 1)
(whole-line-or-region-mode 1)
(golden-ratio-mode 1)

(add-hook
 'company-mode-hook
 '(lambda ()
   ;; Slightly better autocomplete on tab
   (define-key company-active-map [tab] 'company-complete-common-or-cycle)
   (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)))
(setq-default
 company-idle-delay 0.1)

;; Transparent emacs yay!
(set-frame-parameter (selected-frame) 'alpha '(98))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq-default
 inhibit-startup-screen t
 indent-tabs-mode nil
 auto-save-default nil
 make-backup-files nil)

;; Disable annoying messages in ERC
(setq-default
 erc-lurker-hide-list '("JOIN" "KICK" "NICK" "PART" "QUIT" "MODE")
 erc-lurker-threshold-time 14400)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height '130
                    :weight 'normal)

;; Load theme based on terminal theme
(load-theme
 (intern
  (concat
   (getenv "THEME")
   "-"
   (getenv "BACKGROUND"))) t)

(provide 'init)
;;; init.el ends here
