;; (c) Дмитрий Пинский <demetrius@neverblued.info>
;; Допускаю использование и распространение согласно
;; LLGPL -> http://opensource.franz.com/preamble.html

(in-package #:kgb)

(macrolet ((domain-data (name)
             `(,(intern (join "DOMAIN-" name) '#:kgb-virtual)
                kgb-virtual:secure-domain)))

  (defmethod alias-person (alias)
    (find alias (domain-data persons) :key #'alias :test #'equal))

  (defmethod seal-person (seal)
    (find seal (domain-data persons) :key #'seal :test #'equal))

  (defmethod alias-community (alias)
    (find alias (domain-data communities) :key #'alias :test #'equal))

  (defmethod communities (subject)
    (let (communities)
      (flet ((add (it)
               (pushnew it communities :test #'equal)))
        (iter (for depute in (domain-data deputes))
              (awith (community depute)
                (when (equal subject (subject depute))
                  (add it)
                  (iter (for deputed in (communities it))
                        (add deputed))))))
      communities)))
