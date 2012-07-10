;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(defpackage #:kgb-virtual-system
  (:use #:common-lisp #:asdf))

(in-package #:kgb-virtual-system)

(defsystem #:kgb-virtual
  :description "Security framework virtual implementation"
  :version "0.1"
  :author "Дмитрий Пинский <demetrius@neverblued.info>"
  :depends-on (#:kgb #:iterate)
  :serial t
  :components ((:file "package")
               (:file "domain")
               (:file "depute")
               (:file "algebra")
               (:file "authenticate")))
