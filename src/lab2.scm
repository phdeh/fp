#|
    Разработать функцию, находящую теоретико-множественное пересечение двух
    списков.
    Например:
    Вход: (1 2 3 4 5), (4 5 6 7). Выход: (4 5).
|#

(SETQ SET1 '(1 2 3 4 5 8))
(SETQ SET2 '(4 5 6 7))

(DEFUN BELONGS (ELEMENT SET2)
       (COND
         ((EQL ELEMENT (CAR SET2)) T)
         ((EQL (CDR SET2) NIL) NIL)
         (T (BELONGS ELEMENT (CDR SET2)))
         )
       )

(DEFUN NEXT_INTERSECTION (SET1 SET2)
       (COND
         ((EQL (CDR SET1) NIL)
          (CONS NIL (CONS NIL NIL))
         )
         ((BELONGS (CAR SET1) SET2)
          (CONS (CAR SET1) (CONS (CDR SET1) NIL))
         )
         (T
           (NEXT_INTERSECTION (CDR SET1) SET2)
           )
         )
       )

(DEFUN INTERSECTIONS (SET1 SET2)
       (COND
         ((NOT (EQL (CAR (NEXT_INTERSECTION SET1 SET2)) NIL))
          (CONS
            (CAR (NEXT_INTERSECTION SET1 SET2))
            (INTERSECTIONS (CADR (NEXT_INTERSECTION SET1 SET2)) SET2)
            )
         )
         (T NIL)
         )
       )

(INTERSECTIONS SET1 SET2)