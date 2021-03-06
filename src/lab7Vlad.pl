/*
11. Нахождение минимально функционирующего сегмента сети.
Дана некоторая сеть (в виде графа). Каждой её дуге сопоставлена некоторая пропускная способность.
Также две вершины помечены как источник и приёмник данных. Необходимо определить, какой минимальный
фрагмент этой сети обладает той же пропускной способностью между источником и приёмником, что и исходная сеть.
*/

chain(
[[0, 40, 0, 0, 18],
[40, 0, 22, 6, 15],
[0, 22, 0, 14, 0],
[0, 6, 14, 0, 20],
[18, 15, 0, 20, 0]
]).

% seqNumbers

seqNumbers(0, []).

seqNumbers(N, List) :-
    N1 is N - 1,
    seqNumbers(N1, Sublist),
    append(Sublist, [N], List).

% sublist

% comb
