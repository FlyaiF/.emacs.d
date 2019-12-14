;; require common lisp
(require 'cl)


;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))


 ;; Add Packages
(defvar flyaif/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		flucui-themes
		zenburn-theme
		counsel
		swiper
		smartparens
		popwin
		) "Default packages")
 (setq package-selected-packages flyaif/packages)

 (defun flyaif/packages-installed-p ()
     (loop for pkg in flyaif/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (flyaif/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg flyaif/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(require 'hungry-delete)
(global-hungry-delete-mode t)
(require 'smartparens-config)
(smartparens-global-mode t)
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(setq enable-recursive-minibuffers t)

;; enable the company mode
(global-company-mode 1)

;; themes
(add-hook 'after-init-hook (lambda () (load-theme 'zenburn t)))


;; set js2-mode as default js mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; open popwin mode
(require 'popwin)
(popwin-mode t)
(require 'nodejs-repl)
(provide 'init-packages)
