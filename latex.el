

(setq TeX-electric-sub-and-superscript t)
(setq TeX-electric-math '("$" . "$"))



(defun ltext ()
  (interactive)
  (insert "\\text{}")
  (evil-backward-char))

(defun lnewline ()
  (interactive)
  ;;(forward-char)
  (insert "\\\\\n"))

(defun lbackslash ()
  (interactive)
  (insert "\\")
  (evil-insert 1))

(defun labelnameref (string)
  "Insert \label{ARG} \index{\nameref{ARG}} at point"
  (interactive "sString for \\label and \\nameref: ")
  (insert "\\label{" string "} \\index{\\nameref{" string "}}"))


(defun lalign ()
  (interactive)
  (insert "\\begin{align*}\n\n")
  (insert "\\end{align*}")
  (evil-previous-line))



(evil-global-set-key 'normal (kbd "t") 'ltext)
(evil-global-set-key 'normal (kbd "z") 'lbackslash)
(evil-global-set-key 'normal (kbd "RET") 'lnewline)


(evil-global-set-key 'normal (kbd "C-c a") 'lalign)
(evil-global-set-key 'normal (kbd "C-c C-x") 'preview-buffer)
(evil-global-set-key 'normal (kbd "C-c C-c") 'preview-clearout-buffer)






