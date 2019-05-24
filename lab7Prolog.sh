#!/bin/bash
cd src
swipl --quiet -s lab7.pl <<EOF
%badPosition(1, 1, 2, 1, X).

%badPosition(1, 1, 2, 2, X).

%badPosition(1, 1, 2, 3, X).

%checkPositions(1, 1, [], X).

%checkPositions(1, 1, [[2, 2]], X).

%checkPositions(1, 1, [[2, 1], [2, 2]], X).

%checkPositions(1, 1, [[2, 1], [2, 3]], X).

%checkPositions(1, 1, [[2, 2], [3, 3], [4, 4]], X).

queens.

EOF