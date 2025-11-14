;; Configure CFFI library paths for BSD systems before loading cl-charms
;; BSD systems have libraries in multiple locations:
;; - /lib (system libraries like libncursesw.so.9)
;; - /usr/lib (more system libraries)
;; - /usr/local/lib (ports/packages)
#+(or freebsd openbsd netbsd dragonfly)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew #P"/lib/" cffi:*foreign-library-directories* :test #'equal)
  (pushnew #P"/usr/lib/" cffi:*foreign-library-directories* :test #'equal)
  (pushnew #P"/usr/local/lib/" cffi:*foreign-library-directories* :test #'equal))

(ql:quickload :lem-ncurses)

(lem:init-at-build-time)


(setf lem:*splash-function* #'lem/legit::legit-status)

(sb-ext:save-lisp-and-die "legit"
                          :toplevel #'lem:main
                          :executable t)
