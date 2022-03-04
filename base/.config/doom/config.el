;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Chad Groft"
      user-mail-address "chad.groft@hey.com")
(setq auto-save-default t
      truncate-string-ellipsis "…")
(display-time-mode)
(unless (equal "Battery status not available" (battery))
  (display-battery-mode))
(global-subword-mode)
(setq evil-vsplit-window-right t
      evil-split-window-below t)
(setq-default fill-column 100)
(setq doom-font (font-spec :family "Fira Code" :size 14))
(setq doom-variable-pitch-font (font-spec :family "Overpass" :size 18))
(setq doom-serif-font (font-spec :family "Noto Serif" :size 18))
(setq doom-theme 'doom-one)
(setq org-directory "~/org/")
(setq display-line-numbers-type t)
(map! :leader
      (:prefix ("i" . "insert")
       (:prefix ("S" . "suit")
        :desc "Spades" "s" (lambda () (interactive) (insert "♤"))
        :desc "Hearts" "h" (lambda () (interactive) (insert "♡"))
        :desc "Diamonds" "d" (lambda () (interactive) (insert "♢"))
        :desc "Clubs" "c" (lambda () (interactive) (insert "♧")))))
;; (use-package! kubernetes :commands (kubernetes-overview))
;; (use-package! kubernetes-evil :after kubernetes)
(use-package! ledger-mode :mode "\\.dat$")
(use-package! ledger-mode :mode "\\.db$")
(use-package! agda2-mode :mode "\\.lagda\\.md$")
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(setq org-startup-folded t
      org-startup-with-inline-images t
      org-startup-with-latex-preview t)
(setq org-log-note-clock-out t)
(add-hook 'after-init-hook 'org-roam-mode)
(setq org-roam-dailies-capture-templates
      '(("d" "daily" plain
         (function org-roam-capture--get-point) ""
         :immediate-finish t
         :file-name "dailies/%<%Y-%m-%d>"
         :head "#+TITLE: %<%Y-%m-%d>")
        ("w" "weekly" plain
         (function org-roam-capture--get-point) ""
         :immediate-finish t
         :file-name "weeklies/%<%Y-%m-%d>"
         :head "#+TITLE: %<%Y-%m-%d>")
        ("m" "monthly" plain
         (function org-roam-capture--get-point) ""
         :immediate-finish t
         :file-name "monthlies/%<%Y-%m>"
         :head "#+TITLE: %<%Y-%m>")))
(setq org-log-into-drawer t)
(add-hook 'org-mode-hook 'mixed-pitch-mode)
(setq org-hide-emphasis-markers t)
(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autosubmarkers t
        org-appear-autolinks nil)
  ;; for proper first-time setup, `org-appear--set-elements'
  ;; needs to be run after other hooks have acted.
  (run-at-time nil nil #'org-appear--set-elements))
(use-package! org-fragtog
  :hook (org-mode . org-fragtog-mode))
(use-package! org-super-agenda
  :commands (org-super-agenda-mode))
(after! org-agenda (org-super-agenda-mode))
(setq
 org-agenda-skip-scheduled-if-deadline-is-shown   t
 org-agenda-skip-scheduled-if-done                t
 org-agenda-skip-deadline-if-done                 t
 org-agenda-skip-additional-timestamps-same-entry t
 org-agenda-include-deadlines                     t
 org-agenda-compact-blocks                        t
 org-agenda-warning-days                          1
 ;; org-agenda-tags-column                           100
 )
(setq org-agenda-custom-commands
      '(("o" "Overview"
         (
          (agenda "Today"
                  ((org-agenda-span 'day)
                   (org-agenda-start-day "0d")))
          (alltodo "To do"
                   ((org-agenda-overriding-header "")
                    (org-super-agenda-groups
                     '(
                       (:name "In progress" :todo "STRT")
                       (:discard (:not (:todo ("TODO" "WAIT"))))
                       (:discard (:habit))
                       ;; (:discard (:tag ("agenda-ajay")))
                       (:discard (:scheduled future))
                       (:name "First up" :tag "@first")
                       (:name "Quick wins" :tag "@quickwin")
                       (:auto-tags t)))))))))
(setq org-agenda-deadline-faces
      '((1.001 . error)
        (1.0 . org-warning)
        (0.5 . org-upcoming-deadline)
        (0.0 . org-upcoming-distant-deadline)))
(setq org-babel-python-command "python3")
(custom-set-faces!
  '(org-document-title :height 1.2)
  '(outline-1 :weight extra-bold :height 1.25)
  '(outline-2 :weight bold :height 1.15)
  '(outline-3 :weight bold :height 1.12)
  '(outline-4 :weight semi-bold :height 1.09)
  '(outline-5 :weight semi-bold :height 1.06)
  '(outline-6 :weight semi-bold :height 1.03)
  '(outline-8 :weight semi-bold)
  '(outline-9 :weight semi-bold))
(use-package web-mode
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))
(add-to-list 'web-mode-engines-alist
             '("jinja" . "/templates/.*\\.html\\'"))
