#!/bin/bash
cd src
swipl --quiet -s lab6Tigran.pl <<EOF
joinChecks([1, 2, 3, 4, 5], [a, b, c], X).

EOF