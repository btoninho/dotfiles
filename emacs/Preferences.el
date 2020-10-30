;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messages* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(require 'package)
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
(package-initialize)

(ido-mode 1)
(setq ido-enable-flex-matching t)


(require 'use-package)

(use-package exec-path-from-shell
  :ensure t)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;;(exec-path-from-shell-copy-env "RUST_SRC_PATH")


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t)

(use-package powerline
  :ensure t)
(powerline-default-theme)
(setq powerline-image-apple-rgb t)
;; (set-face-attribute 'mode-line nil
;;                     :foreground "Black"
;;                     :background "DarkOrange"
;;                     :box nil)

;;(use-package evil
;;  :ensure t)
;;(evil-mode 1)


;;(use-package proof-general
;;  :ensure t)
;; Open .v files with Proof General's Coq mode
(load "~/.emacs.d/lisp/PG/generic/proof-site")

(use-package company-coq
  :ensure t)

(add-hook 'coq-mode-hook #'company-coq-mode)

;; No fugly toolbar
(tool-bar-mode -1)

(use-package cargo
  :ensure t)


(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t))

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(add-hook 'rust-mode-hook 'cargo-minor-mode)

(use-package racer
  :ensure t
  :init
  (setq racer-cmd "~/.cargo/bin/racer"))



(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(use-package flycheck
  :ensure t)

(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)

(add-hook 'text-mode-hook #'turn-on-flyspell)



(add-hook 'LaTeX-mode-hook
      (lambda()
        (local-set-key [C-tab] 'TeX-complete-symbol)))
(setq TeX-parse-self t)
(setq TeX-auto-parse-length 999999)


;;(use-package lsp-mode
;;  :ensure t)

;;(with-eval-after-load 'lsp-mode
;;  (require 'lsp-rust)
;;  (add-hook 'rust-mode-hook #'lsp-rust-enable))





(use-package elpy
  :ensure t)

(elpy-enable)





(setq-default auto-fill-function 'do-auto-fill)



(load-file "/Users/btoninho/.opam/default/share/emacs/site-lisp/ocp-indent.el")
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

; Make company aware of merlin
(with-eval-after-load 'company
 (add-to-list 'company-backends 'merlin-company-backend))
; Enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)
; Or enable it globally:
					; (add-hook 'after-init-hook 'global-company-mode)


;;Agda mode related shenanigans
;;(load-file (let ((coding-system-for-read 'utf-8))
;;                (shell-command-to-string "agda-mode locate")))


(setq flycheck-dafny-executable "/Users/btoninho/dafny/dafny")
(setq flycheck-boogie-executable "/Users/btoninho/dafny/dafny-server")
(setq flycheck-z3-smt2-executable "/Users/btoninho/dafny/z3/bin/z3")
(load-file "/Users/btoninho/.opam/default/share/emacs/site-lisp/ocp-indent.el")

(load-file (let ((coding-system-for-read 'utf-8))
	     (shell-command-to-string "agda-mode locate")))



