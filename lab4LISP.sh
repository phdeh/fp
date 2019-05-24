#!/bin/bash
cd src
cat lab4.scm | clisp --quiet -m1024MB
