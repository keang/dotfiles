;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Keang Song"
      user-mail-address "skeang@gmail.com"
      persp-auto-save-fname "autosave")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)
  (setq
      doom-font "JetBrains Mono NL"
      doom-variable-pitch-font "Palatino")
;; (setq ;; doom-font "JetBrains Mono NL-18"
;;       ;;doom-big-font "JetBrains Mono NL-28"
;;       line-spacing 4)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")
;; (setq org-journal-dir "~/p/journal")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; (require 'ox-confluence)
(mapc 'projectile-add-known-project (mapcar (lambda(x) (concat "~/w/" x)) (directory-files "~/w")))
;; (mapc 'projectile-add-known-project (mapcar (lambda(x) (concat "~/org/" x)) (directory-files "~/org")))

;; (mapc 'projectile-add-known-project
;;       (mapcar (lambda(x) (concat "~/w/libraries/" x)) (directory-files "~/w/libraries")))

;; (projectile-add-known-project "~/go/src/github.com/jobseekerltd/red")
;; (projectile-add-known-project "~/p/keang.github.io")
;; (projectile-add-known-project "~/p/journal")
;; (projectile-add-known-project "~/w/ml")
;; (projectile-add-known-project "~/p/savvyminions")
;; (projectile-add-known-project "~/p/savvyminions-landing")
;; (projectile-add-known-project "~/.emacs.d")
 (projectile-add-known-project "~/dotfiles")
(setq auto-mode-alist (cons '("\\.md$" . gfm-mode) auto-mode-alist))

(defun vc-or-find-file(&optional project-root)
  (interactive)
  (let ((vcs (projectile-project-vcs project-root)))
    (cl-case vcs
      (git
        (projectile-vc project-root))
      (t (doom-project-find-file project-root)))))
(setq +workspaces-switch-project-function #'vc-or-find-file)
;; (setq projectile-project-root-files-bottom-up '("LICENSE.txt" "Gemfile" "requirements.txt" "setup.py" "package.json" "LICENSE" "README.md" "License.txt" "README.rdoc" "README.markdown"))
;; (setq projectile-project-root-files-bottom-up '(".git" "LICENSE.txt" "Gemfile" "requirements.txt" "setup.py" "LICENSE" "License.txt" "README.rdoc" "README.markdown"))
;; (setq projectile-project-root-files-functions '(projectile-root-local projectile-root-top-down projectile-root-bottom-up projectile-root-top-down-recurring))
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(setq lsp-clients-typescript-prefer-use-project-ts-server 't)
(use-package mixed-pitch
  :hook
  (gfm-mode . mixed-pitch-mode)
  (org-mode . mixed-pitch-mode))
(map! :localleader
      :map org-mode-map
      "f" #'flyspell-buffer)
(map! :localleader
      :map markdown-mode-map
      "x" #'markdown-eval-current-code-block
      "f" #'flyspell-buffer)
(setq doom-localleader-key "\\")
(require 'dap-node)

;; (defun save-and-evil-force-n ()
;;   (interactive)
;;   (save-buffer)
;;   (evil-force-normal-state)
;;   )
(map! :vni "<mouse-4>" 'evil-scroll-line-up
      :vni "<mouse-5>" 'evil-scroll-line-down)
(map! :vni "s-<mouse-1>" '+lookup/definition)
(map! :vni "C-p" '+ivy/projectile-find-file
      :vni "M-p" 'evil-paste-pop
      :vni "C-t" 'rspec-verify-single-and-return)
(map! :i "C-," 'copilot-accept-completion)
(map! :i "C-;" 'copilot-accept-completion-by-word)
(map! :i "C-." 'copilot-next-completion)
(map! :i "C-SPC" 'copilot-complete)
(map! :i "<f6> d a c" #'copilot-accept-completion)

(defun swap-and-focus ()
  (interactive)
  (ace-swap-window)
  (evil-window-prev 1))

(global-set-key [?\C-\\] 'swap-and-focus)

(map! :n "C-j" 'newline)
(map! :i [backtab] 'dabbrev-expand)
(map! :leader
      "g d" #'git-gutter:popup-hunk
      "g u" #'git-link
      "k m" #'smerge-keep-mine
      "k o" #'smerge-keep-other
      "k a" #'smerge-keep-all
      "k n" #'smerge-next
      "w f" #'delete-other-windows
      "o e" #'treemacs-select-window
      "]" #'+popup/toggle
      "a" #'+default/search-project)

(customize-set-value 'helm-icons-mode->icon nil)
(defun run-and-return(func)
  (funcall func)
  (evil-window-prev 1))
(setq rspec-spec-command "bin/rspec")
(defun rspec-verify-and-return ()
  "Run `rspec-verify' and `previous-multiframe-window' in sequence."
  (interactive)
  (run-and-return 'rspec-verify))
(
 defun rspec-verify-single-and-return ()
  "Run `rspec-verify-single' and return to current window"
  (interactive)
  (run-and-return 'rspec-verify-single))
(defun rspec-run-last-failed-and-return ()
  "Run `rspec-verify-failed' and return to current window"
  (interactive)
  (run-and-return 'rspec-run-last-failed))
(defun rspec-rerun-and-return ()
  "Run `rspec-rerun' and return to current window"
  (interactive)
  (run-and-return 'rspec-rerun))

(map! :leader
      "TAB b" #'+workspace/other)
(defun next-search-result ()
  (interactive)
  (ivy-resume)
  )
(defun narrow-next-line ()
  (interactive)
  (widen)
  (next-line)
  (narrow-to-region (line-beginning-position) (line-end-position))
  )
(defun narrow-previous-line ()
  (interactive)
  (widen)
  (previous-line)
  (narrow-to-region (line-beginning-position) (line-end-position))
  )
(map! :n "zg" #'narrow-next-line)
(map! :n "zG" #'narrow-previous-line)
(map! :leader
      "t a" #'rspec-verify-and-return
      "t n" #'rspec-verify-single-and-return
      "t SPC" #'rspec-run-last-failed-and-return
      "t t" #'rspec-rerun-and-return)
(defun doom-window-shrink ()
  (interactive)
  (evil-window-prev 1)
  (doom/window-enlargen)
  (evil-window-prev 1))
(defun vterm-toggle-and-rerun ()
  (+vterm/toggle nil)
  (vterm-send-up)
  (vterm-send-return)
  )
(defun vterm-rerun ()
  (interactive)
  (vterm-toggle-and-rerun)
  )

(map! :leader
      "v SPC" #'vterm-rerun)

(map! :leader
      "w a" #'doom-window-shrink)

(map! :after vterm
      :map vterm-mode-map
      :ni "C-c" #'vterm-send-C-c)
(map! :leader
      "f a" (lambda() (interactive) (save-buffer) (revert-buffer)))
(map! :leader
      "t d" (lambda() (interactive) (load-theme 'doom-homage-black)))
(map! :leader
      ;; "t h" (lambda() (interactive) (load-theme 'doom-one-light)))
      "t h" (lambda() (interactive) (load-theme 'doom-oksolar-light)))
(map! :leader
      "!" #'project-shell-command
      "&" #'projectile-run-async-shell-command-in-root)
(map! :leader
      "j" '+fold/toggle
      "e" 'redraw-display)
(map! :leader
      "c C" #'compile
      "c c" #'recompile)
;; (key-chord-define evil-insert-state-map "jk" 'save-and-evil-force-n)
;; (:prefix-map ("c" . "code")
;;  :desc "Compile"                               "C"   #'compile
;;  :desc "Recompile"                             "c"   #'recompile
;;  )
(setq flycheck-ruby-rubocop-executable "~/.rbenv/shims/rubocop-daemon")
(setq rspec-use-bundler-when-possible nil)
(map! :localleader
      :map ruby-mode-map
      "d" #'robe-ask
      "i" #'ruby-hash-syntax-toggle)
(defun kill-daemon ()
  (interactive)
  (let ((default-directory (project-root (project-current t))))
    (shell-command "bin/ruby_preloader stop")))

(map! :after ruby-mode
      :localleader
      :map ruby-mode-map
      :prefix ("c" . "rspec command")
      "k" #'kill-daemon)

(map! :localleader
      :map markdown-mode-map
      "n" #'flyspell-goto-next-error
      "c" #'flyspell-auto-correct-word)

(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(map! :nv "g h" #'yari)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq lsp-auto-guess-root t)

;; work around to treat _ as part of a word
;; For python
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(add-hook 'yaml-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; For ruby
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; (add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; (global-wakatime-mode)

;; Toggle code folding according to indentation of current line."
(defun sd-toggle-fold () (interactive) (set-selective-display (if selective-display nil (save-excursion (back-to-indentation) (1+ (current-column))))))
(defun sd-increment-level () (interactive) (set-selective-display (+ 2 (if selective-display selective-display 0))))
(defun sd-decrement-level () (interactive) (set-selective-display (- (if selective-display (if (> selective-display 2) selective-display 2) 2) 2)))
(map! :n "zi" #'sd-toggle-fold)
(map! :n "zu" #'sd-increment-level)
(map! :n "zp" #'sd-decrement-level)
(map! :m "]z" #'next-search-result)

;; (setq gc-cons-threshold 600000000)
(setq read-process-output-max (* 4096 1024))
(setq lsp-idle-delay 0.500)
(setq lsp-print-performance t)

;; (add-hook 'inf-ruby-mode-hook
;;           (lambda() (let ((p "\\(^(rdbg@.*#\d+) *\\)"))
;;                        (setq inf-ruby-first-prompt-pattern (concat inf-ruby-first-prompt-pattern p))
;;                        (setq inf-ruby-prompt-pattern (concat inf-ruby-prompt-pattern p)))))

(setq blink-matching-paren t)
(blink-cursor-mode)

(use-package! copilot
  :hook (prog-mode . copilot-mode))
(use-package rubocopfmt
  :hook
  (ruby-mode . rubocopfmt-mode))
(setq rubocopfmt-use-bundler-when-possible nil)
(setq rubocopfmt-rubocop-command "/usr/local/bin/rubocop-daemon-wrapper/rubocop")
(setq rubocop-check-command "/usr/local/bin/rubocop-daemon-wrapper/rubocop --format emacs")

(setq rustic-format-on-save t)
(setq lsp-rust-analyzer-diagnostics-disabled ["unresolved-proc-macro"])

(require 'obsidian)
(obsidian-specify-path "~/p/crossnotes-jekyll/_notes")
;; If you want a different directory of `obsidian-capture':
(setq obsidian-inbox-directory "_scratch")
;; Clicking on a wiki link referring a non-existing file the file can be
;; created in the inbox (t) or next to the file with the link (nil).
;; Default: t - creating in the inbox
;(setq obsidian-wiki-link-create-file-in-inbox nil)
;; You may want to define a folder for daily notes. By default it is the inbox.
;(setq obsidian-daily-notes-directory "Daily Notes")
;; Directory of note templates, unset (nil) by default
;(setq obsidian-templates-directory "Templates")
;; Daily Note template name - requires a template directory. Default: Daily Note Template.md
;(setq obsidian-daily-note-template "Daily Note Template.md")


;; Define obsidian-mode bindings
(add-hook
 'obsidian-mode-hook
 (lambda ()
   ;; Replace standard command with Obsidian.el's in obsidian vault:
   (local-set-key (kbd "C-c C-o") 'obsidian-follow-link-at-point)

   ;; Use either `obsidian-insert-wikilink' or `obsidian-insert-link':
   (local-set-key (kbd "C-c C-l") 'obsidian-insert-wikilink)

   ;; Following backlinks
   (local-set-key (kbd "C-c C-b") 'obsidian-backlink-jump)))

(map! :leader
      "o o" #'obsidian-follow-link-at-point
      "o w" #'obsidian-insert-wikilink
      "o l" #'obsidian-backlink-jump)

;; Activate detection of Obsidian vault
(global-obsidian-mode t)

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.4))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))

(add-hook 'typescript-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(setq! typescript-indent-level 2)
