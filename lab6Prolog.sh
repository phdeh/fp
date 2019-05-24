#!/bin/bash
cd src
swipl --quiet -s lab6.pl <<EOF
belongs(b, [a, b, c], Result).

belongs(b, [a, d, c], Result).

nextIntersection([a, b, c, d, e], [c, d, e, f], Result).

nextIntersection([d, e], [c, d, e, f], Result).

nextIntersection([e], [c, d, e, f], Result).

intersections([a, b, c, d, e], [c, d, e, f], Result).

EOF