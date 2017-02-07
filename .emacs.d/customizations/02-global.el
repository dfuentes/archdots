; increase cache size
(setq gc-cons-threshold 50000000)
; fix gnutls https warnings
(setq gnutls-min-prime-bits 4096)

; set up package manager
(require 'package)

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)
(package-refresh-contents)

; install packages on demand
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

; spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default tab-always-indent 'complete)

(fset 'yes-or-no-p 'y-or-n-p)

(setq initial-scratch-message "")
(setq visible-bell t)

(when (window-system)
  (tool-bar-mode 0)
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
  (scroll-bar-mode -1))

(use-package ido
  :ensure t
  :init (setq ido-enable-flex-matching t
              ido-ignore-extensions t
              ido-use-virtual-buffers t
              ido-everywhere t)
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (add-to-list 'completion-ignored-extensions ".pyc"))

;; (defadvice ido-find-file (after find-file-sudo activate)
;;   "Find file as root if necessary."
;;   (unless (and buffer-file-name
;;                (file-writable-p buffer-file-name))
;;     (let* ((file-name (buffer-file-name))
;;            (file-root (if (string-match "/ssh:\\([^:]+\\):\\(.*\\)" file-name)
;;                           (concat "/ssh:"  (match-string 1 file-name)
;;                                   "|sudo:" (match-string 1 file-name)
;;                                   ":"      (match-string 2 file-name))
;;                         (concat "/sudo:localhost:" file-name))))
;;       (find-alternate-file file-root))))

(use-package ag
  :ensure t
  :commands ag
  :init (setq ag-highlight-search t))

(setq backup-directory-alist
      '(("." . "~/.emacs.d/backups")))

(setq tramp-backup-directory-alist backup-directory-alist)


;; (use-package flyspell
;;   :ensure t
;;   :diminish flyspell-mode
;;   :init
;;   (add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;   (dolist (hook '(text-mode-hook org-mode-hook))
;;     (add-hook hook (lambda () (flyspell-mode 1))))

;;   (dolist (hook '(change-log-mode-hook log-edit-mode-hook org-agenda-mode-hook))
;;     (add-hook hook (lambda () (flyspell-mode -1))))

;;   :config
;;   (setq ispell-program-name "/usr/bin/aspell"
;;         ispell-dictionary "american"
;;         ispell-extra-args '("--sug-mode=ultra" "--lang=en_US")
;;         ispell-list-command "--list")

;;   (add-to-list 'ispell-local-dictionary-alist '(nil
;;                                                 "[[:alpha:]]"
;;                                                 "[^[:alpha:]]"
;;                                                 "['‘’]"
;;                                                 t
;;                                                 ("-d" "en_US")
;;                                                 nil
;;                                                 utf-8)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package color-theme
  :ensure t
  :init
  (load-theme 'tango-dark))


(setq column-number-mode t)

;(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-25-*-*-*-m-0-iso10646-1" nil t)
(setq inhibit-startup-message t)

(provide '02-global)
