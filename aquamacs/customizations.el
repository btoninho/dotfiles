(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-complete-expert-commands t)
 '(TeX-view-program-selection
   (quote
    ((output-dvi "Skim")
     (output-pdf-skim-running "Skim")
     (output-pdf "Skim")
     (output-html "open"))))
 '(agda2-highlight-face-groups nil)
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 310 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(custom-enabled-themes (quote (wombat)))
 '(debug-on-error t)
 '(elpy-rpc-python-command "python3")
 '(fringe-mode 0 nil (fringe))
 '(global-linum-mode t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(package-archives
   (quote
    (("melpa-stable" . "http://stable.melpa.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (evil powerline boogie-friends paredit exec-path-from-shell ocp-indent merlin utop tuareg elpy lsp-rust company-box flycheck-rust flycheck racer cargo proof-general company-coq use-package)))
 '(python-shell-completion-native-disabled-interpreters (quote ("pypy" "ipython" "jupyter")))
 '(python-shell-interpreter "jupyter")
 '(python-shell-interpreter-args "console --simple-prompt")
 '(python-shell-prompt-detect-failure-warning nil)
 '(safe-local-variable-values
   (quote
    ((eval progn
	   (let
	       ((spartan-root-directory
		 (when buffer-file-name
		   (locate-dominating-file buffer-file-name ".dir-locals.el")))
		(spartan-project-find-file
		 (and
		  (boundp
		   (quote spartan-project-find-file))
		  spartan-project-find-file)))
	     (when spartan-root-directory
	       (setq tags-file-name
		     (concat spartan-root-directory "TAGS"))
	       (add-to-list
		(quote compilation-search-path)
		spartan-root-directory)
	       (if
		   (not spartan-project-find-file)
		   (setq compile-command
			 (concat "make -C " spartan-root-directory))))
	     (setq spartan-executable
		   (concat spartan-root-directory "spartan.native"))))
     (TeX-master . main))))
 '(tabbar-mode t nil (tabbar))
 '(text-mode-hook (quote (smart-spacing-mode)))
 '(tool-bar-mode nil)
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-catchall-clause-face ((t (:background "white"))))
 '(agda2-highlight-datatype-face ((t (:foreground "light blue"))))
 '(agda2-highlight-function-face ((t (:foreground "light blue"))))
 '(agda2-highlight-module-face ((t (:foreground "light blue"))))
 '(agda2-highlight-postulate-face ((t (:foreground "light blue"))))
 '(agda2-highlight-primitive-face ((t (:foreground "light blue"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "light blue"))))
 '(agda2-highlight-record-face ((t (:foreground "light blue"))))
 '(agda2-highlight-symbol-face ((t (:foreground "white")))))
