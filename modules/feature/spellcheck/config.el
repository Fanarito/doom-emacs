;;; feature/spellcheck/config.el

(@def-package flyspell ; built-in
  :commands flyspell-mode
  :init
  (add-hook 'text-mode-hook 'flyspell-mode)
  :config
  (setq ispell-program-name (executable-find "aspell")
        ispell-list-command "--list"
        ispell-extr-args '("--dont-tex-check-comments"))

  (@map :map flyspell-mode-map
        :localleader
        :n "s" 'flyspell-correct-word-generic
        :n "S" 'flyspell-correct-previous-word-generic))


(@def-package flyspell-correct
  :commands (flyspell-correct-word-generic
             flyspell-correct-previous-word-generic))


(@def-package flyspell-correct-popup
  :after flyspell-correct
  :config
  (setq flyspell-popup-correct-delay 0.8)
  (define-key popup-menu-keymap [escape] 'keyboard-quit))
