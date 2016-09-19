; Custom keybindings
; Setup my find-files
(define-key global-map "\ef" 'find-file)
(define-key global-map "\eF" 'find-file-other-window)

; Switching buffers
(global-set-key (read-kbd-macro "\eb")  'ido-switch-buffer)
(global-set-key (read-kbd-macro "\eB")  'ido-switch-buffer-other-window)

; Rebind save to M-s instead of C-x C-s
(defun rebound-save-buffer ()
  "Save the buffer after untabifying it."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (untabify (point-min) (point-max))))
  (save-buffer))
(define-key global-map "\C-s" 'rebound-save-buffer)

; Rebind search since C-s is now save
(define-key global-map "\es" 'isearch-forward)

; Switch between windows with M-q
(define-key global-map "\eq" 'other-window)

; Use clipboard for copy and paste
(setq select-active-regions nil)
(setq mouse-drag-copy-region t)

; Duplicate line with C-d 
(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))
(define-key global-map  "\C-d" 'duplicate-line)

; Turn off Windows bell when scrolling limit reached
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function) 

; Move autosaves out of source directories
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

; Line numbers
(global-linum-mode t)

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

; Set Default Cursor 
(set-default 'cursor-type 'hbar)

; Highlight parentheses
(show-paren-mode)

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

; Custom functions

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
