(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))
(setq doom-theme 'doom-palenight)
(load-theme 'doom-palenight t)

(setq inhibit-startup-screen t)
(scroll-bar-mode -1)

(unless (package-installed-p 'vterm)
  (package-install 'vterm))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f74e8d46790f3e07fbb4a2c5dafe2ade0d8f5abc9c203cd1c29c7d5110a85230" default))
 '(package-selected-packages
   '(treemacs all-the-icons-dired all-the-icons zop-to-char zenburn-theme yasnippet yaml-mode which-key web-mode vterm volatile-highlights vertico use-package undo-tree tree-sitter-langs super-save smartrep smartparens slime rust-mode ron-mode restclient rainbow-mode rainbow-delimiters racket-mode projectile pdf-view-restore orderless operate-on-number nlinum move-text magit lsp-ui json-mode js2-mode imenu-anywhere hl-todo haskell-mode guru-mode git-timemachine git-modes gist geiser flycheck-rust expand-region exec-path-from-shell erlang elisp-slime-nav editorconfig easy-kill doom-themes doom-modeline discover-my-major diminish diff-hl crux consult cider cargo browse-kill-ring auto-package-update anzu alchemist ag ace-window)))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Make frame transparency overridable
(defvar efs/frame-transparency '(90 . 90))

;; Set frame transparency
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 110)
(defvar efs/default-variable-font-size 110)

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(set-face-attribute 'default nil :font "Fira Code Retina" :height efs/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height efs/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-variable-font-size :weight 'regular)

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(display-time)

(set-fringe-mode 10)
(set-face-attribute 'fringe nil :background nil)

(unless (package-installed-p 'doom-modeline)
 (package-install 'doom-modeline))
(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-height 25)

(unless (package-installed-p 'auto-package-update)
  (package-install 'auto-package-update))
(setq auto-package-update-interval 7)
(setq auto-package-update-prompt-before-update t)
(setq auto-package-update-hide-results t)
(auto-package-update-maybe)
(auto-package-update-at-time "09:00")

;; Disable line numbers for some modes
(dolist (mode '(term-mode-hook
                vterm-mode-hook
                shell-mode-hook
                eshell-mode-hook
                pdf-view-mode-hook
                treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

;; Set up the visible bell
(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))
