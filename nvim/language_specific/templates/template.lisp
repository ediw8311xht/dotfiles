;!/usr/bin/env -S sbcl --script

(load "~/.sbclrc")

; required packages
; (require :import-package-1) -- require here
; ..
; (require :import-package-n)
; (defpackage :my-package-name
;   (:use :required-package .. :required-package-n)
;   (:export #:main))


; (in-package :my-package-name)

(defun main ())

   
