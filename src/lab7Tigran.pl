
% 1. Дана схема метрополитена, найти кратчайший путь между станциями. Схема метрополитена задаётся с помощью матрицы
% смежности или матрицы инциденций. Каждому перегону соответствует некоторый вес (длительность перегона). Каждой
% пересадке также соответствует некоторый вес (длительность пересадки). Необходимо для заданной преподавателем схемы
% вывести самый короткий путь или все такие пути, если их несколько.

%%%%

station(prospekt_veteranov).
station(tekhnologichesky_institut_1).
station(ploschad_vosstaniya).
station(devyatkino).

station(tekhnologichesky_institut_2).
station(nevsky_prospekt).
station(parnas).

station(mayakovskaya).
station(proletarskaya).
station(gostiny_dvor).

%%%%

distance(tekhnologichesky_institut_1, ploschad_vosstaniya, 2).

%%%%

distance(prospekt_veteranov, tekhnologichesky_institut_1, 1).
distance(ploschad_vosstaniya, devyatkino, 1).
distance(ploschad_vosstaniya, mayakovskaya, 1).

distance(tekhnologichesky_institut_2, nevsky_prospekt, 1).
distance(nevsky_prospekt, parnas, 1).

distance(mayakovskaya, proletarskaya, 1).
distance(proletarskaya, gostiny_dvor, 1).

distance(tekhnologichesky_institut_1, tekhnologichesky_institut_2, 1).
distance(nevsky_prospekt, gostiny_dvor, 1).

%%%%

distanceBetween(A, B, Result) :- distance(A, B, Result).
distanceBetween(A, B, Result) :- distance(B, A, Result).

neighbors(A, Result) :-
    findall(X, distance(A, X, _), Xs),
    findall(Y, distance(Y, A, _), Ys),
    append(Xs, Ys, Result).

neighbors(A, Result) :-
    findall(Y, distance(Y, A, _), Result).

neighbors(A, Result) :-
    findall(X, distance(A, X, _), Result).



appendIfNotEmpty(A, [], A).
appendIfNotEmpty(A, B, Result) :-
    append(A, B, Result1),
    Result = Result1.

%%%%

ways(From, To, Result) :- ways(From, To, From, [], [], [], Result).

ways(_, To, To, _, Visited, ActualResult, Result) :-
    append(Visited, [To], Visited1),
    append(ActualResult, [Visited1], Result).

ways(From, To, Current, Potential, Visited, ActualResult, Result) :-
    Potential = [],
    neighbors(Current, Neighbors),
    not(Neighbors = []),
    append(Visited, [Current], Visited1),
    not(member(Current, Visited)),
    ways(From, To, [], Neighbors, Visited1, ActualResult, Result).

ways(From, To, Current, Potential, Visited, ActualResult, Result) :-
    Current = [],
    not(Potential = []),
    [PotentialH|PotentialT] = Potential,
    ways(From, To, PotentialH, [], Visited, ActualResult, Result1),
    ways(From, To, [], PotentialT, Visited, Result1, Result).

ways(_, _, _, _, _, ActualResult, Result) :- Result = ActualResult.

lengthOfWay([_], 0).

lengthOfWay([], 0).

lengthOfWay([A, B|C], Result) :-
    distanceBetween(A, B, Result1),
    append([B], C, C1),
    lengthOfWay(C1, Result2),
    Result is Result1 + Result2.

minWayLength([], Min, Min).

minWayLength([Way|Other], Min, Result) :-
    lengthOfWay(Way, Length),
    Length >= Min,
    minWayLength(Other, Min, Result).

minWayLength([Way|Other], Min, Result) :-
    lengthOfWay(Way, Length),
    Length < Min,
    minWayLength(Other, Length, Result).

waysWithLength([], _, Left, Left).

waysWithLength([Way|Other], Min, Left, Result) :-
    lengthOfWay(Way, Length),
    Length = Min,
    append(Left, [Way], Left1),
    waysWithLength(Other, Min, Left1, Result).

waysWithLength([Way|Other], Min, Left, Result) :-
    lengthOfWay(Way, Length),
    not(Length = Min),
    waysWithLength(Other, Min, Left, Result).

minWays(From, To, Result) :-
    ways(From, To, Ways),
    minWayLength(Ways, inf, Min),
    waysWithLength(Ways, Min, [], Result).