#!/bin/bash
cd src
swipl --quiet -s lab6.pl <<EOF
belongs(b, [a, b, c], X).

belongs(b, [a, d, c], X).

nextIntersection([a, b, c, d, e], [c, d, e, f], X).

nextIntersection([d, e], [c, d, e, f], X).

nextIntersection([e], [c, d, e, f], X).

intersections([a, b, c, d, e], [c, d, e, f], X).

EOF