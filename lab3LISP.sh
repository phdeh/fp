#!/bin/bash
cd src
cat lab3.scm | clisp --quiet -m1024MB
