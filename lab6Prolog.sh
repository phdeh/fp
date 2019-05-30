#!/bin/bash
cd src
swipl --quiet -s lab6.pl <<EOFё
intersections([a, b, c, d, g], [c, d, e, f], Result).

EOF