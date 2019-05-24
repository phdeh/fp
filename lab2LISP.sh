#!/bin/bash
cd src
cat lab2.scm | clisp --quiet -m1024MB
