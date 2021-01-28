#!/usr/bin/gnuplot -persist


set terminal postscript eps font "Helvetica,24"
set output "gaussian-exp.eps"
set logscale xy
set xrange [1e-9:1e-1]
set yrange [4:25]
set xtics ("1e-9" 1e-9, "1e-8" 1e-8, "1e-7" 1e-7, "1e-6" 1e-6, "1e-5" 1e-5, "1e-4" 1e-4, "1e-3" 1e-3, "1e-2" 1e-2, "1e-1" 1e-1)
set ytics ("5" 5, "10" 10, "15" 15)

set label "Dimensionalidad" at 650,2.0 right
set label "Error (%)" at 0.92,85 left
set label "MNIST Gaussian" at 100,20 center font "HelveticaBold,30"

plot "gaussiana2-exp.out" u 1:2 t "Gaussian" w lp lw 2 lt 1 ps 2.0, 2.82 not w l lw 4 lt 2

