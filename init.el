
;                                        /;    ;\
;                                    __  \\____//
;                                   /{_\_/   `'\____
;                                   \___   (o)  (o  }
;        _____________________________/          :--'  
;    ,-,'`@@@@@@@@       @@@@@@         \_    `__\
;   ;:(  @@@@@@@@@        @@@             \___(o'o)
;   :: )  @@@@          @@@@@@        ,'@@(  `===='       
;   :: : @@@@@:          @@@@         `@@@:
;   :: \  @@@@@:       @@@@@@@)    (  '@@@'
;   ;; /\      /`,    @@@@@@@@@\   :@@@@@)
;   ::/  )    {_----------------:  :~`,~~;
;  ;;'`; :   )                  :  / `; ;
; ;;;; : :   ;                  :  ;  ; :              
; `'`' / :  :                   :  :  : :
;     )_ \__;      ";"          :_ ;  \_\       `,','
;     :__\  \    * `,'*         \  \  :  \   *  8`;'*  *
;         `^'     \ :/           `^'  `-^-'   \v/ :  \/ 





;; customization
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq make-backup-files nil)
(setq imenu-auto-rescan t)

;; melpa ---
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncommenkj this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; scroll ---
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; visible bell
(setq visible-bell t)


;; indentation ---
(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 4
      indent-tabs-mode t)
(setq-default c-tab-always-indent 'complete)
(setq backward-delete-char-untabify-method 'hungry)
;; make emacs dumber ---
;; (global-set-key (kbd "TAB") 'self-insert-command)
(setq truncate-partial-width-windows nil)
(setq-default truncate-lines t)



;; path: manually installed packages
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; path: custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")



;; load lisp files
;;(load-file "~/.emacs.d/lisp/flames-of-freedom.el")
(load-file "~/.emacs.d/lisp/evil-escape.elc")
(load-file "~/.emacs.d/lisp/which-key.el")
(require 'expand-region)
(global-set-key (kbd "C-l") 'er/expand-region)

;; latex
(load-file "./.emacs.d/latex.el")

;; yasnippet
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)


;; theme marker
(load-theme 'hipster t)
;; transparency
(set-frame-parameter (selected-frame) 'alpha '(85 100))

;; global modes
(global-company-mode)(setq company-idle-delay 0)
(electric-pair-mode);;(autopair-global-mode)
(global-visual-line-mode)
(global-auto-revert-mode t)
;; (global-hl-line-mode)

;; global keybindings
(global-set-key (kbd "S-C-j") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-k") 'enlarge-window-horizontally)

;; variables
(setq-default fill-column 50)
(setq lazy-highlight-cleanup nil)


;; hooks
(add-hook 'company-mode-hook 'rainbow-delimiters-mode)
(add-hook 'image-dired-thumbnail-mode-hook '())

;; backup
(setq make-backup-files nil)

;; evil mode
(evil-mode 1)
(setq-default evil-escape-key-sequence "jk")
(evil-escape-mode)
;; (evil-global-set-key 'normal (kbd "C-k") 'er/expand-region)
(evil-global-set-key 'normal (kbd "q") 'kill-this-buffer)
(evil-global-set-key 'normal (kbd "*") 'isearch-forward-symbol-at-point)
;; (evil-global-set-key 'normal "?" 'isearch-backward-regexp)
;; (evil-global-set-key 'normal "/" 'isearch-forward-regexp)
(evil-global-set-key 'normal (kbd "C-j") 'xref-find-definitions)
(evil-global-set-key 'normal (kbd "C-k") 'xref-pop-marker-stack)


;; org mode
(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "M-l") 'org-metaright)
     (define-key org-mode-map (kbd "M-k") 'org-metaup)
     (define-key org-mode-map (kbd "M-j") 'org-metadown)
     (define-key org-mode-map (kbd "M-h") 'org-metaleft)))
;; org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-startup-folded nil)
;; org-evil
(define-key evil-motion-state-map (kbd "TAB") nil)

;; dired mode
(eval-after-load 'dired
  '(progn
     (define-key dired-mode-map (kbd "g") nil)
     (define-key dired-mode-map (kbd "G") nil)))

;; bhalo jinis
(defun increment-number-at-point ()
      (interactive)
      (skip-chars-backward "0-9")
      (or (looking-at "[0-9]+")
          (error "No number at point"))
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))
(evil-global-set-key 'normal (kbd "C-;") 'increment-number-at-point)

;; internet relay chat
(setq erc-nick "corvo7980")
(setq erc-password "rasengan")
(global-set-key "\C-ceb" (lambda () (interactive)
                           (erc :server "localhost" :port "6667"
                                :nick "gordon-freeman-0354"
				:password "rasengan")))

;; compile
(require 'compile)
(setq compile-command "./run");
;; (evil-global-set-key 'normal (kbd "RET") 'compile)
(define-key compilation-mode-map (kbd "g") nil) ;; unbind recompile key


;; which key
;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-show-early-on-C-h t)
;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.
(setq which-key-idle-delay 0.00)
(setq which-key-idle-secondary-delay 0.00)
(which-key-mode)

;; show file name
(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))
(global-set-key [C-f1] 'show-file-name) ; Or any other key you want


;; browser
(setq browse-url-browser-function 'browse-url-firefox)


;; kajer jinis -----------------------------------------------------------------------------
(defun e ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun aaa ()
  (interactive)
  (fancy-about-screen))
(defun bbb ()
  (interactive)
  (find-file "~/.bashrc"))
(defun xxx ()
  (interactive)
  (find-file "~/.Xresources"))
(defun yyy ()
  (interactive)
  (find-file "~/.bashrc")
  (search-forward "ycontinue")
  (evil-scroll-line-to-top nil)
  )
(defun thikache ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (find-file "/home/user1/computer.txt")
  (delete-other-windows)
  (cd "/")
  )
(defun close ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (find-file "/home/user1/computer.txt")
  (delete-other-windows)
  (cd "/")
  )
(defun cal ()
  (interactive)
  (calendar)
  ;; (delete-other-windows)
  )
(defun ddd ()
  (interactive)
  (diary)
  (evil-window-next nil)
  (delete-other-windows))



(defun gen-run ()
       "generate run file"
  (interactive)
  (find-file "run")
  (erase-buffer)
  (insert "#-*-sh-*-\n")
  (insert "\n\n")
  (insert "flags=\"-g -z execstack -fno-stack-protector\"\n")
  (insert "files=\"faltu.c\"\n")
  (insert "\n\n")
  (insert "if gcc $files $flags; then\n")
  (insert "    echo -e \"\\n\\n  compile hoe geche\\n\\n\";\n")
  (insert "    ./a.out\n")
  (insert "else\n")
  (insert "    echo -e \"\\n\\n  hocche na\\n\\n\";\n")
  (insert "fi\n")
  (save-buffer)
  (revert-buffer :ignore-auto :noconfirm)
  )


(load "/home/user1/.emacs.d/files.el")


(defun faltu ()
  (interactive)
  (insert "asdfkjalsefsd;lkfjasd;lfjasd;lfs;ldfjas;dfj\n")
  )




;; hat dite nei ------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(company-backends
   '(company-dabbrev-code company-dabbrev company-abbrev company-bbdb company-semantic company-cmake company-abbrev company-capf company-files
			  (company-dabbrev-code company-gtags company-etags company-keywords)
			  company-oddmuse company-dabbrev))
 '(custom-safe-themes
   '("846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "18c5ec0e4d1723dbeadb65d17112f077529fd24261cb8cd4ceee145e6a6f4cd1" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "850bb46cc41d8a28669f78b98db04a46053eca663db71a001b40288a9b36796c" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "1df2d767cc1b5ed78626f93f06c24ac15144a28b7420364769bf63cd23e420d3" "56d10d2b60685d112dd54f4ba68a173c102eacc2a6048d417998249085383da1" "4ce515d79ef94f3b7651c8e2a7c7d81814b9ca911eb2a16955f45f4555faf524" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "ded82bed6a96cb8fdc7a547ef148679e78287664a5236e9c694e917383b052d7" "47fd2dded29bffc2cc00b73c6aa1ac52ea64f72b5ba42822f72644b915941e3c" "fc519762ada2b7780ede9c4573557bf138dea06e9bef638eac0c1bb4b4fe929d" "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" "fb23e41e6aadae8823fec46ea18e6c7fd49f41437fb299e72ee0f2fdb55d62f1" "eb25c68d3959c31d34021aa722d5ea1c53ea69714580b2b8c150592becf412cf" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "1b780020c8fe8c91829c06d2a9d5c7d8a182216e479c5b24e787fb1712ffb176" "587938eeeaefd2b2f68a0970e02985246a28c02c1c140cb0943d2b6909c47261" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "8e959d5a6771b4d1e2177263e1c1e62c62c0f848b265e9db46f18754ea1c1998" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "188fed85e53a774ae62e09ec95d58bb8f54932b3fd77223101d036e3564f9206" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "5d09b4ad5649fea40249dd937eaaa8f8a229db1cec9a1a0ef0de3ccf63523014" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "5036346b7b232c57f76e8fb72a9c0558174f87760113546d3a9838130f1cdb74" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "4f01c1df1d203787560a67c1b295423174fd49934deb5e6789abd1e61dba9552" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" default))
 '(package-selected-packages
   '(yasnippet auctex lean-mode emms ess base16-theme helm expand-region modus-themes soothe-theme rainbow-delimiters nyan-mode malyon linum-relative key-chord gruvbox-theme fireplace evil-visual-mark-mode disable-mouse company aggressive-indent afternoon-theme))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ac437 IBM EGA 9x8" :slant normal :weight bold :height 140 :width normal)))))


