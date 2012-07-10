;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(defpackage #:kgb-virtual
  (:use #:cl #:kgb #:iterate)

  (:export
                                        ; domain
   #:secure-domain
   #:domain-persons
   #:domain-communities
   #:domain-deputes
   #:domain-rights
   #:domain-powers
   #:domain-spreads
   #:clear-security-data
                                        ; authenticate
   #:with-security
                                        ; .
   ))
