% Description: plot lowpass (rect)
% 
% Author: Peter Hosten



function plot_lowpass(Y,fg)
center_lowpass = ceil(numel(Y)/2+0.1);               % determine center of lowpass
size_lowpass   = 2*floor((numel(Y)-center_lowpass)*fg/0.5); % determine the size of the lowpass controlled by fg  
start_lowpass = center_lowpass-size_lowpass/2;       % index of rising edge    
end_lowpass   = center_lowpass+size_lowpass/2;       % index of falling edge    
f = ([0:numel(Y)-1]-numel(Y)/2)/numel(Y);            

% plot lowpass (rect)
plot(f([start_lowpass, start_lowpass]),[0,max(abs(Y))],'r');
plot(f(start_lowpass : end_lowpass),max(abs(Y))*ones(size_lowpass+1,1),'r');
plot(f([end_lowpass, end_lowpass]),[max(abs(Y)), 0],'r');