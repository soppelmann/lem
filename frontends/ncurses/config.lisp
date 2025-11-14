;; Pre-configure CFFI library paths for BSD systems before cl-charms loads ncurses
;; BSD systems have libraries in multiple locations:
;; - /lib (system libraries like libncursesw.so.9)
;; - /usr/lib (more system libraries)
;; - /usr/local/lib (ports/packages)
#+(or freebsd openbsd netbsd dragonfly)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew #P"/lib/" cffi:*foreign-library-directories* :test #'equal)
  (pushnew #P"/usr/lib/" cffi:*foreign-library-directories* :test #'equal)
  (pushnew #P"/usr/local/lib/" cffi:*foreign-library-directories* :test #'equal))

(defpackage :lem-ncurses/config
  (:use :cl
        :lem)
  (:export :escape-delay))
(in-package :lem-ncurses/config)

;; escape key delay setting
(define-editor-variable escape-delay 100)
