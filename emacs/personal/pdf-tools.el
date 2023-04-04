(unless (package-installed-p 'pdf-tools)
  (package-install 'pdf-tools))

(unless (package-installed-p 'pdf-view-restore)
  (package-install 'pdf-view-restore))

(add-hook 'pdf-view-mode-hook 'pdf-view-restore-mode)
(add-hook 'doc-view-mode-hook 'pdf-tools-install)
