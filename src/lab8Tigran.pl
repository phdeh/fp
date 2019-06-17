
/*
4. Телефонный справочник организации.
             Airline
   id            | id
   модель самол. | airline_company
   из            | to
   в             | from
   время вылета  | arrival_time
   время прилета | departure_time
   ---------------------------
   ID            | ID
   Телефон       | AIRLINE_COMPANY
   Фамилия       | TO
   Имя           | FROM
   E-mail        | ARRIVAL_TIME
   Дата рождения | DEPARTURE_TIME
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

putNewAirline(AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME) :-
    getId(Id),
    assertz(varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME)).

listByIds([], []).
listByIds([Id|Other], Result) :-
    listByIds(Other, Result1),
    varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME),
    append([[Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME]], Result1, Result).

deleteByIds([], []).
deleteByIds([Id|Other], Result) :-
    deleteByIds(Other, Result1),
    varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME),
    retract(varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME)),
    append([[Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME]], Result1, Result).

%%% SHOW ALL

showAll(Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, _, _, _), Result1),
    listByIds(Result1, Result).
find_ID(_, []).

%%% FIND

find_ID(ID,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, _, _, _), Result1),
    listByIds(Result1, Result).
find_ID(_, []).

find_AIRLINE_COMPANY(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, By, _, _, _, _), Result1),
    listByIds(Result1, Result).
find_AIRLINE_COMPANY(_, []).

find_TO(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, By, _, _, _), Result1),
    listByIds(Result1, Result).
find_TO(_, []).

find_FROM(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, By, _, _), Result1),
    listByIds(Result1, Result).
find_FROM(_, []).

find_ARRIVAL_TIME(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, _, By, _), Result1),
    listByIds(Result1, Result).
find_ARRIVAL_TIME(_, []).

find_DEPARTURE_TIME(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, _, _, By), Result1),
    listByIds(Result1, Result).
find_DEPARTURE_TIME(_, []).

%%% DELETE

delete_ID(ID,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, _, _, _), Result1),
    deleteByIds(Result1, Result).
delete_ID(_, []).

delete_AIRLINE_COMPANY(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, By, _, _, _, _), Result1),
    deleteByIds(Result1, Result).
delete_AIRLINE_COMPANY(_, []).

delete_TO(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, By, _, _, _), Result1),
    deleteByIds(Result1, Result).
delete_TO(_, []).

delete_FROM(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, By, _, _), Result1),
    deleteByIds(Result1, Result).
delete_FROM(_, []).

delete_ARRIVAL_TIME(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, _, By, _), Result1),
    deleteByIds(Result1, Result).
delete_ARRIVAL_TIME(_, []).

delete_DEPARTURE_TIME(By,Result) :-
    clause(varAirline(_, _, _, _, _, _), _),
    findall(ID, varAirline(ID, _, _, _, _, By), Result1),
    deleteByIds(Result1, Result).
delete_DEPARTURE_TIME(_, []).

%%% UPDATE

update_AIRLINE_COMPANY(NewValue, Id) :-
    clause(varAirline(Id, _, _, _, _, _), _),
    varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME),
    retract(varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME)),
    assertz(varAirline(Id, NewValue, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME)).

update_TO(NewValue, Id) :-
    clause(varAirline(Id, _, _, _, _, _), _),
    varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME),
    retract(varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME)),
    assertz(varAirline(Id, AIRLINE_COMPANY, NewValue, FROM, ARRIVAL_TIME, DEPARTURE_TIME)).

update_FROM(NewValue, Id) :-
    clause(varAirline(Id, _, _, _, _, _), _),
    varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME),
    retract(varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME)),
    assertz(varAirline(Id, AIRLINE_COMPANY, TO, NewValue, ARRIVAL_TIME, DEPARTURE_TIME)).

update_ARRIVAL_TIME(NewValue, Id) :-
    clause(varAirline(Id, _, _, _, _, _), _),
    varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME),
    retract(varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME)),
    assertz(varAirline(Id, AIRLINE_COMPANY, TO, FROM, NewValue, DEPARTURE_TIME)).

update_DEPARTURE_TIME(NewValue, Id) :-
    clause(varAirline(Id, _, _, _, _, _), _),
    varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME),
    retract(varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, DEPARTURE_TIME)),
    assertz(varAirline(Id, AIRLINE_COMPANY, TO, FROM, ARRIVAL_TIME, NewValue)).

loadExample :-
    putNewAirline("Utair", "Tokyo", "Moscow", "12:10 GMT+9", "8:30 GMT+3"),
    putNewAirline("Aeroflot", "Saint-Petersburg", "Moscow", "12:10 GMT+3", "8:30 GMT+3"),
    putNewAirline("Russia", "Moscow", "Saint-Petersbug", "12:10 GMT+9", "8:30 GMT+3"),
    putNewAirline("Utair", "Samara", "Moscow", "12:10 GMT+9", "8:30 GMT+3").