(ensure-package-installed
 ;; Javascript
 'js2-mode
 'js2-refactor
 'json-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq-default
 js-indent-level 2
 js2-basic-offset 2)

(eval-after-load
    'js2-mode
  (lambda ()
    '(define-key js2-mode-map (kbd "{") 'paredit-open-curly)
    '(define-key js2-mode-map (kbd "}") 'paredit-close-curly-and-newline)
    (setq-default
     js2-mode-show-parse-errors nil
     js2-mode-show-strict-warnings nil)))

(setq-default
 flycheck-disabled-checkers
 (append flycheck-disabled-checkers
	 '(javascript-jshint)))

(eval-after-load
  'flycheck
  '(flycheck-add-mode 'javascript-eslint 'js2-mode))



(provide 'my-javascript)
