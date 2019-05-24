#!/bin/bash
cd src
cat lab1.scm | clisp --quiet -m1024MB
