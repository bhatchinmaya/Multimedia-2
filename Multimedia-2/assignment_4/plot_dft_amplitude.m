% Description: plot dft amplitude
% 
% Author: Peter Hosten



function plot_dft_ampitude(Y)
f = ([0:numel(Y)-1]-numel(Y)/2)/numel(Y);       
stem(f,abs(Y))
ylabel('amplitude')
xlabel('f')
title('DFT')
