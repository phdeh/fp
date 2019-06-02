
/*
4. Телефонный справочник организации.
             PHONEBOOK
   ---------------------------
   ID            | ID
   Телефон       | PHONE
   Фамилия       | FIRST_NAME
   Имя           | LAST_NAME
   E-mail        | E_MAIL
   Дата рождения | BIRTHDATE
*/

getId(Id) :-
    not(clause(freeId(_), _)),
    asserta(freeId(1)),
    Id = 1.

getId(Id) :-
    freeId(Id1),
    retract(freeId(Id1)),
    Id2 is Id1 + 1,
    asserta(freeId(Id2)),
    Id = Id2.

putNewPHONEBOOK(PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE) :-
    getId(Id),
    assertz(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE)).

loadExample :-
    putNewPHONEBOOK("+7(800)555-35-35", "John", "Smith", "john.smith@gmail.com", "01.04.1988"),
    putNewPHONEBOOK("+7(999)999-99-99", "John", "Smith", "john.smith@gmail.com", "01.04.1988"),
    putNewPHONEBOOK("+7(800)333-35-35", "Jack", "Sparrow", "jsparrow@captain.org", "01.03.1937"),
    putNewPHONEBOOK("+7(800)111-11-11", "Alexey", "Smith", "a.siegfried@gmail.com", "13.03.1988").

listByIds([], []).
listByIds([Id|Other], Result) :-
    listByIds(Other, Result1),
    varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE),
    append([[Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE]], Result1, Result).

deleteByIds([], []).
deleteByIds([Id|Other], Result) :-
    deleteByIds(Other, Result1),
    varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE),
    retract(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE)),
    append([[Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE]], Result1, Result).

%%% SHOW ALL

showAll(Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, _, _, _), Result1),
    listByIds(Result1, Result).
find_ID(_, []).

%%% FIND

find_ID(ID,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, _, _, _), Result1),
    listByIds(Result1, Result).
find_ID(_, []).

find_PHONE(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, By, _, _, _, _), Result1),
    listByIds(Result1, Result).
find_PHONE(_, []).

find_FIRST_NAME(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, By, _, _, _), Result1),
    listByIds(Result1, Result).
find_FIRST_NAME(_, []).

find_LAST_NAME(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, By, _, _), Result1),
    listByIds(Result1, Result).
find_LAST_NAME(_, []).

find_E_MAIL(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, _, By, _), Result1),
    listByIds(Result1, Result).
find_E_MAIL(_, []).

find_BIRTHDATE(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, _, _, By), Result1),
    listByIds(Result1, Result).
find_BIRTHDATE(_, []).

%%% DELETE

delete_ID(ID,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, _, _, _), Result1),
    deleteByIds(Result1, Result).
delete_ID(_, []).

delete_PHONE(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, By, _, _, _, _), Result1),
    deleteByIds(Result1, Result).
delete_PHONE(_, []).

delete_FIRST_NAME(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, By, _, _, _), Result1),
    deleteByIds(Result1, Result).
delete_FIRST_NAME(_, []).

delete_LAST_NAME(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, By, _, _), Result1),
    deleteByIds(Result1, Result).
delete_LAST_NAME(_, []).

delete_E_MAIL(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, _, By, _), Result1),
    deleteByIds(Result1, Result).
delete_E_MAIL(_, []).

delete_BIRTHDATE(By,Result) :-
    clause(varPHONEBOOK(_, _, _, _, _, _), _),
    findall(ID, varPHONEBOOK(ID, _, _, _, _, By), Result1),
    deleteByIds(Result1, Result).
delete_BIRTHDATE(_, []).

%%% UPDATE

update_PHONE(NewValue, Id) :-
    clause(varPHONEBOOK(Id, _, _, _, _, _), _),
    varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE),
    retract(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE)),
    assertz(varPHONEBOOK(Id, NewValue, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE)).

update_FIRST_NAME(NewValue, Id) :-
    clause(varPHONEBOOK(Id, _, _, _, _, _), _),
    varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE),
    retract(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE)),
    assertz(varPHONEBOOK(Id, PHONE, NewValue, LAST_NAME, E_MAIL, BIRTHDATE)).

update_LAST_NAME(NewValue, Id) :-
    clause(varPHONEBOOK(Id, _, _, _, _, _), _),
    varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE),
    retract(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE)),
    assertz(varPHONEBOOK(Id, PHONE, FIRST_NAME, NewValue, E_MAIL, BIRTHDATE)).

update_E_MAIL(NewValue, Id) :-
    clause(varPHONEBOOK(Id, _, _, _, _, _), _),
    varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE),
    retract(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE)),
    assertz(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, NewValue, BIRTHDATE)).

update_BIRTHDATE(NewValue, Id) :-
    clause(varPHONEBOOK(Id, _, _, _, _, _), _),
    varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE),
    retract(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, BIRTHDATE)),
    assertz(varPHONEBOOK(Id, PHONE, FIRST_NAME, LAST_NAME, E_MAIL, NewValue)).
