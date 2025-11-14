;; Load CFFI first so we can configure it for BSD systems
(ql:quickload :cffi)

;; Configure CFFI library paths for BSD systems before loading cl-charms
;; BSD systems install libraries in /usr/local/lib, not /usr/lib
#+(or freebsd openbsd netbsd dragonfly)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (pushnew #P"/usr/local/lib/" cffi:*foreign-library-directories* :test #'equal))

(ql:quickload :lem-ncurses)

(lem:init-at-build-time)

(sb-ext:save-lisp-and-die "lem"
                          :toplevel #'lem:main
                          :executable t)
