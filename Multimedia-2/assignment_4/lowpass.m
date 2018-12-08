% Description: lowpass basis band
%
%   The function sets all frequency components that are greater than the 
%   cutoff frequency to zero
%
%   Input:
%   Y         = (complex) input Signal
%   fg        = cutoff frequency
%   
%   Output:
%   Y_lowpass = filtered output signal
% 
% Author: Peter Hosten, Christopher Bulla

function Y_lowpass = lowpass(Y,fg)

% determine center index of lowpass
center_lowpass = ceil(numel(Y)/2+0.1);  

% determine the size of the lowpass controlled by fg   
size_lowpass   =  2*fg*size(Y,1);%YOUR TURN

% index of rising edge  
start_lowpass = center_lowpass - round(size_lowpass/2);%YOUR TURN  

 % index of falling edge
end_lowpass   =  center_lowpass + round(size_lowpass/2)-1;%YOUR TURN                                    

Y_lowpass = zeros(1, numel(Y)); 

 % set Fourier coefficients to zero, which are outside the lowpass range
Y_lowpass(start_lowpass:end_lowpass) = Y(start_lowpass:end_lowpass); %YOUR TURN
