#!/bin/bash
cd src
swipl --quiet -s lab8Tigran.pl <<EOF
find_ID(1, X).

loadExample.

showAll(X).

find_ID(1, X).

update_AIRLINE_COMPANY("Aeroflot", 1).

find_ID(1, X).

find_TO("Tokyo", X).

delete_TO("Tokyo", X).

find_TO("Tokyo", X).

putNewAirline("+7(800)555-35-35", "John", "Smith", "john.smith@gmail.com", "01.04.1988").

showAll(X).

EOF