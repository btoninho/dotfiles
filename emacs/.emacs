;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


(tool-bar-mode 0)
(ido-mode 1)
(setq ido-enable-flex-matching t)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


(require 'rx)
;;; python company
(eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda))
(add-hook 'python-mode-hook 'anaconda-mode)
;;(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;;; Install fsharp-mode
(unless (package-installed-p 'fsharp-mode)
  (package-install 'fsharp-mode))

(require 'fsharp-mode)


(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

;;(load "/Users/btoninho/Documents/tuareg-master/tuareg-site-file")

;;(setq load-path (cons "~/org-8.2.10/lisp" load-path))
;;(setq load-path (cons "~/org-8.2.10/contrib/lisp" load-path))

;; The following lines are always needed.  Choose your own keys.
;;      (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
;;      (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;;      (global-set-key "\C-cl" 'org-store-link)
;;      (global-set-key "\C-ca" 'org-agenda)
;;      (global-set-key "\C-cb" 'org-iswitchb)

(load "~/.emacs.d/lisp/PG/generic/proof-site")
(add-hook 'coq-mode-hook #'company-coq-mode)

(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)
(add-hook 'text-mode-hook #'turn-on-flyspell)

(add-to-list 'load-path "/Users/btoninho/.opam/default/share/emacs/site-lisp")
(require 'ocp-indent)



(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
      (when (and opam-share (file-directory-p opam-share))
       ;; Register Merlin
       (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
       (autoload 'merlin-mode "merlin" nil t nil)
       ;; Automatically start it in OCaml buffers
       (add-hook 'tuareg-mode-hook 'merlin-mode t)
       (add-hook 'caml-mode-hook 'merlin-mode t)
       ;; Use opam switch to lookup ocamlmerlin binary
       (setq merlin-command 'opam)))
(custom-set-variables
;; '(coq-prog-args '("-R" "/Users/btoninho/Dropbox/coq/cpdt/src/" "Cpdt"))
;; '(coq-prog-args '("-I" "/Users/btoninho/Dropbox/coq/sf/"))
 )




;;(setq flycheck-dafny-executable "/Users/btoninho/dafny/dafny")
;;(setq flycheck-boogie-executable "/Users/btoninho/dafny/dafny-server")
;;(setq flycheck-z3-smt2-executable "/Users/btoninho/dafny/z3/bin/z3")
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line


(setq TeX-parse-self t)
(setq TeX-auto-parse-length 999999)
