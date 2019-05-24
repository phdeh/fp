backwardsMultiply(A, Result) :- backwardsMultiply(A, [], Result).

backwardsMultiply(A, B, Result) :-
    length(B, Length),
    length(A, Size),
    Length < Size / 2,
    nth0(Length, A, First),
    Number is Size - Length,
    nth1(Number, A, Last),
    Product is First * Last,
    append(B, [Product], B1),
    backwardsMultiply(A, B1, Result).

backwardsMultiply(A, B, Result) :-
    length(B, Length),
    length(A, Size),
    Length >= Size / 2,
    Result = B.