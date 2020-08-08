;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
(setq doom-font "Fira Mono-17"
      doom-big-font "Fira Mono-28")

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq magit-blame--style
      '(margin
        (margin-format " %s%f" " %C %a" " %H")
        (margin-width . 42)
        (margin-face . magit-blame-margin)
        (margin-body-face magit-blame-dimmed)))

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

(setq projectile-project-root-files '("Gemfile" "requirements.txt" "setup.py" "package.json" "LICENSE" "README.md" "License.txt"))
(mapc 'projectile-add-known-project
      (mapcar (lambda(x) (concat "~/work/" x)) (directory-files "~/work")))

(mapc 'projectile-add-known-project
      (mapcar (lambda(x) (concat "~/work/libraries/" x)) (directory-files "~/work/libraries")))

(projectile-add-known-project "~/p/keang.github.io")
(projectile-add-known-project "~/.emacs.d")
(projectile-add-known-project "~/.rbenv/versions/2.4.5/lib/ruby/gems/2.4.0/gems/ferrum-0.9")
(projectile-add-known-project "~/.rbenv/versions/2.4.5/lib/ruby/gems/2.4.0/gems/capybara-2.12.1")
(projectile-add-known-project "~/.rbenv/versions/2.4.5/lib/ruby/gems/2.4.0/gems/cuprite-0.11")
(projectile-add-known-project "~/dotfiles")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#21242b" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   (quote
    ("9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ff6c6b")
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

(defun save-and-evil-force-n ()
  (interactive)
  (save-buffer)
  (evil-force-normal-state)
  )
(map! :vni "C-;" 'save-and-evil-force-n
      :vni "C-p" '+ivy/projectile-find-file
      :vni "M-p" 'evil-paste-pop
      :vni "C-t" 'rspec-verify-single-and-return)
(global-set-key [?\C-\\] 'previous-multiframe-window)
(map! :n "C-j" 'newline)
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

(defun run-and-return(func)
  (funcall func)
  (evil-window-mru))
(defun rspec-verify-and-return ()
  "Run `rspec-verify' and `previous-multiframe-window' in sequence."
  (interactive)
  (run-and-return 'rspec-verify))
(
 defun rspec-verify-single-and-return ()
  "Run `rspec-verify-single' and `previous-multiframe-window' in sequence."
  (interactive)
  (run-and-return 'rspec-verify-single))
(defun rspec-run-last-failed-and-return ()
  "Run `rspec-verify-failed' and `previous-multiframe-window' in sequence."
  (interactive)
  (run-and-return 'rspec-run-last-failed))

(map! :leader
      "t a" #'rspec-verify-and-return
      "t n" #'rspec-verify-single-and-return
      "t t" #'rspec-run-last-failed-and-return)
(map! :leader
      "&" #'projectile-run-async-shell-command-in-root)
(map! :leader
      "j" '+fold/toggle
      "e" 'redraw-frame)
;; (key-chord-define evil-insert-state-map "jk" 'save-and-evil-force-n)
(setq flycheck-ruby-rubocop-executable "~/.rbenv/shims/rubocop")
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; work around to treat _ as part of a word
;; For python
(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; For ruby
(add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
