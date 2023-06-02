;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p  'evil) (package-install 'evil))
(unless (package-installed-p 'slime) (package-install 'slime))

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(require 'evil)
(require 'w3m-load)
(require 'slime)
;; (require 'lilypond)

;;---------------------------------------------------------------------    SETTINGS    --------------;;
(setq scroll-step            1
      scroll-conservatively  10000)

(global-display-line-numbers-mode)

;;---------------------------------------------------------------------    FUNCTIONS    -------------;;
(defun evil_three_mode_map (x y)
  "Bind for all modes"
  (define-key evil-normal-state-map x y)
  (define-key evil-insert-state-map x y)
  (define-key evil-visual-state-map x y))

;;---------------------------------------------------------------------    EVIL    ------------------;;
(evil-mode t)

;;--SETTINGS--;;
(evil-set-leader 'normal (kbd "SPC"))

;;--THREE-MODE--;;
(evil_three_mode_map (kbd  "C-\-")      'text-scale-decrease)
(evil_three_mode_map (kbd  "C-\=")      'text-scale-increase)
;(evil_three_mode_map (kbd  "C-\+")      'text-scale-increase)

;;--NORMAL--;;
(define-key evil-normal-state-map (kbd "<leader>]")     'next-buffer)
(define-key evil-normal-state-map (kbd "<leader>[") 'previous-buffer)
(define-key evil-normal-state-map (kbd "<leader>x")     'eval-buffer)
(define-key evil-normal-state-map (kbd "<leader>w")     'eval-buffer)

;;--INSERT--;;
(define-key evil-insert-state-map (kbd         "<tab>")      "  ")
(define-key evil-insert-state-map (kbd "C-<backspace>") (kbd "<backspace><backspace>")) 

;;---------------------------------------------------------------------    ETC    -------------------;;

(add-to-list 'default-frame-alist '(alpha 100))
(add-hook 'lisp-mode-hook          (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(setq evil-want-fine-undo t)
(setq inferior-lisp-program "sbcl")
(setq w3m-default-display-inline-images t)

(custom-set-variables
 '(blink-cursor-mode nil)
 '(custom-enabled-themes '(modus-vivendi))
 '(package-selected-packages '(slime evil-visual-mark-mode evil)))

(custom-set-faces
 '(default ((t (:family "FiraCode" :antialias true :slant normal :weight normal :height  95 :width normal)))))
