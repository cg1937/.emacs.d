;; customize configure for eshell
;; ref link: https://caiorss.github.io/Emacs-Elisp-Programming/Eshell.html
(provide 'init-shell)

;; clear shell
(defun eshell/clear ()
  "clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; Colorized prompt
(setq eshell-prompt-function
      (lambda nil
        (concat
         (propertize (eshell/pwd) 'face '(:foreground "#8787af"))
         (propertize "❯" 'face '(:foreground "#f75f5f"))
         (propertize "❯" 'face '(:foreground "#ffaf5f"))
         (propertize "❯" 'face '(:foreground "#87af5f"))
         (propertize " " 'face nil))))

;; Change Eshell current directory
(defun eshell-chdir (path)  
  (with-current-buffer "*eshell*"
    (cd path)
    (eshell-emit-prompt)))

(eshell-chdir "~/Downloads")

;; Change Eshell current directory to current buffer
(defun eshell-cwd ()
  "
  Sets the eshell directory to the current buffer

  Usage: M-x eshell-cwd 
  "
  (interactive)

  (let (
        (path (file-name-directory (or  (buffer-file-name) default-directory)))
       )

    (with-current-buffer "*eshell*"
      (cd path)
      (eshell-emit-prompt))))

;; Open eshell in another window
;; open up a mini-eshell
(defun quarter-window-vertically ()
  "create a new window a quarter size of the current window"
  (split-window-vertically)
  (other-window 1)
  (split-window-vertically)
  (other-window -1)
  (delete-window)
)

(defun open-mini-eshell ()
  "open a mini-eshell in a small window at the bottom of the current window"
  (interactive)
  (quarter-window-vertically)
  (other-window 1)
  (eshell)
)

;; Open eshell in another frame
(defun eshell-other-frame ()
  "
  Open eshell in another frame.

  Usage: M-x eshell-other-frame 
  "
  (interactive)
  (with-selected-frame (make-frame)
    (eshell)))

;; Open eshell file names from ls output with Return key
;; This code allows to open files from $ ls command output by selecting the file ;; ;; name and hitting return or by clicking with the middle mouse button.
(eval-after-load "em-ls"
    '(progn
       (defun ted-eshell-ls-find-file-at-point (point)
         "RET on Eshell's `ls' output to open files."
         (interactive "d")
         (find-file (buffer-substring-no-properties
                     (previous-single-property-change point 'help-echo)
                     (next-single-property-change point 'help-echo))))

       (defun pat-eshell-ls-find-file-at-mouse-click (event)
         "Middle click on Eshell's `ls' output to open files.
 From Patrick Anderson via the wiki."
         (interactive "e")
         (ted-eshell-ls-find-file-at-point (posn-point (event-end event))))

       (let ((map (make-sparse-keymap)))
         (define-key map (kbd "RET")      'ted-eshell-ls-find-file-at-point)
         (define-key map (kbd "<return>") 'ted-eshell-ls-find-file-at-point)
         (define-key map (kbd "<mouse-2>") 'pat-eshell-ls-find-file-at-mouse-click)
         (defvar ted-eshell-ls-keymap map))

       (defadvice eshell-ls-decorated-name (after ted-electrify-ls activate)
         "Eshell's `ls' now lets you click or RET on file names to open them."
         (add-text-properties 0 (length ad-return-value)
                              (list 'help-echo "RET, mouse-2: visit this file"
                                    'mouse-face 'highlight
                                    'keymap ted-eshell-ls-keymap)
                              ad-return-value)
         ad-return-value)))

;; Functions to copy eshell data to clipboard
;; Copy current directory
(defun clipboard/set (astring)
  "Copy a string to clipboard"

   (with-temp-buffer
    (insert astring)
    (clipboard-kill-region (point-min) (point-max))))

;; Copy current directory to clipboard 
;;
;; Usage:  Enter $ copy-pwd in eshell 
;;
(defun eshell/copy-pwd ()
 (clipboard/set (eshell/pwd)))

;; Copy file name with full path to clipboard 
;;
;; Usage: Enter $ copy-fpath <filename> in eshell. 
;; 
(defun eshell/copy-fpath (fname)

  (let ((fpath (concat (eshell/pwd) "/" fname)))

       (clipboard/set fpath)
       (concat "Copied path: " fpath)))

;; Creating Eshell aliases programatically
(eshell/alias "ff" "find-file $1")
(eshell/alias "fw" "find-file-other-window $1")
(eshell/alias "fr" "find-file-other-frame $1")
