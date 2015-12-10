(ensure-package-installed
 ;; Navigation
 'multiple-cursors
 'expand-region)


(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

(provide 'my-navigation)
