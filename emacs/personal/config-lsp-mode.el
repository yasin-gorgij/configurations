(unless (package-installed-p 'company-box)
  (package-install 'company-box))
(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)
