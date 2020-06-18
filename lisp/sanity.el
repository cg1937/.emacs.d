;; Some sane defaults
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq gc-cons-threshold (* 100 1024 1024))
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
(setq-default indent-tabs-mode nil)
(setq pop-up-windows nil)
(tool-bar-mode 0)
(menu-bar-mode 0)
(tooltip-mode  0)
(scroll-bar-mode 0)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(save-place-mode 1)

;; customize function
(defun open-my-init-file()
  ;; open init.el  
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f5>") 'open-my-init-file)

(defun load-my-init-file()
  ;; load init.el
  (interactive)
  (load "~/.emacs.d/init.el"))
(global-set-key (kbd "<f7>") 'load-my-init-file)

(defun preview-org-mode-file-for-html()
  ;; preview .org file use HTML format
  (interactive)
  (org-html-export-as-html)
  (browse-url-of-buffer))
(global-set-key (kbd "<f6>") 'preview-org-mode-file-for-html)

(defun custom/kill-this-buffer ()
  ;; kill current buffer
  (interactive) (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'custom/kill-this-buffer)

(provide 'sanity)

