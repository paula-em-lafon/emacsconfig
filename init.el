(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Packages installed
(ensure-package-installed
 'helm
 'helm-ag
 'projectile
 'helm-projectile
 'flycheck
 'exec-path-from-shell
 ;; Javascript
 'js2-mode
 'js2-refactor
 ;; Navigation
 'multiple-cursors
 'expand-region
 'magit)

;; Set helm as default M-x provider
(helm-mode 1)
(setq-default
 helm-recentf-fuzzy-match 't
 helm-buffers-fuzzy-match 't
 helm-locate-fuzzy-match 't
 helm-M-x-fuzzy-match 't
 helm-imenu-fuzzy-match 't
 helm-apropos-fuzzy-match 't
 helm-lisp-completion-at-point 't)

(projectile-global-mode)
(helm-projectile-on)
(setq
 projectile-completion-system 'helm)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; Javascript configuration
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Flycheck
(setq-default
 flycheck-checkers '(javascript-eslint))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; JS2 mode
(setq-default
 js2-strict-missing-semi-warning nil
 js2-missing-semi-one-line-override nil
 js2-basic-offset 2)

(setq-default
 vc-follow-symlinks 't)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Disable backup and autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" default)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :width normal :family "Courier Prime Code")))))
