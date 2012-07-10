;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:kgb-virtual)

(defmethod depute-directly? (subject community)
  (iter (for it in (domain-deputes secure-domain))
        (when (and (subject= subject (subject it))
                   (subject= community (community it)))
          (leave it))))

(defmethod direct-communities (subject)
  (mapcar #'alias-community
          (iter (for it in (domain-deputes secure-domain))
                (when (equal (alias subject)
                             (subject it))
                  (collect (community it))))))

(defmethod begin-depute (subject community)
  (pushnew (make-instance 'depute
                          :subject subject
                          :community community)
           (domain-deputes secure-domain)
           :test #'depute=))

(defmethod end-depute (subject community)
  (setf (domain-deputes secure-domain)
        (delete (make-instance 'depute
                               :subject subject
                               :community community)
                (domain-deputes secure-domain)
                :test #'depute=)))

(defmethod check-depute (subject community)
  (find (make-instance 'depute
                       :subject subject
                       :community community)
        (domain-deputes secure-domain)
        :test #'depute=))
