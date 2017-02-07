(use-package go-mode
  :ensure t)

(use-package go-autocomplete
  :ensure t)

(use-package go-eldoc
  :ensure t)

(add-hook 'go-mode-hook 'go-eldoc-setup)
(setq gofmt-command "goimports")

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (local-set-key (kbd "C-c i") 'go-goto-imports)
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
            (local-set-key (kbd "C-c C-g") 'magit-status)))

(add-hook 'before-save-hook 'gofmt-before-save)
(provide '20-go)
