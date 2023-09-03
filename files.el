

;; fast travel
(defun files()
  (interactive)
  (find-file "/home/user1/.emacs.d/files.el"))
(defun goto ()
  (interactive)
  (find-file "/home/user1/.goto"))
(defun latex ()
  (interactive)
  (find-file "/home/user1/.emacs.d/latex.el"))

;; kajer jinis
(defun sage ()
  (interactive)
  (find-file "/mnt/localdisk/__tifr/sage/test.sage"))

;; sem1
(defun mfcs ()
  (interactive)
  (find-file "/mnt/localdisk/__tifr/sem1/mfcs/latex/homework-1.tex"))
(defun alc ()
  (interactive)
  (find-file "/mnt/localdisk/__tifr/sem1/algebra-computation/latex/homework-1.tex"))

