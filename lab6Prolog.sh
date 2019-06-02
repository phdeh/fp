#!/bin/bash
cd src
swipl --quiet -s lab6.pl <<EOF
intersections([a, b, c, d, g], [c, d, e, f], Result).

EOF