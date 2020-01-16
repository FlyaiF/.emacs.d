;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; enable counsel-git with "C-c p f" which means project file
;; we may define a project as git repository
(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)


;; bind C-M-\\ to format the select region or current buffer
(global-set-key (kbd "C-M-\\") 'flyaif/indent-region-or-buffer)

;; better complate
(global-set-key (kbd "M-/") 'hippie-expand)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "M-s e") 'iedit-mode)

(with-eval-after-load 'dired 
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybinding)
