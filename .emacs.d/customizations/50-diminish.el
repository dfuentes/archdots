(use-package diminish
  :ensure t
  :config
  (eval-after-load "flyspell"
    '(diminish 'flyspell-mode))
  (eval-after-load "whitespace"
    '(diminish 'global-whitespace-mode))
  (eval-after-load "flycheck"
    '(setq-default flycheck-mode-line-lighter " ✓"))
  (eval-after-load "smartparens"
    '(diminish 'smartparens-mode))

  (eval-after-load "hi-lock"
    '(diminish 'hi-lock-mode))


  (diminish 'auto-complete-mode)
  (diminish 'yas-minor-mode)
  (diminish 'auto-fill-function)
  (diminish 'isearch-mode)

  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (setq mode-name "el"))))

(provide '50-diminish)
