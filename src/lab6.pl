
/*
    Разработать функцию, находящую теоретико-множественное пересечение двух
    списков.
    Например:
    Вход: (1 2 3 4 5), (4 5 6 7). Выход: (4 5).
*/

%! belongs

belongs(Element, [H|_], true) :-
    Element = H.

belongs(Element, [H|[]], false) :-
    not(Element = H).

belongs(Element, [_|T], Result) :-
    belongs(Element, T, Result1),
    Result = Result1.

%! nextIntersection

nextIntersection([], _, [[], []]).

nextIntersection([H|T], Set2, [H, T]) :-
    belongs(H, Set2, true).

nextIntersection([H|T], Set2, Result) :-
    belongs(H, Set2, false),
    nextIntersection(T, Set2, Result1),
    Result = Result1.

%! intersections

intersections(Set1, Set2, Result) :-
    nextIntersection(Set1, Set2, NextInt),
    [H|T] = NextInt,
    [H2|_] = T,
    not(H = []),
    intersections(H2, Set2, Result1),
    append([H], Result1, Result).

intersections(_, _, []).