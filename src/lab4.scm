#|
4. Телефонный справочник организации.
             PHONEBOOK
   ---------------------------
   Телефон       | PHONE
   Фамилия       | FIRST_NAME
   Имя           | SECOND_NAME
   Мыло          | E_MAIL
   Дата рождения | BIRTHDATE
|#

(DEFSTRUCT PHONEBOOK
           PHONE
           FIRST_NAME
           SECOND_NAME
           E_MAIL
           BIRTHDATE
           )

(SETQ PHONEBOOKS NIL)

(DEFUN FILL_PHONEBOOK (THIS_PHONEBOOK PHONE FIRST_NAME SECOND_NAME E_MAIL BIRTHDATE)
       (SETF
         (PHONEBOOK-PHONE THIS_PHONEBOOK) PHONE
         (PHONEBOOK-FIRST_NAME THIS_PHONEBOOK) FIRST_NAME
         (PHONEBOOK-SECOND_NAME THIS_PHONEBOOK) SECOND_NAME
         (PHONEBOOK-E_MAIL THIS_PHONEBOOK) E_MAIL
         (PHONEBOOK-BIRTHDATE THIS_PHONEBOOK) BIRTHDATE
         )
       THIS_PHONEBOOK
       )

(DEFUN PUT_PHONEBOOK (PHONE FIRST_NAME SECOND_NAME E_MAIL BIRTHDATE)
       (COND
         ((EQL (CAR (FIND_PHONEBOOK_BY_PHONE PHONE)) NIL) NIL)
         (T (REMOVE_PHONEBOOK_BY_PHONE PHONE))
         )
       (SETQ PHONEBOOKS (CONS
                          (FILL_PHONEBOOK (MAKE-PHONEBOOK) PHONE FIRST_NAME SECOND_NAME E_MAIL BIRTHDATE)
                          PHONEBOOKS))
       )

(DEFUN FIND_NEXT_BY (CHECKER CURR_LIST)
       (COND
         ((EQL (CAR CURR_LIST) NIL) NIL)
         ((FUNCALL CHECKER (CAR CURR_LIST)) (CONS (CAR CURR_LIST) (CONS (CDR CURR_LIST) NIL)))
         (T (FIND_NEXT_BY CHECKER (CDR CURR_LIST)))
         )
       )

(DEFUN FIND_ALL_BY (CHECKER CURR_LIST)
       (COND
         ((NOT (EQL (CAR (FIND_NEXT_BY CHECKER CURR_LIST)) NIL))
          (CONS (CAR (FIND_NEXT_BY CHECKER CURR_LIST))
                (FIND_ALL_BY CHECKER (CDR (FIND_NEXT_BY CHECKER CURR_LIST))))
         )
         )
       )

(DEFUN FIND_PHONEBOOK_BY (CHECKER)
       (FIND_ALL_BY CHECKER PHONEBOOKS)
       )

(DEFUN FIND_PHONEBOOK_BY_PHONE (PHONE)
       (FIND_PHONEBOOK_BY (FUNCTION (LAMBDA (IT) (EQL (PHONEBOOK-PHONE IT) PHONE))))
       )

(DEFUN REMOVE_PHONEBOOK_BY (CHECKER)
       (SETQ PHONEBOOKS (FIND_ALL_BY (FUNCTION (LAMBDA (IT) (NOT (FUNCALL CHECKER IT)))) PHONEBOOKS))
       )

(DEFUN REMOVE_PHONEBOOK_BY_PHONE (PHONE)
       (REMOVE_PHONEBOOK_BY (FUNCTION (LAMBDA (IT) (EQL (PHONEBOOK-PHONE IT) PHONE))))
       )

(FIND_PHONEBOOK_BY_PHONE 1)

(PUT_PHONEBOOK 1 2 3 4 5)

(PUT_PHONEBOOK 2 6 7 8 9)

(PUT_PHONEBOOK 3 10 11 12 13)

(FIND_PHONEBOOK_BY_PHONE 2)