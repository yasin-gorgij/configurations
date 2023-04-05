(add-hook 'elixir-mode-hook 'lsp-deferred)
(add-to-list 'exec-path "~/apps/language-servers/elixir-ls-1.14-25.1")

(add-hook 'elixir-mode-hook
  (lambda ()
    (prettify-symbols-mode 1)))
    
(add-hook 'elixir-mode-hook
  (lambda ()
    (push '(">=" . ?\u2265) prettify-symbols-alist)
    (push '("<=" . ?\u2264) prettify-symbols-alist)
    (push '("!=" . ?\u2260) prettify-symbols-alist)
    (push '("==" . ?\u2A75) prettify-symbols-alist)
    (push '("=~" . ?\u2245) prettify-symbols-alist)
    (push '("<-" . ?\u2190) prettify-symbols-alist)
    (push '("->" . ?\u2192) prettify-symbols-alist)
    (push '("=>" . ?\u21D2) prettify-symbols-alist)
    (push '("|>" . ?\u25B7) prettify-symbols-alist)))

(add-hook 'elixir-mode-hook
  (lambda ()
    (add-hook 'before-save-hook 'elixir-format nil t)))

(unless (package-installed-p 'flycheck-credo)
  (package-install 'flycheck-credo))
(eval-after-load 'flycheck
  '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)

