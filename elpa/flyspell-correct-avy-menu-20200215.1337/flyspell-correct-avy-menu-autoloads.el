;;; flyspell-correct-avy-menu-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "flyspell-correct-avy-menu" "flyspell-correct-avy-menu.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flyspell-correct-avy-menu.el

(autoload 'flyspell-correct-avy-menu "flyspell-correct-avy-menu" "\
Run `avy-menu' for the given CANDIDATES.

List of CANDIDATES is given by flyspell for the WORD.

Return a selected word to use as a replacement or a tuple
of (command, word) to be used by `flyspell-do-correct'.

\(fn CANDIDATES WORD)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flyspell-correct-avy-menu-autoloads.el ends here
