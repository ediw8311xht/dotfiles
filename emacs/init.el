
;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'evil)        (package-install 'evil))
(unless (package-installed-p 'slime)       (package-install 'slime))
(unless (package-installed-p 'evil-escape) (package-install 'evil-escape))

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(require 'evil)
(require 'w3m-load)
(require 'slime)
(require 'evil-escape)
;; (require 'lilypond)

;;---------------------------------------------------------------------    SETTINGS    --------------;;
(evil-escape-mode)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq scroll-step            1
      scroll-conservatively  10000)

(setq-default evil-escape-key-sequence "jk")

;;---------------------------------------------------------------------    FUNCTIONS    -------------;;
(defun edit_config_file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun evil_three_mode_map (x y)
  (define-key evil-normal-state-map x y)
  (define-key evil-insert-state-map x y)
  (define-key evil-visual-state-map x y))

;;---------------------------------------------------------------------    EVIL    ------------------;;
(evil-mode t)
(evil-set-leader 'normal (kbd "SPC"))
(evil-set-leader 'normal (kbd ","))

;;--THREE-MODE--;;
(evil_three_mode_map (kbd  "C-\-") 'text-scale-decrease)
(evil_three_mode_map (kbd  "C-\=") 'text-scale-increase)
;-----------------------(evil_three_mode_map (kbd "C-\+") 'text-scale-increase)

(evil_three_mode_map (kbd  "C-:")  'backward-sexp)
(evil_three_mode_map (kbd  "C-;")  'forward-sexp)

;;--NORMAL--;;
(define-key evil-normal-state-map (kbd "<leader>]") 'bs-cycle-next    )
(define-key evil-normal-state-map (kbd "<leader>[") 'bs-cycle-previous)
(define-key evil-normal-state-map (kbd "<leader>x") 'eval-buffer      )
(define-key evil-normal-state-map (kbd "<leader>w") 'evil-write       )
(define-key evil-normal-state-map (kbd "<leader>z") 'kill-buffer      )
(define-key evil-normal-state-map (kbd "<leader>y") 'execute-extended-command )
;(define-key evil-normal-state-map (kbd "<leader>qe") (find-file "~/Desktop/Coding/LISP/"))


(define-key evil-normal-state-map (kbd "C-h")       'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j")       'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k")       'evil-window-up  )
(define-key evil-normal-state-map (kbd "C-l")       'evil-window-right)

(define-key evil-normal-state-map (kbd "C-s")       'split-window-right)
(define-key evil-normal-state-map (kbd "C-S-s")     'split-window-below)

(define-key evil-normal-state-map (kbd "C-d")       'evil-scroll-down)
(define-key evil-normal-state-map (kbd "C-u")       'evil-scroll-up  )

(define-key evil-normal-state-map (kbd "<leader>ed") 'edit_config_file)
(define-key evil-normal-state-map (kbd "<leader>sl") 'slime)

;;; DESCRIBE KEY COMMAND describe-key

;;--INSERT--;;
(define-key evil-insert-state-map (kbd         "<tab>")      "  ")
(define-key evil-insert-state-map (kbd "C-<backspace>") (kbd "<backspace><backspace>")) 

;;---------------------------------------------------------------------    ETC    -------------------;;

(add-to-list 'default-frame-alist '(alpha 100))
(add-hook 'lisp-mode-hook          (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(evil-set-undo-system 'undo-redo)
(setq evil-want-fine-undo t)
(setq inferior-lisp-program "sbcl")
(setq w3m-default-display-inline-images t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes '(modus-vivendi))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(evil-escape slime evil-visual-mark-mode evil))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Agave" :antialias true :slant normal :weight medium :height 140 :width normal)))))
