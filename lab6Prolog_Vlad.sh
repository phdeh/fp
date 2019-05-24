#!/bin/bash
cd src
swipl --quiet -s lab6Vlad.pl <<EOF
backwardsMultiply([1, 2, 3, 4, 5, 6], Result).

EOF