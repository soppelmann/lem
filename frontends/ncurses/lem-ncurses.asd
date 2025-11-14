;; Pre-configure CFFI library paths for BSD systems before loading cl-charms
;; BSD systems typically install libraries in /usr/local/lib
#+(or freebsd openbsd netbsd dragonfly)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew #P"/usr/local/lib/" cffi:*foreign-library-directories* :test #'equal))

(defsystem "lem-ncurses"
  :depends-on ("cffi"
               "cl-charms"
               "cl-setlocale"
               "lem/core"
               "lem/extensions")
  :serial t
  :components (#+pdcurses(:file "cl-charms-pdcurseswin32")
               (:file "config")
               (:file "term")
               (:file "clipboard")
               (:file "style")
               (:file "key")
               (:file "attribute")
               (:file "drawing-object")
               (:file "view")
               (:file "render")
               (:file "input")
               (:file "mainloop")
               (:file "ncurses")))
