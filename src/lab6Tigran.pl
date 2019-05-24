
appendIfNotEmpty(A, [], A).

appendIfNotEmpty(A, B, Result) :-
    append(A, B, Result1),
    Result = Result1.

joinChecksOdd([], [], _, []).

joinChecksOdd([], [B|B1], _, Result) :-
    joinChecksOdd([], B1, 0, Result1),
    appendIfNotEmpty([B], Result1, Result).

joinChecksOdd([A|A1], [], _, Result) :-
    joinChecksOdd(A1, [], 0, Result1),
    appendIfNotEmpty([A], Result1, Result).

joinChecksOdd([A|A1], B, 0, Result) :-
    joinChecksOdd(A1, B, 1, Result1),
    appendIfNotEmpty([A], Result1, Result).

joinChecksOdd(A, [B|B1], 1, Result) :-
    joinChecksOdd(A, B1, 0, Result1),
    appendIfNotEmpty([B], Result1, Result).

joinChecks(A, B, Result) :-
    joinChecksOdd(A, B, 0, Result).