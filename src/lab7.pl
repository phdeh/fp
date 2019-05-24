
%! manhattanDist

manhattanDist(X1, Y1, X2, Y2, Dist) :- Dist is abs(X1 - X2) + abs(Y1 - Y2).

%! badPosition

badPosition(X1, _, X2, _, true) :- X1 = X2.

badPosition(_, Y1, _, Y2, true) :- Y1 = Y2.

%badPosition(X1, Y1, X2, Y2, true) :- DX is abs(X1 - X2), DY is abs(Y1 - Y2), DX = DY.

badPosition(X1, Y1, X2, Y2, true) :- manhattanDist(X1, Y1, X2, Y2, 3), X1 - X2 \= 0, Y1 - Y2 \= 0.

badPosition(_, _, _, _, false).

%! checkPositions

checkPositions(_, _, [], true).

checkPositions(X1, Y1, [[X2, Y2]|_], false) :-
    badPosition(X1, Y1, X2, Y2, true).

checkPositions(X1, Y1, [[X2, Y2]|T], Result) :-
    not(badPosition(X1, Y1, X2, Y2, true)),
    checkPositions(X1, Y1, T, Result1),
    Result = Result1.

%! putQueen

putQueen(X, Y, Chain, Result) :-
    Chain = [],
    %format("EM ~w:~w -- ~w~n", [X, Y, Chain]),
    putQueen(0, 1, [[X, Y]], Result1),
    Result = Result1.

putQueen(_, Y, Chain, Result) :-
    Y = 8,
    %format("Y8 ~w:~w -- ~w~n", [X, Y, Chain]),
    Result = Chain.

putQueen(X, _, Chain, Result) :-
    X = 8,
    [[X1, Y1]|T] = Chain,
    X2 is X1 + 1,
    %format("X8 ~w:~w -- ~w~n", [X, Y, Chain]),
    putQueen(X2, Y1, T, Result1),
    Result = Result1.

putQueen(X, Y, Chain, Result) :-
    checkPositions(X, Y, Chain, true),
    append([[X, Y]], Chain, Chain1),
    Y1 is Y + 1,
    %format("CP ~w:~w -- ~w~n", [X, Y, Chain]),
    putQueen(0, Y1, Chain1, Result1),
    Result = Result1.

putQueen(X, Y, Chain, Result) :-
    not(checkPositions(X, Y, Chain, true)),
    X1 is X + 1,
    %format("EL ~w:~w -- ~w~n", [X, Y, Chain]),
    putQueen(X1, Y, Chain, Result1),
    Result = Result1.

%allQueens

allQueens(8).

allQueens(X) :-
    putQueen(X, 0, [], Current),
    writeln(Current),
    X1 is X + 1,
    allQueens(X1).

queens :- allQueens(0).