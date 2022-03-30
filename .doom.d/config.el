;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
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
(setq doom-theme 'doom-tomorrow-night)
(setq doom-font "JetBrains Mono NL-18"
      doom-big-font "JetBrains Mono NL-28"
      line-spacing 4)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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
(require 'ox-confluence)
;; (mapc 'projectile-add-known-project (mapcar (lambda(x) (concat "~/w/" x)) (directory-files "~/w")))
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
;; (projectile-add-known-project "~/dotfiles")
(setq +workspaces-switch-project-function #'projectile-vc)
(setq projectile-project-root-files '("Gemfile" "requirements.txt" "setup.py" "package.json" "LICENSE" "README.md" "License.txt" "README.rdoc"))
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
(use-package mixed-pitch
  :hook
  (org-mode . mixed-pitch-mode))
(map! :localleader
      :map org-mode-map
      "f" #'flyspell-buffer)
(map! :localleader
      :map markdown-mode-map
      "f" #'flyspell-buffer)
(setq doom-localleader-key "\\")

(defun save-and-evil-force-n ()
  (interactive)
  (save-buffer)
  (evil-force-normal-state)
  )
(map! :vni "<mouse-4>" 'evil-scroll-line-up
      :vni "<mouse-5>" 'evil-scroll-line-down)
(map! :vni "C-;" 'save-and-evil-force-n
      :vni "C-p" '+ivy/projectile-find-file
      :vni "M-p" 'evil-paste-pop
      :vni "C-t" 'rspec-verify-single-and-return)
(defun swap-and-focus ()
  (interactive)
  (ace-swap-window)
  (evil-window-prev 1))

(global-set-key [?\C-\\] 'swap-and-focus)

(map! :n "C-j" 'newline)
(map! :i [backtab] 'dabbrev-expand)
(map! :n "SPC /" #'comment-line)
(map! :v "SPC /" #'comment-or-uncomment-region)
(map! :leader
      "g d" #'git-gutter:popup-hunk
      "g u" #'git-link
      "k m" #'smerge-keep-mine
      "k o" #'smerge-keep-other
      "k a" #'smerge-keep-all
      "k n" #'smerge-next
      "w f" #'delete-other-windows
      "]" #'+popup/toggle
      "a" #'+default/search-project)

(customize-set-value 'helm-icons-mode->icon nil)
(defun run-and-return(func)
  (funcall func)
  (evil-window-prev 1))
(setq rspec-spec-command "bundle exec rspec")
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
(defun vterm-rerun ()
  (interactive)
  (vterm-send-up)
  (vterm-send-return)
  )

(map! :leader
      "v SPC" #'vterm-rerun)

(map! :leader
      "w a" #'doom-window-shrink)

(map! :after vterm
      :map vterm-mode-map
      :ni "C-c" #'vterm-send-C-c)

(map! :leader
      "t d" (lambda() (interactive) (load-theme 'doom-tomorrow-night)))
(map! :leader
      "t h" (lambda() (interactive) (load-theme 'doom-tomorrow-day)))
(map! :leader
      "&" #'projectile-run-async-shell-command-in-root)
(map! :leader
      "j" '+fold/toggle
      "e" 'redraw-display)
;; (key-chord-define evil-insert-state-map "jk" 'save-and-evil-force-n)
(setq flycheck-ruby-rubocop-executable "~/.rbenv/shims/rubocop")
(setq rspec-use-bundler-when-possible nil)
(map! :localleader
      :map ruby-mode-map
      "d" #'robe-ask
      "i" #'ruby-hash-syntax-toggle)
(map! :nv "g h" #'yari)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq org-journal-dir "~/p/journal")
(setq lsp-auto-guess-root t)

;; work around to treat _ as part of a word
;; For python
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; For ruby
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; (add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(global-wakatime-mode)

;; Toggle code folding according to indentation of current line."
(defun sd-toggle-fold () (interactive) (set-selective-display (if selective-display nil (save-excursion (back-to-indentation) (1+ (current-column))))))
(defun sd-increment-level () (interactive) (set-selective-display (+ 2 (if selective-display selective-display 0))))
(defun sd-decrement-level () (interactive) (set-selective-display (- (if selective-display (if (> selective-display 2) selective-display 2) 2) 2)))
(map! :n "zi" #'sd-toggle-fold)
(map! :n "zu" #'sd-increment-level)
(map! :n "zp" #'sd-decrement-level)
