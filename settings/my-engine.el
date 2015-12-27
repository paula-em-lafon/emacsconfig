(ensure-package-installed
 'engine-mode)

(require 'engine-mode)
(engine-mode 1)

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s")

(defengine archlinux
  "https://wiki.archlinux.org/index.php?search=%s")

(provide 'my-engine)
;;; my-engine.el ends here
