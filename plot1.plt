#!/usr/bin/gnuplot

set xlabel ARG1
set ylabel ARG2
set title ARG4 font ARG5

p "/tmp/temp.dat" t ARG3 
pause mouse close