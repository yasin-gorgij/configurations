(setq inhibit-startup-screen t)
(scroll-bar-mode -1)

(unless (package-installed-p 'vterm)
  (package-install 'vterm))

(unless (package-installed-p 'all-the-icons)
  (package-install 'all-the-icons))

(unless (package-installed-p 'all-the-icons-dired)
  (package-install 'all-the-icons-dired))

(unless (package-installed-p 'all-the-icons-nerd-fonts)
  (package-install 'all-the-icons-nerd-fonts))

(use-package all-the-icons
  :if (display-graphic-p))

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(eat ace-window ag alchemist all-the-icons all-the-icons-dired all-the-icons-nerd-fonts anzu auto-package-update browse-kill-ring cargo cider company consult crux diff-hl diminish discover-my-major dockerfile-mode easy-kill editorconfig elisp-slime-nav elixir-mode epl erlang exec-path-from-shell expand-region fira-code-mode flycheck flycheck-rust geiser gist git-modes git-timemachine guru-mode haskell-mode hl-todo imenu-anywhere inf-clojure js2-mode json-mode lsp-mode lsp-ui magit move-text nlinum operate-on-number orderless pdf-tools pdf-view-restore projectile racket-mode rainbow-delimiters rainbow-mode restclient ron-mode rust-mode slime smartparens smartrep super-save tree-sitter-langs treemacs undo-tree use-package vertico volatile-highlights vterm web-mode which-key yaml-mode yasnippet zenburn-theme zop-to-char ace-window ag anzu browse-kill-ring consult crux diff-hl diminish discover-my-major easy-kill editorconfig elisp-slime-nav exec-path-from-shell expand-region gist git-modes git-timemachine guru-mode hl-todo imenu-anywhere js2-mode json-mode lsp-ui magit move-text nlinum operate-on-number orderless projectile rainbow-delimiters rainbow-mode smartparens smartrep super-save undo-tree vertico volatile-highlights web-mode which-key yaml-mode zenburn-theme zop-to-char)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Make frame transparency overridable
(defvar efs/frame-transparency '(100 . 100))

;; Set frame transparency
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 120)
(defvar efs/default-variable-font-size 120)

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(set-face-attribute 'default nil :font "Fira Code Medium" :height efs/default-font-size)

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
