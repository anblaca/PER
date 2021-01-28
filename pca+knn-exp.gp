#!/usr/bin/gnuplot -persist


set terminal postscript eps font "Helvetica,24"
set output "pca+knn-exp.eps"
set logscale xy
set xrange [0.9:710]
set yrange [1.7:100]
set xtics ("1" 1, "2" 2, "5" 5, "10" 10, "20" 20, "50" 50, "100" 100, "200" 200, "500" 500)
set ytics ("1" 1, "2" 2, "5" 5, "10" 10, "20" 20, "50" 50, "100" 100)

set label "Dimensionalidad" at 650,2.0 right
set label "Error (%)" at 0.92,85 left
set label "MNIST Multinomial" at 100,20 center font "HelveticaBold,30"

plot "pca+knn-exp4.out" u 1:2 t "PCA" w lp lw 2 lt 1 ps 2.0, 2.82 not w l lw 4 lt 2

