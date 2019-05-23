#!/bin/bash
#cat src/lab4.scm | clisp -m1024MB

cd src
swipl --quiet -s lab5.pl <<EOF
result(S1, S2, S3, S4, S5).

EOF