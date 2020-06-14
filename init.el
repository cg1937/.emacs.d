(require 'package)
(add-to-list 'package-archives '("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; theme
(load-theme 'leuven t)
;; disable menu bar
(menu-bar-mode -1)
;; disable tool bar
(tool-bar-mode -1)
;; disable scroll bar
(scroll-bar-mode -1)
;; setting the line-number
(global-display-line-numbers-mode 1)
;; close the default welcome interface
(setq inhibit-startup-message t)

;; org-protocol setting, now use for org-roam's graph clickable
(server-start)
(require 'org-protocol)
(require 'org-roam-protocol)

;; load package folder setting
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'customize-init)

;; all-the-icons
(require 'all-the-icons)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-all-windows nil)
 '(avy-background t)
 '(avy-keys
   '(97 115 100 102 103 104 106 107 108 113 119 101 114 117 105 111 112))
 '(avy-timeout-seconds 0.2)
 '(company-clang-executable "/usr/bin/clang++")
 '(custom-safe-themes
   '("7675ffd2f5cb01a7aab53bcdd702fa019b56c764900f2eea0f74ccfc8e854386" "d0fe9efeaf9bbb6f42ce08cd55be3f63d4dfcb87601a55e36c3421f2b5dc70f3" default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(leuven-theme all-the-icons-ivy-rich ivy-rich unicode-fonts telega exwm grip-mode org-preview-html nyan-mode moe-theme powerline-evil powerline yasnippet-snippets yasnippet zones region-occurrences-highlighter multiple-cursors flyspell-correct-avy-menu counsel magit company org-roam posframe all-the-icons pyim cnfonts dracula-theme))
 '(tool-bar-mode nil))

;; setting input method
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'xiaohe-shuangpin)

;; aweshell (replace Eshell) setting
(require 'aweshell)

;; awesome-tab setting
(require 'awesome-tab)
(awesome-tab-mode t)
(setq awesome-tab-label-fixed-length 13)
(setq awesome-tab-height 120)

;; font setting, Sarasa Fonts can auto align, so not need cnfonts package
;;(set-default-font "Sarasa Term SC-11")

;; company-mode setting
(add-hook 'after-init-hook 'global-company-mode)

;; org-roam setting
(use-package org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/InfoSystem/Note/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))

;; magit setting
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; avy setting
(require 'avy)
(setq avy-all-windows nil)
;; use only the selected window
(setq avy-timeout-seconds 0.8)
;; time to wait before switch between avy-goto-char-2 and avy-goto-char.
(setq avy-case-fold-search nil)
;; the searches ignore case. 
(global-set-key (kbd "C-:") 'avy-goto-char)
;; Input one char, jump to it with a tree.
(global-set-key (kbd "C-;") 'avy-goto-char-2)
;; Input two consecutive chars, jump to the first one with a tree.
(global-set-key (kbd "M-g f") 'avy-goto-line)
;; Input zero chars, jump to a line start with a tree
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
;; Input one char at word start, jump to a word start with a tree.
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
;; (global-set-key (kbd "M-g e") 'avy-goto-word-0)

;; ivy setting
(require 'ivy-avy)
;; fix can't load ivy-avy function
(use-package ivy :ensure
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map
        ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 10)
  ;; does not count candidates
  (setq ivy-count-format "%d/%d ")
  ;; no regexp by default
  (setq ivy-fixed-height-minibuffer t))
  ;; fixed height

;; all-icons-ivy-rich
(all-the-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)
  ;; The icon size
(setq all-the-icons-ivy-rich-icon-size 1.0)
  ;; Definitions for ivy-rich transformers.
  ;; See `ivy-rich-display-transformers-list' for details."
all-the-icons-ivy-rich-display-transformers-list

;; multiple-cursors setting
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Sarasa Term SC" :foundry "????" :slant normal :weight normal :height 120 :width normal)))))

;; yasnippet setting
(require 'yasnippet)
(yas-global-mode 1)

;; rainbow identfiers settings
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)
