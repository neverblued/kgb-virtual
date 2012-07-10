;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:kgb-virtual)

(defclass secure-domain ()
  ((persons :initform nil :accessor domain-persons)
   (communities :initform nil :accessor domain-communities)
   (deputes :initform nil :accessor domain-deputes)
   (rights :initform nil :accessor domain-rights)
   (powers :initform nil :accessor domain-powers)
   (spreads :initform nil :accessor domain-spreads)))

(defvar secure-domain)

(defun clear-security-data ()
  (let ((it secure-domain))
    (setf (domain-persons it) nil
          (domain-communities it) nil
          (domain-deputes it) nil
          (domain-rights it) nil
          (domain-powers it) nil
          (domain-spreads it) nil))
  t)
