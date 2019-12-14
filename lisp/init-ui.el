;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改光标的样式
(setq-default cursor-type 'bar)

;; default full screen
(setq initial-frame-alist (quote((fullscreen . maximized))))

;; highlight selected line
(global-hl-line-mode 1)

(provide 'init-ui)
