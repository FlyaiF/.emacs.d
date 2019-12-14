;; store the key that change default config

;; close the auto backup
(setq make-backup-files nil)

;; disable the file backup
(setq make-backup-files nil)
(setq auto-save-default nil)

(abbrev-mode t)

(define-abbrev-table 'global-abbrev-table '(
					    ;; sigature
					    ("sfl" "flyaif")
					    ))
;; select and input will replace selected
(delete-selection-mode 1)

;; enable the open file history
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; highlit matching parenthesis
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlit enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; close the alter voice
(setq ring-bell-function 'ignore)

;; 显示行号
(global-linum-mode 1)

(global-auto-revert-mode t)

;; 更改显示字体大小 14pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 140)

;; custom function
;; ident current buffer 
(defun flyaif/indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

;; if any region is selected, indent the region otherwise indent the buffer
(defun flyaif/indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region"))
      (progn
	(flyaif/indent-buffer)
	(message "Indent buffer.")))))

;; recompile my config files in ~/.emacs.d/lisp
(defun flyaif/byte-recompile-config()
  (interactive)
  (byte-recompile-directory "~/.emacs.d/lisp/" 0))


;; enhance hippie complete
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol
					 try-complete-lisp-symbol-partially))

;; use y/s instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; dired mode config
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired-x)
(setq dired-dwim-target t)

(provide 'init-better-defaults)
