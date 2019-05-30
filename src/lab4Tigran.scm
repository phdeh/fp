#|
4. телефонный справочник организации.
             airline
   ---------------------------
   id            | id
   модель самол. | airline_company
   из            | to
   в             | from
   время вылета  | arrival_time
   время прилета | departure_time
|#

(defstruct airline
           id
           airline_company
           to
           from
           arrival_time
           departure_time
           )

(defun put_airline (airline_company to from arrival_time departure_time)
       (setq airlines_free_id (+ airlines_free_id 1))
       (setq airlines (cons
                         (fill_airline (make-airline) airlines_free_id airline_company to from arrival_time departure_time)
                         airlines))
       )

(defun find_next_by_checker (checker curr_list)
       (cond
        ((null curr_list) nil)
        (t (cond
            ((funcall checker (car curr_list)) (cons (car curr_list) (cons (cdr curr_list) nil)))
            (t (find_next_by_checker checker (cdr curr_list)))
           ))
       )
       )

(defun find_all_by_checker (checker curr_list)
       (cond
        ((null (find_next_by_checker checker curr_list)) nil)
        (t (cons (car (find_next_by_checker checker curr_list)) (find_all_by_checker checker (cadr (find_next_by_checker checker curr_list)))))
       )
       )

(setq airlines nil)

(setq airlines_free_id 0)

(defun fill_airline (this_airline id airline_company to from arrival_time departure_time)
       (setf
         (airline-id this_airline) id
         (airline-airline_company this_airline) airline_company
         (airline-to this_airline) to
         (airline-from this_airline) from
         (airline-arrival_time this_airline) arrival_time
         (airline-departure_time this_airline) departure_time
         )
       this_airline
       )

(defun update_airline_by (id filler)
       (cond
        ((null (find_airline_by_id id)) nil)
        (T (funcall filler (find_airline_by_id id)))
       )
       )

; find

(defun find_airline_by_id (id)
       (find_all_by_checker (lambda (it) (equal (airline-id it) id)) airlines)
       )

(defun find_airline_by_airline_company (airline_company)
       (find_all_by_checker (lambda (it) (equal (airline-airline_company it) airline_company)) airlines)
       )

(defun find_airline_by_to (to)
       (find_all_by_checker (lambda (it) (equal (airline-to it) to)) airlines)
       )

(defun find_airline_by_from (from)
       (find_all_by_checker (lambda (it) (equal (airline-from it) from)) airlines)
       )

(defun find_airline_by_arrival_time (arrival_time)
       (find_all_by_checker (lambda (it) (equal (airline-arrival_time it) arrival_time)) airlines)
       )

(defun find_airline_by_departure_time (departure_time)
       (find_all_by_checker (lambda (it) (equal (airline-departure_time it) departure_time)) airlines)
       )

; remove

(defun remove_airline_by_id (id)
       (setq airlines (find_all_by_checker (lambda (it) (not (equal (airline-id it) id))) airlines))
       )

(defun remove_airline_by_airline_company (airline_company)
       (setq airlines (find_all_by_checker (lambda (it) (not (equal (airline-airline_company it) airline_company))) airlines))
       )

(defun remove_airline_by_to (to)
       (setq airlines (find_all_by_checker (lambda (it) (not (equal (airline-to it) to))) airlines))
       )

(defun remove_airline_by_from (from)
       (setq airlines (find_all_by_checker (lambda (it) (not (equal (airline-from it) from))) from))
       )

(defun remove_airline_by_arrival_time (arrival_time)
       (setq airlines (find_all_by_checker (lambda (it) (not (equal (airline-arrival_time it) arrival_time))) airlines))
       )

(defun remove_airline_by_departure_time (departure_time)
       (setq airlines (find_all_by_checker (lambda (it) (not (equal (airline-departure_time it) departure_time))) airlines))
       )

; update

(defun update_airline_field_airline_company_by_id (airline_company id)
       (update_airline_by id (lambda (it) (setf (airline-airline_company (car it)) airline_company)))
       )

(defun update_airline_field_to_by_id (to id)
       (update_airline_by id (lambda (it) (setf (airline-to (car it)) to)))
       )

(defun update_airline_field_from_by_id (from id)
       (update_airline_by id (lambda (it) (setf (airline-from (car it)) from)))
       )

(defun update_airline_field_arrival_time_by_id (arrival_time id)
       (update_airline_by id (lambda (it) (setf (airline-arrival_time (car it)) arrival_time)))
       )

(defun update_airline_field_departure_time_by_id (departure_time id)
       (update_airline_by id (lambda (it) (setf (airline-departure_time (car it)) departure_time)))
       )



; test

"-------------------"
"-------------------"
"-------------------"
"-------------------"

(put_airline "Utair" "Tokiyo" "Moscow" "12:10 GMT+9" "8:30 GMT+3")

(put_airline "Aeroflot" "Saint-Petersburg" "Moscow" "12:10 GMT+3" "8:30 GMT+3")

(put_airline "Russia" "Moscow" "Saint-Petersbug" "12:10 GMT+9" "8:30 GMT+3")

(put_airline "Utair" "Samara" "Moscow" "12:10 GMT+9" "8:30 GMT+3")

"-------------------"
"-------------------"
"searching Moscow"

(find_airline_by_to "Moscow")

"-------------------"
"-------------------"
"searching Moscow"

(find_airline_by_from "Moscow")

"-------------------"
"-------------------"
"removing Moscow"

(remove_airline_by_to "Moscow")

(update_airline_field_airline_company_by_id "Aeroflot" 4)

airlines