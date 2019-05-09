#!/bin/bash
echo "________ lab 1 __________"
echo "_________________________"
cat src/lab1.scm | clisp
echo "________ lab 2 __________"
echo "_________________________"
cat src/lab2.scm | clisp --quiet
echo "________ lab 3 __________"
echo "_________________________"
cat src/lab3.scm | clisp --quiet