;; setting the default encoding method
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-fontset-font t 'unicode "Symbola" nil 'append)

;; setting the org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; enable auto newline

;; customize keybinding
(global-set-key "\C-x\C-n" 'other-window)

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

;; fira code ligatures setting
(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

(defun preview-org-mode-file-for-html()
  ;; preview .org file use HTML format
  (interactive)
  (org-html-export-as-html)
  (browse-url-of-buffer))
(global-set-key (kbd "<f6>") 'preview-org-mode-file-for-html)

(defun other-window-backward ()
  "Select the previous window."
  (interactive)
  (other-window -1))
(global-set-key "\C-x\C-p" 'other-window-backward)



;; powerline (use moe-theme)
;; customize theme
(require 'powerline)
(powerline-default-theme)

(provide 'customize-init)
