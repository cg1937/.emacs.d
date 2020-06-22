(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;; load package folder setting
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;elegance theme setting
(require 'elegance)
;; customize configure setting
(require 'sanity)

(load-theme 'leuven t)

;; org-protocol setting, now use for org-roam's graph clickable
(server-start)
(require 'org-protocol)
(require 'org-roam-protocol)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-all-windows nil)
 '(avy-background t)
 '(avy-keys
   (quote
    (97 115 100 102 103 104 106 107 108 113 119 101 114 117 105 111 112)))
 '(avy-timeout-seconds 0.2)
 '(company-clang-executable "/usr/bin/clang++")
 '(custom-safe-themes
   (quote
    ("7675ffd2f5cb01a7aab53bcdd702fa019b56c764900f2eea0f74ccfc8e854386" "d0fe9efeaf9bbb6f42ce08cd55be3f63d4dfcb87601a55e36c3421f2b5dc70f3" default)))
 '(package-selected-packages
   (quote
    (auctex cdlatex ag org-super-agenda org-bullets leuven-theme grip-mode org-preview-html nyan-mode moe-theme powerline yasnippet-snippets yasnippet zones region-occurrences-highlighter multiple-cursors flyspell-correct-avy-menu counsel magit company org-roam posframe all-the-icons pyim dracula-theme))))

;; setting the org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; enable auto newline
;; setting the org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;; setting input method
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'xiaohe-shuangpin)

;; company-mode setting
(add-hook 'after-init-hook 'global-company-mode)

;; org-roam setting
(use-package org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/InfoSystem/Note/")
      (org-roam-graph-viewer "~/Public/basilisk/basilisk")
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

;; multiple-cursors setting
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; yasnippet setting
(require 'yasnippet)
(yas-global-mode 1)

(require 'powerline)
(powerline-vim-theme)
(set-face-attribute 'mode-line nil
                    :background "white"
                    :foreground "black"
                    :distant-foreground "black"
                    )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-table ((t (:family "Sarasa Term SC")))))
