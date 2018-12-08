clc;clear all;close all;
% 1000 theta values from 0 to 2pi
thetaValues=linspace(0,2*pi,1000);
% 1000 spectra values. One for every theta value (ray)
spectra=zeros(1000,1);
% 1000 roh values from 0.05 to 0.95
rohValues = linspace(0.05,0.95,1000);

% x = round(rohValues .* cos(thetaValues) * 1023/range(rohValues .* cos(thetaValues)));
% y = round(rohValues .* sin(thetaValues) * 2047/range(rohValues .* sin(thetaValues)));
 

   
 x_max = max(x); x_min = min(x); x_range = range(x);
 y_max = max(y); y_min = min(y); y_range = range(y); 
 
 x_final = x + abs(x_min) + 1;
 y_final = y + abs(y_min) + 1; 
 
  
 