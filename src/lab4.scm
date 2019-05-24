#|
4. Телефонный справочник организации.
             PHONEBOOK
   ---------------------------
   ID            | ID
   Телефон       | PHONE
   Фамилия       | FIRST_NAME
   Имя           | LAST_NAME
   E-mail        | E_MAIL
   Дата рождения | BIRTHDATE
|#

(DEFSTRUCT PHONEBOOK
           ID
           PHONE
           FIRST_NAME
           LAST_NAME
           E_MAIL
           BIRTHDATE
           )

(DEFUN PUT_PHONEBOOK (PHONE FIRST_NAME LAST_NAME E_MAIL BIRTHDATE)
       (SETQ PHONEBOOKS_FREE_ID (+ PHONEBOOKS_FREE_ID 1))
       (SETQ PHONEBOOKS (CONS
                          (FILL_PHONEBOOK (MAKE-PHONEBOOK) PHONEBOOKS_FREE_ID PHONE FIRST_NAME LAST_NAME E_MAIL BIRTHDATE)
                          PHONEBOOKS))
       )

(DEFUN FIND_NEXT_BY_CHECKER (CHECKER CURR_LIST)
       (COND
         ((NULL CURR_LIST) NIL)
         (T (COND
              ((FUNCALL CHECKER (CAR CURR_LIST)) (CONS (CAR CURR_LIST) (CONS (CDR CURR_LIST) NIL)))
              (T (FIND_NEXT_BY_CHECKER CHECKER (CDR CURR_LIST)))
              ))
         )
       )

(DEFUN FIND_ALL_BY_CHECKER (CHECKER CURR_LIST)
       (COND
         ((NULL (FIND_NEXT_BY_CHECKER CHECKER CURR_LIST)) NIL)
         (T (CONS (CAR (FIND_NEXT_BY_CHECKER CHECKER CURR_LIST)) (FIND_ALL_BY_CHECKER CHECKER (CADR (FIND_NEXT_BY_CHECKER CHECKER CURR_LIST)))))
         )
       )

(SETQ PHONEBOOKS NIL)

(SETQ PHONEBOOKS_FREE_ID 0)

(DEFUN FILL_PHONEBOOK (THIS_PHONEBOOK ID PHONE FIRST_NAME LAST_NAME E_MAIL BIRTHDATE)
       (SETF
         (PHONEBOOK-ID THIS_PHONEBOOK) ID
         (PHONEBOOK-PHONE THIS_PHONEBOOK) PHONE
         (PHONEBOOK-FIRST_NAME THIS_PHONEBOOK) FIRST_NAME
         (PHONEBOOK-LAST_NAME THIS_PHONEBOOK) LAST_NAME
         (PHONEBOOK-E_MAIL THIS_PHONEBOOK) E_MAIL
         (PHONEBOOK-BIRTHDATE THIS_PHONEBOOK) BIRTHDATE
         )
       THIS_PHONEBOOK
       )

; FIND

(DEFUN FIND_PHONEBOOK_BY_ID (ID)
       (FIND_ALL_BY_CHECKER (LAMBDA (IT) (EQUAL (PHONEBOOK-ID IT) ID)) PHONEBOOKS)
       )

(DEFUN FIND_PHONEBOOK_BY_PHONE (PHONE)
       (FIND_ALL_BY_CHECKER (LAMBDA (IT) (EQUAL (PHONEBOOK-PHONE IT) PHONE)) PHONEBOOKS)
       )

(DEFUN FIND_PHONEBOOK_BY_FIRST_NAME (FIRST_NAME)
       (FIND_ALL_BY_CHECKER (LAMBDA (IT) (EQUAL (PHONEBOOK-FIRST_NAME IT) FIRST_NAME)) PHONEBOOKS)
       )

(DEFUN FIND_PHONEBOOK_BY_LAST_NAME (LAST_NAME)
       (FIND_ALL_BY_CHECKER (LAMBDA (IT) (EQUAL (PHONEBOOK-LAST_NAME IT) LAST_NAME)) PHONEBOOKS)
       )

(DEFUN FIND_PHONEBOOK_BY_E_MAIL (E_MAIL)
       (FIND_ALL_BY_CHECKER (LAMBDA (IT) (EQUAL (PHONEBOOK-E_MAIL IT) E_MAIL)) PHONEBOOKS)
       )

(DEFUN FIND_PHONEBOOK_BY_BIRTHDATE (BIRTHDATE)
       (FIND_ALL_BY_CHECKER (LAMBDA (IT) (EQUAL (PHONEBOOK-BIRTHDATE IT) BIRTHDATE)) PHONEBOOKS)
       )

; REMOVE

(DEFUN REMOVE_PHONEBOOK_BY_ID (ID)
       (SETQ PHONEBOOKS (FIND_ALL_BY_CHECKER (LAMBDA (IT) (NOT (EQUAL (PHONEBOOK-ID IT) ID))) PHONEBOOKS))
       )

(DEFUN REMOVE_PHONEBOOK_BY_PHONE (PHONE)
       (SETQ PHONEBOOKS (FIND_ALL_BY_CHECKER (LAMBDA (IT) (NOT (EQUAL (PHONEBOOK-PHONE IT) PHONE))) PHONEBOOKS))
       )

(DEFUN REMOVE_PHONEBOOK_BY_FIRST_NAME (FIRST_NAME)
       (SETQ PHONEBOOKS (FIND_ALL_BY_CHECKER (LAMBDA (IT) (NOT (EQUAL (PHONEBOOK-FIRST_NAME IT) FIRST_NAME))) PHONEBOOKS))
       )

(DEFUN REMOVE_PHONEBOOK_BY_LAST_NAME (LAST_NAME)
       (SETQ PHONEBOOKS (FIND_ALL_BY_CHECKER (LAMBDA (IT) (NOT (EQUAL (PHONEBOOK-LAST_NAME IT) LAST_NAME))) LAST_NAME))
       )

(DEFUN REMOVE_PHONEBOOK_BY_E_MAIL (E_MAIL)
       (SETQ PHONEBOOKS (FIND_ALL_BY_CHECKER (LAMBDA (IT) (NOT (EQUAL (PHONEBOOK-E_MAIL IT) E_MAIL))) PHONEBOOKS))
       )

(DEFUN REMOVE_PHONEBOOK_BY_BIRTHDATE (BIRTHDATE)
       (SETQ PHONEBOOKS (FIND_ALL_BY_CHECKER (LAMBDA (IT) (NOT (EQUAL (PHONEBOOK-BIRTHDATE IT) BIRTHDATE))) PHONEBOOKS))
       )

; TEST

"-------------------"
"-------------------"
"-------------------"
"-------------------"

(PUT_PHONEBOOK "+7(800)555-35-35" "John" "Smith" "john.smith@gmail.com" "01.04.1988")

(PUT_PHONEBOOK "+7(999)999-99-99" "John" "Smith" "john.smith@gmail.com" "01.04.1988")

(PUT_PHONEBOOK "+7(800)333-35-35" "Jack" "Sparrow" "jsparrow@captain.org" "01.03.1937")

(PUT_PHONEBOOK "+7(800)111-11-11" "Alexey" "Smith" "a.siegfried@gmail.com" "13.03.1988")

"-------------------"
"-------------------"
"Searching John"

(FIND_PHONEBOOK_BY_FIRST_NAME "John")

"-------------------"
"-------------------"
"Searching Smith"

(FIND_PHONEBOOK_BY_LAST_NAME "Smith")

"-------------------"
"-------------------"
"Removing John"

(REMOVE_PHONEBOOK_BY_FIRST_NAME "John")

PHONEBOOKS