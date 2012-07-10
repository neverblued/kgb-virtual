;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:kgb-virtual)

(defmethod authentication-possible? ()
  (typep secure-domain 'secure-domain))

(defmacro with-security (domain &body body)
  `(let ((secure-domain ,domain))
     (declare (type secure-domain secure-domain))
     ,@body))

(defmethod log-authentication (person)
  nil)

(defmethod introduce-guest :around (request)
  (let ((it (call-next-method)))
    (pushnew it (domain-persons secure-domain)
             :test #'equal :key #'kgb::seal)
    it))
