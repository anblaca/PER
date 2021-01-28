#!/usr/bin/gnuplot -persist


set terminal postscript eps font "Helvetica,24"
set output "pca+knn-exp.eps"
set logscale xy
set xrange [1e-10:1e-1]
set yrange [15:40]
set xtics ("1e-10" 1e-10, "1e-9" 1e-9, "1e-8" 1e-8, "1e-7" 1e-7, "1e-6" 1e-6, "1e-5" 1e-5, "1e-4" 1e-4, "1e-3" 1e-3, "1e-2" 1e-2, "1e-1" 1e-1)
set ytics ("15" 15, "20" 20, "25" 25, "30" 30, "35" 35, "40" 40)

set label "Epsilon" at 650,2.0 right
set label "Error (%)" at 0.92,85 left
set label "MNIST Multinomial" at 100,20 center font "HelveticaBold,15"

plot "multinomial-exp.out" u 1:2 t "Multinomial" w lp lw 2 lt 1 ps 2.0, 2.82 not w l lw 4 lt 2

