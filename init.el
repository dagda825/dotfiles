;; I have no idea!
(cua-mode 1)
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
;; attempting to install geiser for chicken, a scheme implementation.

(use-package geiser-chicken :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(geiser-chicken js2-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Add windmove keybindings
(windmove-default-keybindings)
;; Add my help file to a side window, 1/3 of the frame real estate.
(setq display-buffer-alist
      (cons '("\\help.org\\'" ; Match buffer name
              (display-buffer-in-side-window) ; Action to take
              (side . right) ; Position of side window
              (window-width . 0.33)) ; Width as a fraction of screen
            display-buffer-alist))
;; makes .js files automatically use js2-mode
;; i think.
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

