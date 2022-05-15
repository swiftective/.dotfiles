
(doom! :input
       :completion
       company           ; the ultimate code completion backend
       vertico           ; the search engine of the future
       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       (emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides     ; highlighted indent columns
       ligatures         ; ligatures and symbols to make your code pretty again
       minimap           ; show a map of the code on the side
       modeline          ; snazzy, Atom-inspired modeline, plus API
       neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing
       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       multiple-cursors  ; editing in many places at once
       snippets          ; my elves. They type so I don't have to
       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       (spell +flyspell) ; tasing you for misspelling mispelling
       grammar           ; tasing grammar mistake every you make

       :tools
       debugger          ; FIXME stepping through code, to help you add bugs
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       lsp               ; M-x vscode
       magit             ; a git porcelain for Emacs

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS

       :lang
       (dart +flutter +lsp)   ; paint ui and not much else
       (emacs-lisp +lsp)        ; drown in parentheses
       (go +lsp)         ; the hipster dialect
       (haskell +lsp)    ; a language that's lazier than I am
       json              ; At least it ain't XML
       (javascript +lsp)        ; all(hope(abandon(ye(who(enter(here))))))
       (kotlin +lsp)            ; a better, slicker Java(Script)
       (latex +lsp)             ; writing papers in Emacs has never been so fun
       (lua +lsp)               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       (org +lsp +roam2)               ; organize your plain life in plain text
       php               ; perl's insecure younger brother
       (python)            ; beautiful is better than ugly
       (rust +lsp)              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh)                ; she sells {ba,z,fi}sh shells on the C xor
       (swift +lsp)             ; who asked for emoji variables?
       (yaml +lsp)              ; JSON, but readable

       :email
       :app
       :config
       (default +bindings +smartparens))

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-minted-options '(("breaklines" "true")
                                 ("breakanywhere" "true")))

(defun my-convert-tables ()
  "No questions asked, just convert the table"
  (interactive)
  (org-table-align)
  (org-table-convert))

