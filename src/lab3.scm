#|
4. Задача о 8-ми ферзях 2.
  Необходимо расставить на шахматной доске фигуры, которые сочетают в себе одновременно
  свойства ладьи и коня и определить, какое наибольшее число таких фигур можно расставить
  на доске 8х8 (ладья бьёт любую фигуру, находящуюся с ней на одной вертикали или горизонтали,
  конь бьёт любую фигуру находящуюся через две клетки по горизонтали или вертикали и
  одну клетку по диагонали)
|#

(DEFUN BAD_POSITION (X1 Y1 X2 Y2)
       (COND
         ((= X1 X2) T)
         ((= Y1 Y2) T)
         ;((= (ABS (- X1 X2)) (ABS (- Y1 Y2))) T)
         ((AND (AND (= (+ (ABS (- X1 X2)) (ABS (- Y1 Y2))) 3) (/= (- X1 X2) 0)) (/= (- Y1 Y2) 0)) T)
         (T NIL)
         )
       )

(DEFUN CHECK_POSITIONS (X Y CHAIN)
       (COND
         ((NULL CHAIN) T)
         ((BAD_POSITION X Y (CAAR CHAIN) (CADAR CHAIN)) NIL)
         (T (CHECK_POSITIONS X Y (CDR CHAIN)))
         )
       )

(DEFUN PUT_QUEEN (X Y CHAIN)
       (COND
         ((NULL CHAIN) (PUT_QUEEN 0 1 (CONS (CONS X (CONS Y NIL)) NIL)))
         ((EQL Y 8) CHAIN)
         ((EQL X 8) (PUT_QUEEN (+ (CAAR CHAIN) 1) (CADAR CHAIN) (CDR CHAIN)))
         ((CHECK_POSITIONS X Y CHAIN) (PUT_QUEEN 0 (+ Y 1) (CONS (CONS X (CONS Y NIL)) CHAIN)))
         (T (PUT_QUEEN (+ X 1) Y CHAIN))
         )
       )

(DEFUN ALL_QUEENS (X)
       (COND
         ((<= X 8) (CONS (PUT_QUEEN X 0 NIL) (ALL_QUEENS (+ X 1))))
         (T NIL)
         )
       )

(DEFUN QUEENS () (ALL_QUEENS 0))

(QUEENS)