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
(require 'language-c)

(ensure-package-installed
 'whole-line-or-region
 'which-key
 'company
 'better-defaults
 'exec-path-from-shell
 'base16-theme
 'web-mode
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

(defun my-turn-modes (param &rest modes)
  ;;; Applies the parameter to the specified modes
  (mapcar '(lambda (mode)
             (funcall mode param)) modes))

;; Enable global-modes
(my-turn-modes 1
 'global-auto-revert-mode
 'global-company-mode
 'global-hl-line-mode
 'which-key-mode
 'whole-line-or-region-mode
 'golden-ratio-mode)

(add-hook
 'company-mode-hook
 '(lambda ()
   ;; Slightly better autocomplete on tab
   (define-key company-active-map [tab] 'company-complete-common-or-cycle)
   (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)))
(setq-default
 company-idle-delay 0.1
 company-minimum-prefix-length 1)

;; Transparent emacs yay!
(set-frame-parameter (selected-frame) 'alpha '(98))

;; Turn off GUI bloat
(my-turn-modes 0
 'scroll-bar-mode
 'tool-bar-mode
 'menu-bar-mode)

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
                    :family "Hack"
                    :height '145)

;;; Apply web mode for html
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq-default
 web-mode-markup-indent-offset 2)

;;; Compile buffer colorization fix
(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

;; Load theme
(load-theme
 'base16-monokai-dark t)

(provide 'init)
;;; init.el ends here
