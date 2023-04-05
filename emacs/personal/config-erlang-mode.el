(add-hook 'erlang-mode-hook 'lsp-deferred)
(add-to-list 'exec-path "~/apps/language-servers/erlang_ls-0.46.2/_build/default/bin/")

(setq load-path (cons "~/.asdf/installs/erlang/25.3/lib/tools-3.5.3/emacs" load-path))
(require 'erlang-start)
(setq erlang-root-dir "~/.asdf/installs/erlang/25.3/")
(setq exec-path (cons "~/.asdf/installs/erlang/25.3/bin" exec-path))
(setq erlang-man-root-dir "~/.asdf/installs/erlang/25.3/man")

(add-hook 'erlang-mode-hook
  (lambda ()
    (prettify-symbols-mode 1)))
    
(add-hook 'erlang-mode-hook
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

(require 'flycheck)
(flycheck-define-checker erlang-otp
                         "An Erlang syntax checker using the Erlang interpreter."
                         :command ("erlc" "-o" temporary-directory "-Wall"
                                   "-I" "../include" "-I" "../../include"
                                   "-I" "../../../include" source)
                         :modes erlang-mode
                         :error-patterns
                         ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
                          (error line-start (file-name) ":" line ": " (message) line-end)))

(add-hook 'erlang-mode-hook
          (lambda ()
            (flycheck-select-checker 'erlang-otp)
                        (flycheck-mode)))

