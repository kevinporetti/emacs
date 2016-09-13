; Turn off Windows bell when scrolling limit reached
(defun my-bell-function ()
  (unless (memq this-command
		'(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function) 

; Linux C indentation style
(setq c-default-style "linux"
      c-basic-offset 4)

; 4 Spaces for tab
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

; Turn off the toolbar
(tool-bar-mode 0)

; Smooth scroll
(setq scroll-step 3)

; No scroll bar
(scroll-bar-mode -1)

; No menu bar
(menu-bar-mode -1)

; Font
(set-face-attribute 'default t :font "Liberation Mono-11.5")

; Trust my themes all the time
(setq custom-safe-themes t)

; Load Zweilight theme
(package-initialize)
(load-theme 'zweilight t)

; Startup windowing
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

; Maximize on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("604df4e364738a338cfaf10db323eafb5b7ca4a3ccba41b27c1930da3dff52c8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
