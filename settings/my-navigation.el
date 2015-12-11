(ensure-package-installed
 ;; Navigation
 'ace-jump-mode
 'multiple-cursors
 'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(provide 'my-navigation)
