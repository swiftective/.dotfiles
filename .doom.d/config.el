(setq user-full-name "swiftective"
      user-mail-address "nil")

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(load-theme 'doom-tokyo-night t)

(setq default-frame-alist '(
        (right-divider-width . 1)
        (bottom-divider-width . 1)
        (fullscreen . maximized)
        (alpha 80 80)
        (font . "Jetbrains Mono")
        (vertical-scroll-bars)
        (tool-bar-lines . 0)
        (menu-bar-lines . 0)
        (buffer-predicate . doom-buffer-frame-predicate)
        (left-fringe . 4)
        (right-fringe . 4)))

(map!
 :nv "C-f" #'evil-scroll-up
 :nv "L" #'evil-end-of-line
 :nv "H" #'evil-beginning-of-line
 "M-p" #'execute-extended-command
 :nv "C-p" #'projectile-find-file
 :nv "C-l" #'evil-buffer
 :i "C-v" #'clipboard-yank
 :i "C-M-i" #'org-roam-node-insert-immediate
 :nv "/" #'evil-search-forward
 :nv "?" #'evil-search-backward
 :nv "n" #'evil-search-next
 :nv "N" #'evil-search-previous
 :nv ")" #'git-gutter:next-hunk
 :nv "(" #'git-gutter:previous-hunk
 )

(setq select-enable-clipboard nil) ;; NO SYS CLIPBOARD

(map! :leader
      :desc "Git Status"
      "g s" #'magit-status
      "h s" #'git-gutter:stage-hunk
      "h r" #'git-gutter:revert-hunk
      "h R" #'vc-revert
      "e" #'+neotree/open
      "o c" #'org-capture
      )


(after! vterm
  (set-popup-rule! "*doom:vterm-popup:main" :size 0.50 :vslot -4 :select t :quit nil :ttl 0)
  )

;; center the cursor
(define-global-minor-mode my-global-centered-cursor-mode centered-cursor-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'Info-mode 'term-mode 'eshell-mode 'shell-mode 'erc-mode)))
      (centered-cursor-mode))))
(my-global-centered-cursor-mode 1)


(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(after! org
  (setq org-capture-templates
        '(("t" "Task Entry" entry
           (file "~/org/todo.org")
           "* TODO %?"
           :kill-buffer t))))

(defun custom-dashboard-func ()
  (mapc (lambda (line)
          (insert (propertize (+doom-dashboard--center +doom-dashboard--width line)
                              'face 'font-lock-comment-face) " ")
          (insert "\n"))
        '("                                     "
                "                                   "
                "                                   "
                "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          "
                "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       "
                "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     "
                "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    "
                "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   "
                "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  "
                "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   "
                " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  "
                " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ "
                "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     "
                "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     "
                "                               ")))

(setq +doom-dashboard-ascii-banner-fn #'custom-dashboard-func)

(setq fancy-splash-image "~/.doom.d/.img/arch.svg")

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(pushnew! tree-sitter-major-mode-language-alist
          '(scss-mode . css))
