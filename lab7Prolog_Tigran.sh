#!/bin/bash
cd src
swipl --quiet -s lab7Tigran.pl <<EOF
minWays(prospekt_veteranov, proletarskaya, X).

EOF