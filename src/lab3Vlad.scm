#|
11. Нахождение минимально функционирующего сегмента сети.
Дана некоторая сеть (в виде графа). Каждой её дуге сопоставлена некоторая пропускная способность.
Также две вершины помечены как источник и приёмник данных. Необходимо определить, какой минимальный
фрагмент этой сети обладает той же пропускной способностью между источником и приёмником, что и исходная сеть.
|#

(setq chain (list
              (list 0 40 0 0 18)
              (list 40 0 22 6 15)
              (list 0 22 0 14 0)
              (list 0 6 14 0 20)
              (list 18 15 20 0)
              ))

(defun numbers (value)
       (cond
        ((eql value 1) (cons value nil))
        (T (cons value (numbers (- value 1))))
       )
       )

(defun isInList (a b)
       (cond
        ((null b) nil)
        ((eql a (car b)))
        (T (isInList a (cdr b)))
       )
       )

;(isInList 14 (nth 3 chain))
;(isInList 40 (nth 3 chain))

(defun notInList (a b)
       (cond
        ((or (null a) (null b)) nil)
        ((isInList (car a) b) (notInList (cdr a) b))
        (T (cons (car a) (notInList (cdr a) b)))
       )
       )

;(notInList (list 1 2 3) (list 3 4 5))

(defun comb (l a e)
       (cond
        ((and (null a) (not (null e)))
         (cons nil (comb (cons (car e) nil) (cdr e) (cdr e)))
        )
        ((and (not (null a)) (not (null e)))
         (cons l (comb (cons (car e) l) a (cdr e)))
        )
        ((and (not (null a)) (null e))
         (cons l (comb (cons (car a) nil) (cdr a) (cdr a)))
        )
        (T nil)
       )
       )

;(comb nil nil (numbers 5))
;(comb nil nil (list 1 4 8 8))

(defun zeroIfNil (value)
       (cond
        ((null value) 0)
        (T value)
       ))

(defun flow (a b volume a2)
       (cond
        ((and (not (null a)) (not (null b)))
         (flow (cdr a) b (+ volume (zeroIfNil (nth (car a) (nth (car b) chain)))) a2)
        )
        ((and (null a) (not (null b)))
         (flow a2 (cdr b) volume a2)
        )
        (T volume)
       )
       )

;(flow (list 1 2) (list 3 4 5) 0 (list 1 2))

(defun minPositive (a b)
       (cond
        ((and (< a b) (> a 0)) a)
        ((and (< b a) (> b 0)) b)
        (T a)
       )
       )

(defun minFlow (a min)
       (cond
        ((null a) min)
        (T (minFlow (cdr a) (minPositive min (flow (caar a) (cadar a) 0 (caar a)))))
       )
       )

(defun middle (from to)
       (notInList (numbers (length chain)) (cons to (cons from nil)))
       )

(defun b (from to a)
       (notInList (middle from to) a)
       )

(defun decorate (from to a)
       (cond
        ((null a) nil)
        ((null (car a))
         (cons
          (cons (cons from nil) (cons (cons to (middle from to)) nil)) (decorate from to (cdr a))
         )
        )
        (T
          (cons
           (cons (cons from (car a)) (cons (cons to (b from to (car a))) nil)) (decorate from to (cdr a))
          )
          )
       )
       )

(defun addAllCuts (from to a min)
       (princ (format nil "~D <=> ~D -- ~:D~%~%" min (flow (caar a) (cadar a) 0 (caar a)) a))
       (cond
        ((null a) nil)
        ((eql min (flow (caar a) (cadar a) 0 (caar a)))
         (cons (car a) (addAllCuts from to (cdr a) min))
        )
        (T
          (addAllCuts from to (cdr a) min)
          )
       )
       )

(defun allCuts (from to)
       (addAllCuts from to (decorate from to (comb nil nil (middle from to)))
                   (minFlow (decorate from to (comb nil nil (middle from to))) most-positive-fixnum))
       )

(allCuts 1 4)