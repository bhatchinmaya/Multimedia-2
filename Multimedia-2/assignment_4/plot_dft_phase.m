% Description: plot dft phase
% 
% Author: Peter Hosten


function plot_dft_phase(Y)
f = ([0:numel(Y)-1]-numel(Y)/2)/numel(Y);

stem(f,angle(Y))
title('DFT')
ylabel('phase')
xlabel('f')