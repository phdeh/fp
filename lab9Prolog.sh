#!/bin/bash
cd src
swipl --quiet -s lab9.pl <<EOF
предложение(Подлежащее1,Сказуемое1,[иван,упал],[]).

предложение(Подлежащее1,Сказуемое1,Союз,Подлежащее2,Сказуемое2,[иван,упал,и,дарья,спала],[]).

предложение(Подлежащее1,Сказуемое1,Союз,Подлежащее2,Сказуемое2,[светлана,пропали,да,иваны,спали],[]).

предложение(Подлежащее1,Сказуемое1,Союз,Подлежащее2,Сказуемое2,[светлана,пропала,да,иваны,спали],[]).

EOF