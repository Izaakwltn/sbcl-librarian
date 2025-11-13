(when (uiop:getenv "GITHUB_ACTIONS")
  (push :github-ci *features*))

(ql:quickload :libcalc)

(in-package #:sbcl-librarian/example/libcalc)

(sbcl-librarian:create-fasl-library-cmake-project "libcalc" calc "./libcalc/"
                                                  :preload-eval-expr "(format t \"hello from preload~%\")")

(sbcl-librarian:build-python-bindings calc "." :omit-init-call t)

(sbcl-librarian:build-bindings calc "." :initialize-lisp-args '("--dynamic-space-size"
                                                                (:env "HEAP_SIZE")))
