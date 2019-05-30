(defun DIJKSTRA (Net Init Term &optional (Tmp nil) (Fix (list (cons Init 0))))
       ((lambda (fix_label fix_value)
         (if (equal fix_label Term) fix_value
          (apply
            #'(lambda (newTmp newFix)
               (DIJKSTRA Net Init Term newTmp newFix))
            (TRANSFER_MIN
              (UPDATE_Tmp Tmp Fix (cdr (assoc fix_label Net)))
              Fix))))
        (caar Fix)
        (cdar Fix)))

#| |#

(defun UPDATE_Tmp (Tmp Fix Links)
       (if Links
        ((lambda (link_label link_value)
          (UPDATE_Tmp
            (if (assoc link_label Fix :test 'EQUAL) Tmp
             ((lambda (link mark)
               (if link
                (subst
                  (cons link_label (min mark (cdr link)))
                  link
                  Tmp
                  :test 'EQUAL)
                (cons (cons link_label mark) Tmp)))
              (assoc link_label Tmp :test 'EQUAL)
              (+ link_value (cdar Fix))))
            Fix
            (cdr Links)))
         (caar Links)
         (cdar Links))
        Tmp))

(defun TRANSFER_MIN (Tmp Fix)
       (if Tmp
        (if (cdr Tmp)
         (apply
           #'(lambda (elem newTmp newFix)
              (if (< (cdr elem) (cdar newFix))
               (list
                 (cons (car newFix) newTmp)
                 (cons elem (cdr newFix)))
               (list
                 (cons elem newTmp)
                 newFix)))
           (cons (car Tmp) (TRANSFER_MIN (cdr Tmp) Fix)))
         (list
           (cdr Tmp)
           (cons (car Tmp) Fix)))
        (list Tmp Fix)))

(setq Net
      '((1 (2 . 4)(3 . 7))
        (2 (1 . 4)(3 . 3)(6 . 1))
        (3 (1 . 7)(2 . 3)(4 . 2)(5 . 5))
        (4 (3 . 2)(5 . 1)(6 . 7))
        (5 (3 . 5)(4 . 1)(6 . 3))
        (6 (2 . 1)(4 . 7)(5 . 3))))

(DIJKSTRA  NET 1 4)
(DIJKSTRA  NET 1 5)
(DIJKSTRA  NET 1 6)

