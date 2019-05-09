#|
4. Дан список ((K L) (M N) A B C (D (E))) получить:
    4.1 элемент K
    4.2 элемент M
    4.3 элемент E
    4.4 список (K D N)
    4.5 список (A D K)
    4.6 список (D (M N) A)
|#

(SETQ LST '((K L) (M N) A B C (D (E))))

(CAAR LST) ; K

(CAADR LST) ; M

(CAR (CADADR (CDDDDR LST))) ; E

(CONS
  (CAAR LST)
  (CONS
    (CAADR (CDDDDR LST))
    (CONS
      (CADADR LST)
      NIL
      )
    )
  ) ; (K D N)

(CONS
  (CADDR LST)
  (CONS
    (CAADR (CDDDDR LST))
    (CONS
      (CAAR LST)
      NIL
      )
    )
  ) ; (A D K)

(CONS
  (CAADR (CDDDDR LST))
  (CONS
    (CONS
      (CAADR LST)
      (CONS
        (CADADR LST)
        NIL
        )
      )
    (CONS
      (CADDR LST)
      NIL
      )
    )
  ) ; (D (M N) A)

#|
(CADDR LST); A

(CAADR(CDDDDR LST)); D

(CADADR LST); N
|#