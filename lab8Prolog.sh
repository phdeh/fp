#!/bin/bash
cd src
swipl --quiet -s lab8.pl <<EOF
find_ID(1, X).

loadExample.

showAll(X).

find_ID(1, X).

update_FIRST_NAME("Adam", 1).

find_ID(1, X).

find_FIRST_NAME("John", X).

delete_FIRST_NAME("John", X).

find_FIRST_NAME("John", X).

putNewPHONEBOOK("+7(800)555-35-35", "John", "Smith", "john.smith@gmail.com", "01.04.1988").

EOF