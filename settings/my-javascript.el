(ensure-package-installed
 'js2-mode
 'js2-refactor
 'smartparens
 'json-mode)

(add-to-list
 'auto-mode-alist
 '("\\.js\\'" . js2-mode))

(setq-default
 js-indent-level 2
 js2-basic-offset 2)

(setq-default
 ;; Supress js2 mode errors
 js2-mode-show-parse-errors nil
 js2-mode-show-strict-warnings)

(eval-after-load
    'flycheck
  (lambda ()
    (flycheck-add-mode 'javascript-eslint 'js2-mode)
    ;; Disable jshint
    (setq-default
     flycheck-disabled-checkers
     (append flycheck-disabled-checkers
	     '(javascript-jshint)))))
(add-hook
 'prog-mode-hook
 (lambda ()
   (turn-on-smartparens-mode)))

(provide 'my-javascript)
